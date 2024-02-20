import 'dart:convert';
import 'dart:typed_data';
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

class ExpertiseOfPersonApifyCall {
  static Future<ApiCallResponse> call({
    String? linkedinUrl = '',
    String? uid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "uid": "${uid}",
  "linkedin_profile_url": "${linkedinUrl}",
  "apify_token": "apify_api_yJdWtJercdZZdUUWDXlgDvniyTzSdI0lWKBg"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Expertise of Person Apify',
      apiUrl: 'https://userkeywordsdata-continuous-5qpvtpji4a-uc.a.run.app',
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
      apiUrl:
          'https://userkeywordsdata-proxycurl-continuous-5qpvtpji4a-uc.a.run.app',
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
    return ApiManager.instance.makeApiCall(
      callName: 'LinkedinTokens',
      apiUrl: 'https://www.linkedin.com/oauth/v2/accessToken',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'grant_type': "authorization_code",
        'code': authCodeRecieved,
        'client_id': "867aib47yndmjx",
        'client_secret': "fDcszmfWhSHUW2xe",
        'redirect_uri':
            "https://us-central1-inspire-ai-40690.cloudfunctions.net/linkedinAuth",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class InspireAIContentFromTopicsCall {
  static Future<ApiCallResponse> call({
    String? topic = '',
    String? brandVoice = '',
    int? numberOfWords,
    String? uid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "topic": "${topic}",
  "brand_voice": "${brandVoice}",
  "number_of_words": ${numberOfWords},
  "context_size": ${numberOfWords},
  "similarity_top_k": 1,
  "apify_token": "apify_api_yJdWtJercdZZdUUWDXlgDvniyTzSdI0lWKBg",
  "uid": "${uid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'InspireAI Content from Topics',
      apiUrl: 'https://rag-pipeline-continuous-5qpvtpji4a-uc.a.run.app',
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

class InspireAIContentFromContextCall {
  static Future<ApiCallResponse> call({
    String? topic = '',
    String? brandVoice = '',
    String? context = '',
    String? insights = '',
    int? numberOfWords,
    String? uid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "topic": "${topic}",
  "brand_voice": "${brandVoice}",
  "context": "${context}",
  "insights": "${insights}",
  "number_of_words": ${numberOfWords},
  "uid": "${uid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'InspireAI Content from Context',
      apiUrl: 'https://content-from-context-continuous-5qpvtpji4a-uc.a.run.app',
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

  static String? documentID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.document_id''',
      ));
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
      apiUrl: 'https://keyword-finder-continuous-5qpvtpji4a-uc.a.run.app',
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
