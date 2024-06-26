// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrefferedLocaleStruct extends FFFirebaseStruct {
  PrefferedLocaleStruct({
    LinkedinPreferedLocaleStruct? preferredLocale,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _preferredLocale = preferredLocale,
        super(firestoreUtilData);

  // "preferredLocale" field.
  LinkedinPreferedLocaleStruct? _preferredLocale;
  LinkedinPreferedLocaleStruct get preferredLocale =>
      _preferredLocale ?? LinkedinPreferedLocaleStruct();
  set preferredLocale(LinkedinPreferedLocaleStruct? val) =>
      _preferredLocale = val;

  void updatePreferredLocale(Function(LinkedinPreferedLocaleStruct) updateFn) {
    updateFn(_preferredLocale ??= LinkedinPreferedLocaleStruct());
  }

  bool hasPreferredLocale() => _preferredLocale != null;

  static PrefferedLocaleStruct fromMap(Map<String, dynamic> data) =>
      PrefferedLocaleStruct(
        preferredLocale:
            LinkedinPreferedLocaleStruct.maybeFromMap(data['preferredLocale']),
      );

  static PrefferedLocaleStruct? maybeFromMap(dynamic data) => data is Map
      ? PrefferedLocaleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'preferredLocale': _preferredLocale?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'preferredLocale': serializeParam(
          _preferredLocale,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static PrefferedLocaleStruct fromSerializableMap(Map<String, dynamic> data) =>
      PrefferedLocaleStruct(
        preferredLocale: deserializeStructParam(
          data['preferredLocale'],
          ParamType.DataStruct,
          false,
          structBuilder: LinkedinPreferedLocaleStruct.fromSerializableMap,
        ),
      );

  static PrefferedLocaleStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PrefferedLocaleStruct(
        preferredLocale: convertAlgoliaParam(
          data['preferredLocale'],
          ParamType.DataStruct,
          false,
          structBuilder: LinkedinPreferedLocaleStruct.fromAlgoliaData,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PrefferedLocaleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PrefferedLocaleStruct &&
        preferredLocale == other.preferredLocale;
  }

  @override
  int get hashCode => const ListEquality().hash([preferredLocale]);
}

PrefferedLocaleStruct createPrefferedLocaleStruct({
  LinkedinPreferedLocaleStruct? preferredLocale,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PrefferedLocaleStruct(
      preferredLocale: preferredLocale ??
          (clearUnsetFields ? LinkedinPreferedLocaleStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PrefferedLocaleStruct? updatePrefferedLocaleStruct(
  PrefferedLocaleStruct? prefferedLocale, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    prefferedLocale
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPrefferedLocaleStructData(
  Map<String, dynamic> firestoreData,
  PrefferedLocaleStruct? prefferedLocale,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (prefferedLocale == null) {
    return;
  }
  if (prefferedLocale.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && prefferedLocale.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final prefferedLocaleData =
      getPrefferedLocaleFirestoreData(prefferedLocale, forFieldValue);
  final nestedData =
      prefferedLocaleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = prefferedLocale.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPrefferedLocaleFirestoreData(
  PrefferedLocaleStruct? prefferedLocale, [
  bool forFieldValue = false,
]) {
  if (prefferedLocale == null) {
    return {};
  }
  final firestoreData = mapToFirestore(prefferedLocale.toMap());

  // Handle nested data for "preferredLocale" field.
  addLinkedinPreferedLocaleStructData(
    firestoreData,
    prefferedLocale.hasPreferredLocale()
        ? prefferedLocale.preferredLocale
        : null,
    'preferredLocale',
    forFieldValue,
  );

  // Add any Firestore field values
  prefferedLocale.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPrefferedLocaleListFirestoreData(
  List<PrefferedLocaleStruct>? prefferedLocales,
) =>
    prefferedLocales
        ?.map((e) => getPrefferedLocaleFirestoreData(e, true))
        .toList() ??
    [];
