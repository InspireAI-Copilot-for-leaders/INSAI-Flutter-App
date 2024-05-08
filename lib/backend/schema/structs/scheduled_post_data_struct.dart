// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScheduledPostDataStruct extends FFFirebaseStruct {
  ScheduledPostDataStruct({
    String? personUrn,
    String? accessToken,
    String? postText,
    String? imagesJson,
    String? mediaId,
    String? mediaTitle,
    String? question,
    String? optionsJson,
    String? duration,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _personUrn = personUrn,
        _accessToken = accessToken,
        _postText = postText,
        _imagesJson = imagesJson,
        _mediaId = mediaId,
        _mediaTitle = mediaTitle,
        _question = question,
        _optionsJson = optionsJson,
        _duration = duration,
        super(firestoreUtilData);

  // "personUrn" field.
  String? _personUrn;
  String get personUrn => _personUrn ?? '';
  set personUrn(String? val) => _personUrn = val;
  bool hasPersonUrn() => _personUrn != null;

  // "accessToken" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  set accessToken(String? val) => _accessToken = val;
  bool hasAccessToken() => _accessToken != null;

  // "postText" field.
  String? _postText;
  String get postText => _postText ?? '';
  set postText(String? val) => _postText = val;
  bool hasPostText() => _postText != null;

  // "imagesJson" field.
  String? _imagesJson;
  String get imagesJson => _imagesJson ?? '';
  set imagesJson(String? val) => _imagesJson = val;
  bool hasImagesJson() => _imagesJson != null;

  // "mediaId" field.
  String? _mediaId;
  String get mediaId => _mediaId ?? '';
  set mediaId(String? val) => _mediaId = val;
  bool hasMediaId() => _mediaId != null;

  // "mediaTitle" field.
  String? _mediaTitle;
  String get mediaTitle => _mediaTitle ?? '';
  set mediaTitle(String? val) => _mediaTitle = val;
  bool hasMediaTitle() => _mediaTitle != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;
  bool hasQuestion() => _question != null;

  // "optionsJson" field.
  String? _optionsJson;
  String get optionsJson => _optionsJson ?? '';
  set optionsJson(String? val) => _optionsJson = val;
  bool hasOptionsJson() => _optionsJson != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  set duration(String? val) => _duration = val;
  bool hasDuration() => _duration != null;

  static ScheduledPostDataStruct fromMap(Map<String, dynamic> data) =>
      ScheduledPostDataStruct(
        personUrn: data['personUrn'] as String?,
        accessToken: data['accessToken'] as String?,
        postText: data['postText'] as String?,
        imagesJson: data['imagesJson'] as String?,
        mediaId: data['mediaId'] as String?,
        mediaTitle: data['mediaTitle'] as String?,
        question: data['question'] as String?,
        optionsJson: data['optionsJson'] as String?,
        duration: data['duration'] as String?,
      );

  static ScheduledPostDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ScheduledPostDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'personUrn': _personUrn,
        'accessToken': _accessToken,
        'postText': _postText,
        'imagesJson': _imagesJson,
        'mediaId': _mediaId,
        'mediaTitle': _mediaTitle,
        'question': _question,
        'optionsJson': _optionsJson,
        'duration': _duration,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'personUrn': serializeParam(
          _personUrn,
          ParamType.String,
        ),
        'accessToken': serializeParam(
          _accessToken,
          ParamType.String,
        ),
        'postText': serializeParam(
          _postText,
          ParamType.String,
        ),
        'imagesJson': serializeParam(
          _imagesJson,
          ParamType.String,
        ),
        'mediaId': serializeParam(
          _mediaId,
          ParamType.String,
        ),
        'mediaTitle': serializeParam(
          _mediaTitle,
          ParamType.String,
        ),
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'optionsJson': serializeParam(
          _optionsJson,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.String,
        ),
      }.withoutNulls;

  static ScheduledPostDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ScheduledPostDataStruct(
        personUrn: deserializeParam(
          data['personUrn'],
          ParamType.String,
          false,
        ),
        accessToken: deserializeParam(
          data['accessToken'],
          ParamType.String,
          false,
        ),
        postText: deserializeParam(
          data['postText'],
          ParamType.String,
          false,
        ),
        imagesJson: deserializeParam(
          data['imagesJson'],
          ParamType.String,
          false,
        ),
        mediaId: deserializeParam(
          data['mediaId'],
          ParamType.String,
          false,
        ),
        mediaTitle: deserializeParam(
          data['mediaTitle'],
          ParamType.String,
          false,
        ),
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        optionsJson: deserializeParam(
          data['optionsJson'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.String,
          false,
        ),
      );

  static ScheduledPostDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ScheduledPostDataStruct(
        personUrn: convertAlgoliaParam(
          data['personUrn'],
          ParamType.String,
          false,
        ),
        accessToken: convertAlgoliaParam(
          data['accessToken'],
          ParamType.String,
          false,
        ),
        postText: convertAlgoliaParam(
          data['postText'],
          ParamType.String,
          false,
        ),
        imagesJson: convertAlgoliaParam(
          data['imagesJson'],
          ParamType.String,
          false,
        ),
        mediaId: convertAlgoliaParam(
          data['mediaId'],
          ParamType.String,
          false,
        ),
        mediaTitle: convertAlgoliaParam(
          data['mediaTitle'],
          ParamType.String,
          false,
        ),
        question: convertAlgoliaParam(
          data['question'],
          ParamType.String,
          false,
        ),
        optionsJson: convertAlgoliaParam(
          data['optionsJson'],
          ParamType.String,
          false,
        ),
        duration: convertAlgoliaParam(
          data['duration'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ScheduledPostDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ScheduledPostDataStruct &&
        personUrn == other.personUrn &&
        accessToken == other.accessToken &&
        postText == other.postText &&
        imagesJson == other.imagesJson &&
        mediaId == other.mediaId &&
        mediaTitle == other.mediaTitle &&
        question == other.question &&
        optionsJson == other.optionsJson &&
        duration == other.duration;
  }

  @override
  int get hashCode => const ListEquality().hash([
        personUrn,
        accessToken,
        postText,
        imagesJson,
        mediaId,
        mediaTitle,
        question,
        optionsJson,
        duration
      ]);
}

ScheduledPostDataStruct createScheduledPostDataStruct({
  String? personUrn,
  String? accessToken,
  String? postText,
  String? imagesJson,
  String? mediaId,
  String? mediaTitle,
  String? question,
  String? optionsJson,
  String? duration,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ScheduledPostDataStruct(
      personUrn: personUrn,
      accessToken: accessToken,
      postText: postText,
      imagesJson: imagesJson,
      mediaId: mediaId,
      mediaTitle: mediaTitle,
      question: question,
      optionsJson: optionsJson,
      duration: duration,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ScheduledPostDataStruct? updateScheduledPostDataStruct(
  ScheduledPostDataStruct? scheduledPostData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    scheduledPostData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addScheduledPostDataStructData(
  Map<String, dynamic> firestoreData,
  ScheduledPostDataStruct? scheduledPostData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (scheduledPostData == null) {
    return;
  }
  if (scheduledPostData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && scheduledPostData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final scheduledPostDataData =
      getScheduledPostDataFirestoreData(scheduledPostData, forFieldValue);
  final nestedData =
      scheduledPostDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = scheduledPostData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getScheduledPostDataFirestoreData(
  ScheduledPostDataStruct? scheduledPostData, [
  bool forFieldValue = false,
]) {
  if (scheduledPostData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(scheduledPostData.toMap());

  // Add any Firestore field values
  scheduledPostData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getScheduledPostDataListFirestoreData(
  List<ScheduledPostDataStruct>? scheduledPostDatas,
) =>
    scheduledPostDatas
        ?.map((e) => getScheduledPostDataFirestoreData(e, true))
        .toList() ??
    [];
