import 'dart:convert';
import 'dart:typed_data';
import '../cloud_functions/cloud_functions.dart';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'InspirePrivateAPIs';

/// Start LinkedInData Group Code

class LinkedInDataGroup {
  static String baseUrl = 'https://api.linkedin.com/v2';
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
    return ApiManager.instance.makeApiCall(
      callName: 'Linkedin Profile Details',
      apiUrl: '${LinkedInDataGroup.baseUrl}/me',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class LinkedinProfilePictureCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Linkedin Profile Picture',
      apiUrl:
          '${LinkedInDataGroup.baseUrl}/me?projection=(id,profilePicture(displayImage~digitalmediaAsset:playableStreams))',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
    return ApiManager.instance.makeApiCall(
      callName: 'First degree connections size',
      apiUrl: '${LinkedInDataGroup.baseUrl}/connections/${personUrn}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
    return ApiManager.instance.makeApiCall(
      callName: 'Find Other People',
      apiUrl: '${LinkedInDataGroup.baseUrl}/people/(id:${personUrn})',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'X-RestLi-Protocol-Version': '2.0.0',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End LinkedInData Group Code

/// Start linkedinPost Group Code

class LinkedinPostGroup {
  static String baseUrl = 'https://api.linkedin.com/rest';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer [access_token]',
    'LinkedIn-Version': '202308',
  };
  static PostTextCall postTextCall = PostTextCall();
  static GetPostCommentsCall getPostCommentsCall = GetPostCommentsCall();
  static GetPostLikesCall getPostLikesCall = GetPostLikesCall();
  static GetSocialMetadataCall getSocialMetadataCall = GetSocialMetadataCall();
  static PeopleCall peopleCall = PeopleCall();
}

class PostTextCall {
  Future<ApiCallResponse> call({
    String? personUrn = '',
    String? postText = '',
    String? accessToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "author": "${personUrn}",
  "commentary": "${postText}",
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
      callName: 'Post Text',
      apiUrl: '${LinkedinPostGroup.baseUrl}/posts',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
        'LinkedIn-Version': '202308',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
    return ApiManager.instance.makeApiCall(
      callName: 'get post comments',
      apiUrl: '${LinkedinPostGroup.baseUrl}/socialActions/${postUrn}/comments',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
        'LinkedIn-Version': '202308',
      },
      params: {
        'count': 200,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
    return ApiManager.instance.makeApiCall(
      callName: 'get post likes',
      apiUrl: '${LinkedinPostGroup.baseUrl}/socialActions/${postUrn}/likes',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
        'LinkedIn-Version': '202308',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
    return ApiManager.instance.makeApiCall(
      callName: 'Get SocialMetadata',
      apiUrl: '${LinkedinPostGroup.baseUrl}/socialMetadata/${postUrn}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
        'LinkedIn-Version': '202308',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class PeopleCall {
  Future<ApiCallResponse> call({
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'people',
      apiUrl: '${LinkedinPostGroup.baseUrl}/people',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
        'LinkedIn-Version': '202308',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End linkedinPost Group Code

/// Start InspireAI Backend Group Code

class InspireAIBackendGroup {
  static String baseUrl = 'https://api.platform.theinspireai.com';
  static Map<String, String> headers = {};
}

/// End InspireAI Backend Group Code

class ExpertiseOfPersonApifyCall {
  static Future<ApiCallResponse> call({
    String? linkedinUrl = '',
    String? uid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "uid": "${uid}",
  "linkedin_profile_url": "${linkedinUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Expertise of Person Apify',
      apiUrl: 'https://api.platform.theinspireai.com/ls/linkedin_scrapper',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ExpertiseOfPersonProxycurlCall {
  static Future<ApiCallResponse> call({
    String? linkedinUrl = '',
    String? uid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "uid": "${uid}",
  "linkedin_profile_url": "${linkedinUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Expertise of Person Proxycurl',
      apiUrl: 'https://api.platform.theinspireai.com/ls/linkedin_scrapper',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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
  "insight": "${insight}",
  "type": "${contentType}",
  "topic": "${topic}",
  "anthropic_api_key": "${anthropicKey}",
  "brand_voice": "${brandVoice}",
  "number_of_words": ${numberOfWords},
  "context_size": ${numberOfWords},
  "similarity_top_k": 1,
  "uid": "${uid}",
  "notification_title": "${notificationTitle}",
  "notification_text": "${notificationText}",
  "notification_image_url": "${notificationImageUrl}",
  "initial_page_name": "${initialPageName}",
  "notificationSound": "default"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'InspireAI Content from Topics',
      apiUrl: 'https://api.platform.theinspireai.com/cft/content_from_topic',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
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
  "insight": "${insight}",
  "type": "${contentType}",
  "anthropic_api_key": "${anthropicKey}",
  "topic": "${topic}",
  "brand_voice": "${brandVoice}",
  "number_of_words": ${numberOfWords},
  "context": "${context}",
  "similarity_top_k": 1,
  "uid": "${uid}",
  "broad_domain": "${broadDomain}",
  "notification_title": "${notificationTitle}",
  "notification_text": "${notificationText}",
  "notification_image_url": "${notificationImageUrl}",
  "initial_page_name": "${initialPageName}",
  "notificationSound": "default"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'InspireAI Content from Contxt',
      apiUrl: 'https://api.platform.theinspireai.com/cfc/content_from_context',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class InspireAIKeywordAndArticlesCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
    List<String>? expertiseAreasList,
  }) async {
    final expertiseAreas = _serializeList(expertiseAreasList);

    final ffApiRequestBody = '''
{
  "uid": "${uid}",
  "list_of_expertise_areas": ${expertiseAreas}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'InspireAI Keyword and articles',
      apiUrl: 'https://api.platform.theinspireai.com/ls/linkedin_scrapper',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
