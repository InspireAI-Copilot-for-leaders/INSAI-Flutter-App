// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LinkedinPreferedLocaleStruct extends FFFirebaseStruct {
  LinkedinPreferedLocaleStruct({
    String? country,
    String? language,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _country = country,
        _language = language,
        super(firestoreUtilData);

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;
  bool hasLanguage() => _language != null;

  static LinkedinPreferedLocaleStruct fromMap(Map<String, dynamic> data) =>
      LinkedinPreferedLocaleStruct(
        country: data['country'] as String?,
        language: data['language'] as String?,
      );

  static LinkedinPreferedLocaleStruct? maybeFromMap(dynamic data) => data is Map
      ? LinkedinPreferedLocaleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'country': _country,
        'language': _language,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'language': serializeParam(
          _language,
          ParamType.String,
        ),
      }.withoutNulls;

  static LinkedinPreferedLocaleStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LinkedinPreferedLocaleStruct(
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        language: deserializeParam(
          data['language'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LinkedinPreferedLocaleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LinkedinPreferedLocaleStruct &&
        country == other.country &&
        language == other.language;
  }

  @override
  int get hashCode => const ListEquality().hash([country, language]);
}

LinkedinPreferedLocaleStruct createLinkedinPreferedLocaleStruct({
  String? country,
  String? language,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LinkedinPreferedLocaleStruct(
      country: country,
      language: language,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LinkedinPreferedLocaleStruct? updateLinkedinPreferedLocaleStruct(
  LinkedinPreferedLocaleStruct? linkedinPreferedLocale, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    linkedinPreferedLocale
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLinkedinPreferedLocaleStructData(
  Map<String, dynamic> firestoreData,
  LinkedinPreferedLocaleStruct? linkedinPreferedLocale,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (linkedinPreferedLocale == null) {
    return;
  }
  if (linkedinPreferedLocale.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      linkedinPreferedLocale.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final linkedinPreferedLocaleData = getLinkedinPreferedLocaleFirestoreData(
      linkedinPreferedLocale, forFieldValue);
  final nestedData =
      linkedinPreferedLocaleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      linkedinPreferedLocale.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLinkedinPreferedLocaleFirestoreData(
  LinkedinPreferedLocaleStruct? linkedinPreferedLocale, [
  bool forFieldValue = false,
]) {
  if (linkedinPreferedLocale == null) {
    return {};
  }
  final firestoreData = mapToFirestore(linkedinPreferedLocale.toMap());

  // Add any Firestore field values
  linkedinPreferedLocale.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLinkedinPreferedLocaleListFirestoreData(
  List<LinkedinPreferedLocaleStruct>? linkedinPreferedLocales,
) =>
    linkedinPreferedLocales
        ?.map((e) => getLinkedinPreferedLocaleFirestoreData(e, true))
        .toList() ??
    [];
