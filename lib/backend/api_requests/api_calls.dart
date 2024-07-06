import 'dart:convert';
import '../cloud_functions/cloud_functions.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'InspirePrivateAPIs';

/// Start LinkedInData Group Code

class LinkedInDataGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://api.linkedin.com/v2';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [auth_token]',
  };
  static LinkedinProfileDetailsCall linkedinProfileDetailsCall =
      LinkedinProfileDetailsCall();
  static LinkedinProfilePictureCall linkedinProfilePictureCall =
      LinkedinProfilePictureCall();
  static FirstDegreeConnectionsSizeCall firstDegreeConnectionsSizeCall =
      FirstDegreeConnectionsSizeCall();
  static FindOtherPeopleCall findOtherPeopleCall = FindOtherPeopleCall();
}

class LinkedinProfileDetailsCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = LinkedInDataGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Linkedin Profile Details',
      apiUrl: '$baseUrl/me',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LinkedinProfilePictureCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = LinkedInDataGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Linkedin Profile Picture',
      apiUrl:
          '$baseUrl/me?projection=(id,profilePicture(displayImage~digitalmediaAsset:playableStreams))',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? profilePictureList(dynamic response) => (getJsonField(
        response,
        r'''$.profilePicture["displayImage~"]..identifiers..identifier''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? profilePictureURN(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.profilePicture.displayImage''',
      ));
}

class FirstDegreeConnectionsSizeCall {
  Future<ApiCallResponse> call({
    String? personUrn = '',
    String? authToken = '',
  }) async {
    final baseUrl = LinkedInDataGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'First degree connections size',
      apiUrl: '$baseUrl/connections/$personUrn',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? connects(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.firstDegreeSize''',
      ));
}

class FindOtherPeopleCall {
  Future<ApiCallResponse> call({
    String? personUrn = '',
    String? authToken = '',
  }) async {
    final baseUrl = LinkedInDataGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Find Other People',
      apiUrl: '$baseUrl/people/(id:$personUrn)',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $authToken',
        'X-RestLi-Protocol-Version': '2.0.0',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End LinkedInData Group Code

/// Start linkedinPost Group Code

class LinkedinPostGroup {
  static String getBaseUrl({
    String? accessToken = '',
  }) =>
      'https://api.linkedin.com/rest';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [access_token]',
    'LinkedIn-Version': '202402',
  };
  static PostOnlyTextCall postOnlyTextCall = PostOnlyTextCall();
  static PostTextWithMultipleImagesCall postTextWithMultipleImagesCall =
      PostTextWithMultipleImagesCall();
  static PostTextWithMediaCall postTextWithMediaCall = PostTextWithMediaCall();
  static PostTextWithPollCall postTextWithPollCall = PostTextWithPollCall();
  static GetPostCommentsCall getPostCommentsCall = GetPostCommentsCall();
  static GetPostLikesCall getPostLikesCall = GetPostLikesCall();
  static GetSocialMetadataCall getSocialMetadataCall = GetSocialMetadataCall();
  static PeopleCall peopleCall = PeopleCall();
}

class PostOnlyTextCall {
  Future<ApiCallResponse> call({
    String? personUrn = '',
    String? postText = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LinkedinPostGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "author": "$personUrn",
  "commentary": "$postText",
  "visibility": "PUBLIC",
  "distribution": {
    "feedDistribution": "MAIN_FEED",
    "targetEntities": [],
    "thirdPartyDistributionChannels": []
  },
  "lifecycleState": "PUBLISHED",
  "isReshareDisabledByAuthor": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postOnlyText',
      apiUrl: '$baseUrl/posts',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
        'LinkedIn-Version': '202402',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostTextWithMultipleImagesCall {
  Future<ApiCallResponse> call({
    String? personUrn = '',
    String? postText = '',
    dynamic imagesJson,
    String? accessToken = '',
  }) async {
    final baseUrl = LinkedinPostGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final images = _serializeJson(imagesJson, true);
    final ffApiRequestBody = '''
{
  "author": "$personUrn",
  "commentary": "$postText",
  "visibility": "PUBLIC",
  "distribution": {
    "feedDistribution": "MAIN_FEED",
    "targetEntities": [],
    "thirdPartyDistributionChannels": []
  },
  "lifecycleState": "PUBLISHED",
  "isReshareDisabledByAuthor": false,
  "content": {
    "multiImage": {
      "images": $images
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postTextWithMultipleImages',
      apiUrl: '$baseUrl/posts',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
        'LinkedIn-Version': '202402',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostTextWithMediaCall {
  Future<ApiCallResponse> call({
    String? personUrn = '',
    String? postText = '',
    String? mediaId = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LinkedinPostGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final ffApiRequestBody = '''
{
  "author": "$personUrn",
  "commentary": "$postText",
  "visibility": "PUBLIC",
  "distribution": {
    "feedDistribution": "MAIN_FEED",
    "targetEntities": [],
    "thirdPartyDistributionChannels": []
  },
  "content": {
    "media": {
      "title": "title of the video",
      "id": "$mediaId"
    }
  },
  "lifecycleState": "PUBLISHED",
  "isReshareDisabledByAuthor": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postTextWithMedia',
      apiUrl: '$baseUrl/posts',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
        'LinkedIn-Version': '202402',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PostTextWithPollCall {
  Future<ApiCallResponse> call({
    String? personUrn = '',
    String? postText = '',
    String? question = '',
    dynamic optionsJson,
    String? duration = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LinkedinPostGroup.getBaseUrl(
      accessToken: accessToken,
    );

    final options = _serializeJson(optionsJson, true);
    final ffApiRequestBody = '''
{
  "author": "$personUrn",
  "commentary": "$postText",
  "visibility": "PUBLIC",
  "distribution": {
    "feedDistribution": "MAIN_FEED",
    "targetEntities": [],
    "thirdPartyDistributionChannels": []
  },
  "content": {
    "poll": {
      "question": "$question",
      "options": [
        $options
      ],
      "settings": {
        "duration": "$duration"
      }
    }
  },
  "lifecycleState": "PUBLISHED",
  "isReshareDisabledByAuthor": false
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postTextWithPoll',
      apiUrl: '$baseUrl/posts',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
        'LinkedIn-Version': '202402',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPostCommentsCall {
  Future<ApiCallResponse> call({
    String? postUrn = '',
    String? personUrn = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LinkedinPostGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get post comments',
      apiUrl: '$baseUrl/socialActions/$postUrn/comments',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
        'LinkedIn-Version': '202402',
      },
      params: {
        'count': 200,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? commentsCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.paging.total''',
      ));
  List<String>? commentsText(dynamic response) => (getJsonField(
        response,
        r'''$.elements[:].message.text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? commentedBy(dynamic response) => (getJsonField(
        response,
        r'''$.elements[:].created.actor''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? commentURNs(dynamic response) => (getJsonField(
        response,
        r'''$.elements[:].commentUrn''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? createdTime(dynamic response) => (getJsonField(
        response,
        r'''$.elements[:].created.time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? lastModifiedTime(dynamic response) => (getJsonField(
        response,
        r'''$.elements[:].lastModified.time''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetPostLikesCall {
  Future<ApiCallResponse> call({
    String? postUrn = '',
    String? personUrn = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LinkedinPostGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'get post likes',
      apiUrl: '$baseUrl/socialActions/$postUrn/likes',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
        'LinkedIn-Version': '202402',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? likesCount(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.paging.total''',
      ));
}

class GetSocialMetadataCall {
  Future<ApiCallResponse> call({
    String? postUrn = '',
    String? accessToken = '',
  }) async {
    final baseUrl = LinkedinPostGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get SocialMetadata',
      apiUrl: '$baseUrl/socialMetadata/$postUrn',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
        'LinkedIn-Version': '202402',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PeopleCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    final baseUrl = LinkedinPostGroup.getBaseUrl(
      accessToken: accessToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'people',
      apiUrl: '$baseUrl/people',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
        'LinkedIn-Version': '202402',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End linkedinPost Group Code

class ExpertiseOfPersonCall {
  static Future<ApiCallResponse> call({
    String? linkedinUrl = '',
    String? uid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "uid": "$uid",
  "linkedin_profile_url": "$linkedinUrl"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Expertise of Person',
      apiUrl:
          'https://inspire-ai-backend-aws-main-5qpvtpji4a-el.a.run.app/ls/linkedin_scrapper',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LinkedinTokensCall {
  static Future<ApiCallResponse> call({
    String? authCodeRecieved = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'LinkedinTokensCall',
        'variables': {
          'authCodeRecieved': authCodeRecieved,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class LinkedinRefreshTokenCall {
  static Future<ApiCallResponse> call({
    String? refreshToken = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'LinkedinRefreshTokenCall',
        'variables': {
          'refreshToken': refreshToken,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }

  static String? accessToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
  static int? accessExpiry(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.expires_in''',
      ));
  static String? refreshToken(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.refresh_token''',
      ));
  static int? refreshExpiry(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.refresh_token_expires_in''',
      ));
}

class InspireAIContentFromTopicsCall {
  static Future<ApiCallResponse> call({
    String? topic = '',
    String? brandVoice = '',
    int? numberOfWords,
    String? uid = '',
    String? insight = '',
    String? contentType = '',
    String? notificationTitle = '',
    String? notificationText = '',
    String? notificationImageUrl = '',
    String? initialPageName = '',
    String? anthropicKey = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insight": "$insight",
  "type": "$contentType",
  "topic": "$topic",
  "anthropic_api_key": "$anthropicKey",
  "persona": "$brandVoice",
  "number_of_words": $numberOfWords,
  "context_size": $numberOfWords,
  "similarity_top_k": 1,
  "uid": "$uid",
  "notification_title": "$notificationTitle",
  "notification_text": "$notificationText",
  "notification_image_url": "$notificationImageUrl",
  "initial_page_name": "$initialPageName",
  "notificationSound": "default"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'InspireAI Content from Topics',
      apiUrl:
          'https://inspire-ai-backend-aws-main-5qpvtpji4a-el.a.run.app/cft/content_from_topic',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? createdDocId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.document_id''',
      ));
}

class InspireAIContentFromContxtCall {
  static Future<ApiCallResponse> call({
    String? topic = '',
    String? brandVoice = '',
    int? numberOfWords,
    String? uid = '',
    String? insight = '',
    String? contentType = '',
    String? broadDomain = '',
    String? notificationTitle = '',
    String? notificationText = '',
    String? notificationImageUrl = '',
    String? initialPageName = '',
    String? context = '',
    String? anthropicKey = '',
  }) async {
    final ffApiRequestBody = '''
{
  "insight": "$insight",
  "type": "$contentType",
  "anthropic_api_key": "$anthropicKey",
  "topic": "$topic",
  "persona": "$brandVoice",
  "number_of_words": $numberOfWords,
  "context": "$context",
  "uid": "$uid",
  "broad_domain": "$broadDomain",
  "notification_title": "$notificationTitle",
  "notification_text": "$notificationText",
  "notification_image_url": "$notificationImageUrl",
  "initial_page_name": "$initialPageName",
  "notificationSound": "default"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'InspireAI Content from Contxt',
      apiUrl:
          'https://inspire-ai-backend-aws-main-5qpvtpji4a-el.a.run.app/cfc/content_from_context',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? createdDocId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.document_id''',
      ));
}

class GetImageUploadUrlFromLinkedinCall {
  static Future<ApiCallResponse> call({
    String? urn = '',
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "initializeUploadRequest": {
    "owner": "$urn"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getImageUploadUrlFromLinkedin',
      apiUrl: 'https://api.linkedin.com/rest/images?action=initializeUpload',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
        'LinkedIn-Version': '202402',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? urlExpiryIn(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.value.uploadUrlExpiresAt''',
      ));
  static String? uploadURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.value.uploadUrl''',
      ));
  static String? imageURN(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.value.image''',
      ));
}

class GetDocUploadUrlFromLinkedinCall {
  static Future<ApiCallResponse> call({
    String? urn = '',
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "initializeUploadRequest": {
    "owner": "$urn"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getDocUploadUrlFromLinkedin',
      apiUrl: 'https://api.linkedin.com/rest/documents?action=initializeUpload',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
        'LinkedIn-Version': '202402',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? urlExpiryIn(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.value.uploadUrlExpiresAt''',
      ));
  static String? uploadURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.value.uploadUrl''',
      ));
  static String? docURN(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.value.document''',
      ));
}

class UploadImageToLinkedinCall {
  static Future<ApiCallResponse> call({
    String? accessToken = '',
    String? uploadUrl = '',
    String? imageToBeUploaded = '',
  }) async {
    final ffApiRequestBody = '''
<p>"$imageToBeUploaded"</p>''';
    return ApiManager.instance.makeApiCall(
      callName: 'uploadImageToLinkedin',
      apiUrl: '$uploadUrl',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'LinkedIn-Version': '202402',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadDocToLinkedinCall {
  static Future<ApiCallResponse> call({
    String? accessToken = '',
    String? uploadUrl = '',
    String? docToBeUploaded = '',
  }) async {
    final ffApiRequestBody = '''
<p>"$docToBeUploaded"</p>''';
    return ApiManager.instance.makeApiCall(
      callName: 'uploadDocToLinkedin',
      apiUrl: '$uploadUrl',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'LinkedIn-Version': '202402',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DomainThoughtLeaderhipCampaignCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
    List<String>? expertiseareasList,
    String? campaignId = '',
    int? noOfPosts,
  }) async {
    final expertiseareas = _serializeList(expertiseareasList);

    final ffApiRequestBody = '''
{
  "uid": "$uid",
  "expertise_areas": $expertiseareas,
  "campaign_id": "$campaignId",
  "num_of_posts": $noOfPosts
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Domain Thought leaderhip Campaign',
      apiUrl:
          'https://campaign-5qpvtpji4a-em.a.run.app/campaign/domain_thought_leadership',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CompanyThoughtLeaderhipCampaignCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
    String? companyName = '',
    String? campaignId = '',
    int? noOfPosts,
  }) async {
    final ffApiRequestBody = '''
{
  "uid": "$uid",
  "company_name": "$companyName",
  "campaign_id": "$campaignId",
  "num_of_posts": $noOfPosts
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Company Thought leaderhip Campaign',
      apiUrl:
          'https://campaign-5qpvtpji4a-em.a.run.app/campaign/company_thought_leadership',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CompanyThoughtLeadershipWithDataCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
    String? companyName = '',
    String? campaignId = '',
    int? noOfPosts,
    List<String>? dataList,
    String? dataType = '',
  }) async {
    final data = _serializeList(dataList);

    final ffApiRequestBody = '''
{
  "uid": "$uid",
  "company_name": "$companyName",
  "campaign_id": "$campaignId",
  "num_of_posts": $noOfPosts,
  "data": $data,
  "data_type": "$dataType"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Company Thought leadership with data ',
      apiUrl:
          'https://campaign-5qpvtpji4a-em.a.run.app/campaign/create_company_thought_leadership_content_from_data_source',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CurrentEventsCampaignCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
    String? expertiseArea = '',
    String? campaignId = '',
    int? noOfPosts,
  }) async {
    final ffApiRequestBody = '''
{
  "uid": "$uid",
  "domain": "$expertiseArea",
  "campaign_id": "$campaignId",
  "num_of_posts": $noOfPosts
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Current events Campaign',
      apiUrl:
          'https://campaign-5qpvtpji4a-em.a.run.app/campaign/trends_commentry',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
