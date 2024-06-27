// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActiveCompaniesStruct extends FFFirebaseStruct {
  ActiveCompaniesStruct({
    String? companyName,
    String? companyLogoUrl,
    String? companyInfoBasic,
    String? companyInfoEnhanced,
    String? companyNamespace,
    String? companyUrl,
    List<String>? enchacerQuestions,
    String? vectorDbStatus,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _companyName = companyName,
        _companyLogoUrl = companyLogoUrl,
        _companyInfoBasic = companyInfoBasic,
        _companyInfoEnhanced = companyInfoEnhanced,
        _companyNamespace = companyNamespace,
        _companyUrl = companyUrl,
        _enchacerQuestions = enchacerQuestions,
        _vectorDbStatus = vectorDbStatus,
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

  // "company_info_basic" field.
  String? _companyInfoBasic;
  String get companyInfoBasic => _companyInfoBasic ?? '';
  set companyInfoBasic(String? val) => _companyInfoBasic = val;

  bool hasCompanyInfoBasic() => _companyInfoBasic != null;

  // "company_info_enhanced" field.
  String? _companyInfoEnhanced;
  String get companyInfoEnhanced => _companyInfoEnhanced ?? '';
  set companyInfoEnhanced(String? val) => _companyInfoEnhanced = val;

  bool hasCompanyInfoEnhanced() => _companyInfoEnhanced != null;

  // "company_namespace" field.
  String? _companyNamespace;
  String get companyNamespace => _companyNamespace ?? '';
  set companyNamespace(String? val) => _companyNamespace = val;

  bool hasCompanyNamespace() => _companyNamespace != null;

  // "company_url" field.
  String? _companyUrl;
  String get companyUrl => _companyUrl ?? '';
  set companyUrl(String? val) => _companyUrl = val;

  bool hasCompanyUrl() => _companyUrl != null;

  // "enchacer_questions" field.
  List<String>? _enchacerQuestions;
  List<String> get enchacerQuestions => _enchacerQuestions ?? const [];
  set enchacerQuestions(List<String>? val) => _enchacerQuestions = val;

  void updateEnchacerQuestions(Function(List<String>) updateFn) {
    updateFn(_enchacerQuestions ??= []);
  }

  bool hasEnchacerQuestions() => _enchacerQuestions != null;

  // "vector_db_status" field.
  String? _vectorDbStatus;
  String get vectorDbStatus => _vectorDbStatus ?? '';
  set vectorDbStatus(String? val) => _vectorDbStatus = val;

  bool hasVectorDbStatus() => _vectorDbStatus != null;

  static ActiveCompaniesStruct fromMap(Map<String, dynamic> data) =>
      ActiveCompaniesStruct(
        companyName: data['company_name'] as String?,
        companyLogoUrl: data['company_logo_url'] as String?,
        companyInfoBasic: data['company_info_basic'] as String?,
        companyInfoEnhanced: data['company_info_enhanced'] as String?,
        companyNamespace: data['company_namespace'] as String?,
        companyUrl: data['company_url'] as String?,
        enchacerQuestions: getDataList(data['enchacer_questions']),
        vectorDbStatus: data['vector_db_status'] as String?,
      );

  static ActiveCompaniesStruct? maybeFromMap(dynamic data) => data is Map
      ? ActiveCompaniesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'company_name': _companyName,
        'company_logo_url': _companyLogoUrl,
        'company_info_basic': _companyInfoBasic,
        'company_info_enhanced': _companyInfoEnhanced,
        'company_namespace': _companyNamespace,
        'company_url': _companyUrl,
        'enchacer_questions': _enchacerQuestions,
        'vector_db_status': _vectorDbStatus,
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
        'company_info_basic': serializeParam(
          _companyInfoBasic,
          ParamType.String,
        ),
        'company_info_enhanced': serializeParam(
          _companyInfoEnhanced,
          ParamType.String,
        ),
        'company_namespace': serializeParam(
          _companyNamespace,
          ParamType.String,
        ),
        'company_url': serializeParam(
          _companyUrl,
          ParamType.String,
        ),
        'enchacer_questions': serializeParam(
          _enchacerQuestions,
          ParamType.String,
          isList: true,
        ),
        'vector_db_status': serializeParam(
          _vectorDbStatus,
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
        companyInfoBasic: deserializeParam(
          data['company_info_basic'],
          ParamType.String,
          false,
        ),
        companyInfoEnhanced: deserializeParam(
          data['company_info_enhanced'],
          ParamType.String,
          false,
        ),
        companyNamespace: deserializeParam(
          data['company_namespace'],
          ParamType.String,
          false,
        ),
        companyUrl: deserializeParam(
          data['company_url'],
          ParamType.String,
          false,
        ),
        enchacerQuestions: deserializeParam<String>(
          data['enchacer_questions'],
          ParamType.String,
          true,
        ),
        vectorDbStatus: deserializeParam(
          data['vector_db_status'],
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
        companyInfoBasic: convertAlgoliaParam(
          data['company_info_basic'],
          ParamType.String,
          false,
        ),
        companyInfoEnhanced: convertAlgoliaParam(
          data['company_info_enhanced'],
          ParamType.String,
          false,
        ),
        companyNamespace: convertAlgoliaParam(
          data['company_namespace'],
          ParamType.String,
          false,
        ),
        companyUrl: convertAlgoliaParam(
          data['company_url'],
          ParamType.String,
          false,
        ),
        enchacerQuestions: convertAlgoliaParam<String>(
          data['enchacer_questions'],
          ParamType.String,
          true,
        ),
        vectorDbStatus: convertAlgoliaParam(
          data['vector_db_status'],
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
    const listEquality = ListEquality();
    return other is ActiveCompaniesStruct &&
        companyName == other.companyName &&
        companyLogoUrl == other.companyLogoUrl &&
        companyInfoBasic == other.companyInfoBasic &&
        companyInfoEnhanced == other.companyInfoEnhanced &&
        companyNamespace == other.companyNamespace &&
        companyUrl == other.companyUrl &&
        listEquality.equals(enchacerQuestions, other.enchacerQuestions) &&
        vectorDbStatus == other.vectorDbStatus;
  }

  @override
  int get hashCode => const ListEquality().hash([
        companyName,
        companyLogoUrl,
        companyInfoBasic,
        companyInfoEnhanced,
        companyNamespace,
        companyUrl,
        enchacerQuestions,
        vectorDbStatus
      ]);
}

ActiveCompaniesStruct createActiveCompaniesStruct({
  String? companyName,
  String? companyLogoUrl,
  String? companyInfoBasic,
  String? companyInfoEnhanced,
  String? companyNamespace,
  String? companyUrl,
  String? vectorDbStatus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ActiveCompaniesStruct(
      companyName: companyName,
      companyLogoUrl: companyLogoUrl,
      companyInfoBasic: companyInfoBasic,
      companyInfoEnhanced: companyInfoEnhanced,
      companyNamespace: companyNamespace,
      companyUrl: companyUrl,
      vectorDbStatus: vectorDbStatus,
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
