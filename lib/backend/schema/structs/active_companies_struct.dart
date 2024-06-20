// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ActiveCompaniesStruct extends FFFirebaseStruct {
  ActiveCompaniesStruct({
    String? companyName,
    String? companyLogoUrl,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _companyName = companyName,
        _companyLogoUrl = companyLogoUrl,
        super(firestoreUtilData);

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;

  bool hasCompanyName() => _companyName != null;

  // "company_logo_url" field.
  String? _companyLogoUrl;
  String get companyLogoUrl => _companyLogoUrl ?? '';
  set companyLogoUrl(String? val) => _companyLogoUrl = val;

  bool hasCompanyLogoUrl() => _companyLogoUrl != null;

  static ActiveCompaniesStruct fromMap(Map<String, dynamic> data) =>
      ActiveCompaniesStruct(
        companyName: data['company_name'] as String?,
        companyLogoUrl: data['company_logo_url'] as String?,
      );

  static ActiveCompaniesStruct? maybeFromMap(dynamic data) => data is Map
      ? ActiveCompaniesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'company_name': _companyName,
        'company_logo_url': _companyLogoUrl,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'company_name': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'company_logo_url': serializeParam(
          _companyLogoUrl,
          ParamType.String,
        ),
      }.withoutNulls;

  static ActiveCompaniesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ActiveCompaniesStruct(
        companyName: deserializeParam(
          data['company_name'],
          ParamType.String,
          false,
        ),
        companyLogoUrl: deserializeParam(
          data['company_logo_url'],
          ParamType.String,
          false,
        ),
      );

  static ActiveCompaniesStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ActiveCompaniesStruct(
        companyName: convertAlgoliaParam(
          data['company_name'],
          ParamType.String,
          false,
        ),
        companyLogoUrl: convertAlgoliaParam(
          data['company_logo_url'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ActiveCompaniesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ActiveCompaniesStruct &&
        companyName == other.companyName &&
        companyLogoUrl == other.companyLogoUrl;
  }

  @override
  int get hashCode => const ListEquality().hash([companyName, companyLogoUrl]);
}

ActiveCompaniesStruct createActiveCompaniesStruct({
  String? companyName,
  String? companyLogoUrl,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ActiveCompaniesStruct(
      companyName: companyName,
      companyLogoUrl: companyLogoUrl,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ActiveCompaniesStruct? updateActiveCompaniesStruct(
  ActiveCompaniesStruct? activeCompanies, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    activeCompanies
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addActiveCompaniesStructData(
  Map<String, dynamic> firestoreData,
  ActiveCompaniesStruct? activeCompanies,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (activeCompanies == null) {
    return;
  }
  if (activeCompanies.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && activeCompanies.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final activeCompaniesData =
      getActiveCompaniesFirestoreData(activeCompanies, forFieldValue);
  final nestedData =
      activeCompaniesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = activeCompanies.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getActiveCompaniesFirestoreData(
  ActiveCompaniesStruct? activeCompanies, [
  bool forFieldValue = false,
]) {
  if (activeCompanies == null) {
    return {};
  }
  final firestoreData = mapToFirestore(activeCompanies.toMap());

  // Add any Firestore field values
  activeCompanies.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getActiveCompaniesListFirestoreData(
  List<ActiveCompaniesStruct>? activeCompaniess,
) =>
    activeCompaniess
        ?.map((e) => getActiveCompaniesFirestoreData(e, true))
        .toList() ??
    [];
