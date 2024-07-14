// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_uxcam/flutter_uxcam.dart';

Future initUxcam() async {
  // Add your function code here!
  FlutterUxcam
      .optIntoSchematicRecordings(); // Confirm that you have user permission for screen recording
  FlutterUxConfig config = FlutterUxConfig(
      userAppKey: "veq4lh29k9qkq4b", enableAutomaticScreenNameTagging: false);
  FlutterUxcam.startWithConfiguration(config);
}
