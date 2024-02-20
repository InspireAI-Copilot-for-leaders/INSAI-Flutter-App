// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IdentifiersStruct extends FFFirebaseStruct {
  IdentifiersStruct({
    String? identifier,
    int? identifierExpiresInSeconds,
    String? mediaType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _identifier = identifier,
        _identifierExpiresInSeconds = identifierExpiresInSeconds,
        _mediaType = mediaType,
        super(firestoreUtilData);

  // "identifier" field.
  String? _identifier;
  String get identifier => _identifier ?? '';
  set identifier(String? val) => _identifier = val;
  bool hasIdentifier() => _identifier != null;

  // "identifierExpiresInSeconds" field.
  int? _identifierExpiresInSeconds;
  int get identifierExpiresInSeconds => _identifierExpiresInSeconds ?? 0;
  set identifierExpiresInSeconds(int? val) => _identifierExpiresInSeconds = val;
  void incrementIdentifierExpiresInSeconds(int amount) =>
      _identifierExpiresInSeconds = identifierExpiresInSeconds + amount;
  bool hasIdentifierExpiresInSeconds() => _identifierExpiresInSeconds != null;

  // "mediaType" field.
  String? _mediaType;
  String get mediaType => _mediaType ?? '';
  set mediaType(String? val) => _mediaType = val;
  bool hasMediaType() => _mediaType != null;

  static IdentifiersStruct fromMap(Map<String, dynamic> data) =>
      IdentifiersStruct(
        identifier: data['identifier'] as String?,
        identifierExpiresInSeconds:
            castToType<int>(data['identifierExpiresInSeconds']),
        mediaType: data['mediaType'] as String?,
      );

  static IdentifiersStruct? maybeFromMap(dynamic data) => data is Map
      ? IdentifiersStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'identifier': _identifier,
        'identifierExpiresInSeconds': _identifierExpiresInSeconds,
        'mediaType': _mediaType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'identifier': serializeParam(
          _identifier,
          ParamType.String,
        ),
        'identifierExpiresInSeconds': serializeParam(
          _identifierExpiresInSeconds,
          ParamType.int,
        ),
        'mediaType': serializeParam(
          _mediaType,
          ParamType.String,
        ),
      }.withoutNulls;

  static IdentifiersStruct fromSerializableMap(Map<String, dynamic> data) =>
      IdentifiersStruct(
        identifier: deserializeParam(
          data['identifier'],
          ParamType.String,
          false,
        ),
        identifierExpiresInSeconds: deserializeParam(
          data['identifierExpiresInSeconds'],
          ParamType.int,
          false,
        ),
        mediaType: deserializeParam(
          data['mediaType'],
          ParamType.String,
          false,
        ),
      );

  static IdentifiersStruct fromAlgoliaData(Map<String, dynamic> data) =>
      IdentifiersStruct(
        identifier: convertAlgoliaParam(
          data['identifier'],
          ParamType.String,
          false,
        ),
        identifierExpiresInSeconds: convertAlgoliaParam(
          data['identifierExpiresInSeconds'],
          ParamType.int,
          false,
        ),
        mediaType: convertAlgoliaParam(
          data['mediaType'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'IdentifiersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IdentifiersStruct &&
        identifier == other.identifier &&
        identifierExpiresInSeconds == other.identifierExpiresInSeconds &&
        mediaType == other.mediaType;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([identifier, identifierExpiresInSeconds, mediaType]);
}

IdentifiersStruct createIdentifiersStruct({
  String? identifier,
  int? identifierExpiresInSeconds,
  String? mediaType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IdentifiersStruct(
      identifier: identifier,
      identifierExpiresInSeconds: identifierExpiresInSeconds,
      mediaType: mediaType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IdentifiersStruct? updateIdentifiersStruct(
  IdentifiersStruct? identifiers, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    identifiers
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIdentifiersStructData(
  Map<String, dynamic> firestoreData,
  IdentifiersStruct? identifiers,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (identifiers == null) {
    return;
  }
  if (identifiers.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && identifiers.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final identifiersData =
      getIdentifiersFirestoreData(identifiers, forFieldValue);
  final nestedData =
      identifiersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = identifiers.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIdentifiersFirestoreData(
  IdentifiersStruct? identifiers, [
  bool forFieldValue = false,
]) {
  if (identifiers == null) {
    return {};
  }
  final firestoreData = mapToFirestore(identifiers.toMap());

  // Add any Firestore field values
  identifiers.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIdentifiersListFirestoreData(
  List<IdentifiersStruct>? identifierss,
) =>
    identifierss?.map((e) => getIdentifiersFirestoreData(e, true)).toList() ??
    [];
