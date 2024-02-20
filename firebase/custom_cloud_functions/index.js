const admin = require("firebase-admin/app");
admin.initializeApp();

const linkedinAuth = require("./linkedin_auth.js");
exports.linkedinAuth = linkedinAuth.linkedinAuth;
