// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';

Future initBranchSDK() async {
  // Configure Branch SDK
  FlutterBranchSdk.initSession().listen((data) {
    if (data.containsKey('+clicked_branch_link') &&
        data['+clicked_branch_link'] == true) {
      // Handle deep link data
      print(
          '------------------------------------Link clicked----------------------------------------------');
      print('Custom string: ${data['custom_string']}');
      print('Custom number: ${data['custom_number']}');
      print('Custom bool: ${data['custom_bool']}');
      print('Custom list number: ${data['custom_list_number']}');
      print(
          '------------------------------------------------------------------------------------------------');
    }
  }, onError: (error) {
    // Handle errors
    print('Branch SDK Initialization Error: $error');
  });
}
