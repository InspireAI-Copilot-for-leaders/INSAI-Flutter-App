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

import 'dart:async';

import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';

Future<String> generateBranchLink(
  BuildContext context,
  String? title,
  String? description,
  String? imageUrl,
  String? campaign,
  String? channel,
  String? feature,
  String? key,
  List<String>? tags,
) async {
  final DateTime now = DateTime.now();
  final Uri currentUri = Uri.parse(
      'https://app.theinspireai.com${GoRouterState.of(context).uri.toString()}');

  String dateString =
      '${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}';

  BranchContentMetaData metadata = BranchContentMetaData()
    ..addCustomMetadata('custom_string', 'example_string')
    ..addCustomMetadata('custom_number', 123)
    ..addCustomMetadata('key', key)
    ..addCustomMetadata('custom_date_created', dateString);

  BranchUniversalObject branchUniversalObject = BranchUniversalObject(
    canonicalIdentifier: 'flutter/branch',
    title: title ?? 'title',
    contentMetadata: metadata,
    contentDescription: description ?? 'description',
    imageUrl: imageUrl ?? 'image.png',
    keywords: tags ?? [],
    publiclyIndex: true,
    locallyIndex: true,
    expirationDateInMilliSec:
        DateTime.now().add(const Duration(days: 365)).millisecondsSinceEpoch,
  );

  BranchLinkProperties linkProperties = BranchLinkProperties(
    channel: channel ?? 'app',
    feature: feature ?? 'sharing',
    campaign: campaign ?? 'example_campaign',
    stage: 'new user',
    tags: tags ?? ['flutter', 'branch', 'example'],
  )
    ..addControlParam('\$desktop_url', currentUri.toString())
    ..addControlParam('\$android_url', currentUri.toString())
    ..addControlParam('\$ios_url', currentUri.toString());

  BranchResponse response = await FlutterBranchSdk.getShortUrl(
    buo: branchUniversalObject,
    linkProperties: linkProperties,
  );

  if (response.success) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Link generated: ${response.result}')),
      );
    }
    return response.result; // Return the generated link
  } else {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Failed to generate link: ${response.errorCode} - ${response.errorMessage}')),
      );
    }
    return Future.error(
        'Failed to generate link: ${response.errorCode} - ${response.errorMessage}');
  }
}
