import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 100.0,
            height: 100.0,
            child: SpinKitRipple(
              color: FlutterFlowTheme.of(context).secondary,
              size: 100.0,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'LandingPage': ParameterData.none(),
  'auth_signupOrLogin': ParameterData.none(),
  'linkedinConnect': (data) async => ParameterData(
        allParams: {
          'connectSuccess': getParameter<bool>(data, 'connectSuccess'),
        },
      ),
  'phone_number_verify': ParameterData.none(),
  'forgot_pass': ParameterData.none(),
  'linkedinAuth': (data) async {
    final allParams = {
      'code': getParameter<String>(data, 'code'),
    };
    return ParameterData(
      requiredParams: {
        'code': serializeParam(
          allParams['code'],
          ParamType.String,
        ),
      },
      allParams: allParams,
    );
  },
  'brandVoice': ParameterData.none(),
  'discoverPage': ParameterData.none(),
  'articleDetails': (data) async => ParameterData(
        allParams: {
          'articleRef': getParameter<DocumentReference>(data, 'articleRef'),
          'articleTitle': getParameter<String>(data, 'articleTitle'),
          'articleContent': getParameter<String>(data, 'articleContent'),
          'articleDomain': getParameter<String>(data, 'articleDomain'),
          'articleDocument': await getDocumentParameter<ArticleRecord>(
              data, 'articleDocument', ArticleRecord.fromSnapshot),
        },
      ),
  'createWithInspireAI': (data) async => ParameterData(
        allParams: {
          'contextForContent': getParameter<String>(data, 'contextForContent'),
          'topicForContent': getParameter<String>(data, 'topicForContent'),
          'contentType': getParameter<String>(data, 'contentType'),
          'broadDomain': getParameter<String>(data, 'broadDomain'),
        },
      ),
  'viewOrEditPost': (data) async => ParameterData(
        allParams: {
          'postText': getParameter<String>(data, 'postText'),
          'postRef': getParameter<DocumentReference>(data, 'postRef'),
          'postTitle': getParameter<String>(data, 'postTitle'),
          'oneLinerIndex': getParameter<int>(data, 'oneLinerIndex'),
        },
      ),
  'otherLeaders': ParameterData.none(),
  'ProfileDetails': ParameterData.none(),
  'postDetailed': (data) async => ParameterData(
        allParams: {
          'postRef': getParameter<DocumentReference>(data, 'postRef'),
          'postText': getParameter<String>(data, 'postText'),
          'postURN': getParameter<String>(data, 'postURN'),
          'postedOn': getParameter<DateTime>(data, 'postedOn'),
        },
      ),
  'dashboard': ParameterData.none(),
  'storiesPage': (data) async => ParameterData(
        allParams: {
          'domain': getParameter<String>(data, 'domain'),
        },
      ),
  'support': ParameterData.none(),
  'postReview': (data) async => ParameterData(
        allParams: {
          'postRef': getParameter<DocumentReference>(data, 'postRef'),
        },
      ),
  'viewOrEditOneLiner': (data) async => ParameterData(
        allParams: {
          'postRef': getParameter<DocumentReference>(data, 'postRef'),
          'postTitle': getParameter<String>(data, 'postTitle'),
        },
      ),
  'editBrandVoice': ParameterData.none(),
  'allPostsOverview': ParameterData.none(),
  'campaigns': ParameterData.none(),
  'viewScheduledPost': (data) async => ParameterData(
        allParams: {
          'postDocument': await getDocumentParameter<ScheduledPostsRecord>(
              data, 'postDocument', ScheduledPostsRecord.fromSnapshot),
        },
      ),
  'payWall': ParameterData.none(),
  'accessRequested': ParameterData.none(),
  'expertiseAreaEdit': ParameterData.none(),
  'paymentSuccess': ParameterData.none(),
  'subsExpired': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
