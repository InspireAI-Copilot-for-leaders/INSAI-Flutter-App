const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

const axios = require("axios");

function formatStringForLIJson(input) {
  let output = input
    .replace(/\\/g, "\\\\")
    .replace(/\n/g, "\\n")
    .replace(/\r/g, "\\r")
    .replace(/"/g, '\\"')
    .replace(/\(/g, "\\(")
    .replace(/\)/g, "\\)");

  output = output.replace(/#(\w+)/g, (match, p1) => `{hashtag|#|${p1}}`);

  return output;
}

// Utility function to make API call to LinkedIn for different post types
async function postToLinkedIn(postType, postData) {
  let apiUrl = `https://api.linkedin.com/v2/posts`;
  let ApiRequestBody;
  postData.postText = formatStringForLIJson(postData.postText); // Format the post text

  const headers = {
    "Content-Type": "application/json",
    Authorization: `Bearer ${postData.accessToken}`,
    "LinkedIn-Version": "202402",
  };

  switch (postType) {
    case "onlyText":
      ApiRequestBody = {
        author: postData.personUrn,
        commentary: postData.postText,
        visibility: "PUBLIC",
        distribution: {
          feedDistribution: "MAIN_FEED",
          targetEntities: [],
          thirdPartyDistributionChannels: [],
        },
        lifecycleState: "PUBLISHED",
        isReshareDisabledByAuthor: false,
      };
      break;
    case "multiImage":
      ApiRequestBody = {
        author: postData.personUrn,
        commentary: postData.postText,
        visibility: "PUBLIC",
        distribution: {
          feedDistribution: "MAIN_FEED",
          targetEntities: [],
          thirdPartyDistributionChannels: [],
        },
        lifecycleState: "PUBLISHED",
        isReshareDisabledByAuthor: false,
        content: {
          multiImage: {
            images: JSON.parse(postData.imagesJson),
          },
        },
      };
      break;
    case "singleImage":
      ApiRequestBody = {
        author: postData.personUrn,
        commentary: postData.postText,
        visibility: "PUBLIC",
        distribution: {
          feedDistribution: "MAIN_FEED",
          targetEntities: [],
          thirdPartyDistributionChannels: [],
        },
        content: {
          media: {
            title: postData.mediaTitle,
            id: postData.mediaId,
          },
        },
        lifecycleState: "PUBLISHED",
        isReshareDisabledByAuthor: false,
      };
    case "doc":
      ApiRequestBody = {
        author: postData.personUrn,
        commentary: postData.postText,
        visibility: "PUBLIC",
        distribution: {
          feedDistribution: "MAIN_FEED",
          targetEntities: [],
          thirdPartyDistributionChannels: [],
        },
        content: {
          media: {
            title: postData.mediaTitle,
            id: postData.mediaId,
          },
        },
        lifecycleState: "PUBLISHED",
        isReshareDisabledByAuthor: false,
      };
      break;
    case "poll":
      ApiRequestBody = {
        author: postData.personUrn,
        commentary: postData.postText,
        visibility: "PUBLIC",
        distribution: {
          feedDistribution: "MAIN_FEED",
          targetEntities: [],
          thirdPartyDistributionChannels: [],
        },
        content: {
          poll: {
            question: postData.question,
            options: JSON.parse(postData.optionsJson),
            settings: {
              duration: postData.duration,
            },
          },
        },
        lifecycleState: "PUBLISHED",
        isReshareDisabledByAuthor: false,
      };
      break;
    default:
      throw new Error("Unsupported post type");
  }

  try {
    const response = await axios.post(apiUrl, ApiRequestBody, { headers });
    return {
      data: response.data,
      linkedInId: response.headers["x-linkedin-id"],
    };
  } catch (error) {
    console.error("Failed to post on LinkedIn:", error);
    throw error;
  }
}

// Scheduled function that checks for posts every 5 minutes using cutoff times
exports.scheduleLinkedInPosts = functions.pubsub
  .schedule("every 1 minutes synchronized")
  .onRun(async (context) => {
    const now = new Date();
    const oneMinuteAgo = new Date(now.getTime() - 60000);

    const scheduledPostsRef = admin.firestore().collection("scheduled_posts");
    const snapshot = await scheduledPostsRef
      .where("timestamp", ">", admin.firestore.Timestamp.fromDate(oneMinuteAgo))
      .where("timestamp", "<=", admin.firestore.Timestamp.fromDate(now))
      .get();

    if (snapshot.empty) {
      console.log("No scheduled posts to publish.");
      return null;
    }

    snapshot.forEach(async (doc) => {
      const post = doc.data();
      // Exclude accessToken, personUrn, userRef
      const { accessToken, personUrn, userRef, ...postDataWithoutSensitive } =
        post;

      try {
        const result = await postToLinkedIn(post.postType, post);

        // Create a document in the subcollection after successful posting
        await post.userRef.collection("postedOnLinkedin").add({
          postText: post.postText,
          timestamp: admin.firestore.Timestamp.now(),
          response: result.data,
          linkedInId: result.linkedInId, // Store the LinkedIn ID
          postData: postDataWithoutSensitive, // Store filtered postData
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
