const app = require("express")();
const admin = require("firebase-admin");
const functions = require("firebase-functions");

app.get("/", async (req, res) => {
  const dynamicLink =
    "https://app.theinspireai.com?apn=com.panscience.inspireai&ibi=com.pansciece.inspireai&link=";
  const targetUrl = "https://app.theinspireai.com/linkedinAuth";

  // Get the 'code' from the query and append it as a path parameter
  const code = req.query.code;
  const newUrl = targetUrl + "/:" + code;

  // DEBUG: Create a new document in the 'posts' collection
  const docRef = admin.firestore().collection("posts").doc();

  // Create the final dynamic link with the encoded URL
  const finalDynamicLink = dynamicLink + encodeURIComponent(newUrl);

  // DEBUG: Add the parameters to the document
  await docRef.set({ params: req.query, url: finalDynamicLink });

  res.redirect(finalDynamicLink);
});

exports.linkedinAuth = functions.https.onRequest(app);
