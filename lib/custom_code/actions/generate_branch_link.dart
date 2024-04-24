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

Future<String> generateBranchLink(
  BuildContext context,
  String? title,
  String? description,
  String? imageUrl,
) async {
  final branchUniversalObject = BranchUniversalObject(
    canonicalIdentifier: 'flutter/branch',
    title: title ?? 'Default Title',
    contentDescription: description ?? 'Default Description',
    imageUrl: imageUrl ?? 'image.png',
    contentMetadata: BranchContentMetaData()
      ..addCustomMetadata('custom_data', 'test'),
    publiclyIndex: true,
    locallyIndex: true,
  );

  final branchLinkProperties = BranchLinkProperties(
    channel: 'facebook',
    feature: 'sharing',
    campaign: 'content_launch',
    stage: 'new_user',
    tags: ['flutter', 'branch', 'tutorial'],
    // Add control parameters if needed
  );

  try {
    final BranchResponse response = await FlutterBranchSdk.getShortUrl(
      buo: branchUniversalObject,
      linkProperties: branchLinkProperties,
    );
    if (response.success) {
      final String linkUrl = response.result;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Branch link generated: $linkUrl')),
      );
      return linkUrl;
    } else {
      final String errorMessage = response.errorMessage;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to generate link: $errorMessage')),
      );
      return 'Error generating link';
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to generate link: $e')),
    );
    return 'Error generating link';
  }
}
