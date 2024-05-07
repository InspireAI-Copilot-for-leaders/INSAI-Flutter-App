const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

const axios = require("axios");

// Utility function to make API call to LinkedIn
async function postToLinkedIn(personUrn, postText, accessToken) {
  const apiUrl = `https://api.linkedin.com/v2/posts`;
  const data = {
    author: personUrn,
    commentary: postText,
    visibility: "PUBLIC",
    distribution: {
      feedDistribution: "MAIN_FEED",
      targetEntities: [],
      thirdPartyDistributionChannels: [],
    },
    lifecycleState: "PUBLISHED",
    isReshareDisabledByAuthor: false,
  };

  const headers = {
    "Content-Type": "application/json",
    Authorization: `Bearer ${accessToken}`,
    "LinkedIn-Version": "202402",
  };

  try {
    const response = await axios.post(apiUrl, data, { headers });
    return {
      data: response.data,
      linkedInId: response.headers["x-linkedin-id"], // Capture the LinkedIn ID header
    };
  } catch (error) {
    console.error("Failed to post on LinkedIn:", error);
    throw new Error("Failed to post on LinkedIn");
  }
}

// Scheduled function that checks for posts every 5 minutes using cutoff times
exports.scheduleLinkedInPosts = functions.pubsub
  .schedule("every 5 minutes synchronized")
  .onRun(async (context) => {
    const now = new Date();
    const fiveMinutesAgo = new Date(now.getTime() - 5 * 60000);

    const scheduledPostsRef = admin.firestore().collection("scheduled_posts");
    const snapshot = await scheduledPostsRef
      .where(
        "timestamp",
        ">",
        admin.firestore.Timestamp.fromDate(fiveMinutesAgo),
      )
      .where("timestamp", "<=", admin.firestore.Timestamp.fromDate(now))
      .get();

    if (snapshot.empty) {
      console.log("No scheduled posts to publish.");
      return null;
    }

    snapshot.forEach(async (doc) => {
      const post = doc.data();
      try {
        const result = await postToLinkedIn(
          post.personUrn,
          post.postText,
          post.accessToken,
        );

        // Create a document in the subcollection after successful posting
        const userRef = admin.firestore().collection("users").doc(post.userRef);
        await userRef.collection("postedOnlinkedin").add({
          postText: post.postText,
          timestamp: admin.firestore.Timestamp.now(),
          response: result.data,
          linkedInId: result.linkedInId, // Store the LinkedIn ID
        });

        // Optional: update the original scheduled post document
        await doc.ref.update({ status: "posted" });
        console.log("Post published on LinkedIn successfully.");
      } catch (error) {
        console.error("Error posting to LinkedIn:", error);
        // Optional: update the document to indicate failure
        await doc.ref.update({ status: "failed", error: `${error}` });
      }
    });
  });
