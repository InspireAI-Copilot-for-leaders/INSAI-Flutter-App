// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThoughtLeadershipAreasMappingStruct extends FFFirebaseStruct {
  ThoughtLeadershipAreasMappingStruct({
    String? category,
    List<String>? subCategories,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _category = category,
        _subCategories = subCategories,
        super(firestoreUtilData);

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;
  bool hasCategory() => _category != null;

  // "sub_categories" field.
  List<String>? _subCategories;
  List<String> get subCategories => _subCategories ?? const [];
  set subCategories(List<String>? val) => _subCategories = val;
  void updateSubCategories(Function(List<String>) updateFn) =>
      updateFn(_subCategories ??= []);
  bool hasSubCategories() => _subCategories != null;

  static ThoughtLeadershipAreasMappingStruct fromMap(
          Map<String, dynamic> data) =>
      ThoughtLeadershipAreasMappingStruct(
        category: data['category'] as String?,
        subCategories: getDataList(data['sub_categories']),
      );

  static ThoughtLeadershipAreasMappingStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? ThoughtLeadershipAreasMappingStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'category': _category,
        'sub_categories': _subCategories,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'sub_categories': serializeParam(
          _subCategories,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static ThoughtLeadershipAreasMappingStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ThoughtLeadershipAreasMappingStruct(
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        subCategories: deserializeParam<String>(
          data['sub_categories'],
          ParamType.String,
          true,
        ),
      );

  static ThoughtLeadershipAreasMappingStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      ThoughtLeadershipAreasMappingStruct(
        category: convertAlgoliaParam(
          data['category'],
          ParamType.String,
          false,
        ),
        subCategories: convertAlgoliaParam<String>(
          data['sub_categories'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ThoughtLeadershipAreasMappingStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ThoughtLeadershipAreasMappingStruct &&
        category == other.category &&
        listEquality.equals(subCategories, other.subCategories);
  }

  @override
  int get hashCode => const ListEquality().hash([category, subCategories]);
}

ThoughtLeadershipAreasMappingStruct createThoughtLeadershipAreasMappingStruct({
  String? category,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThoughtLeadershipAreasMappingStruct(
      category: category,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThoughtLeadershipAreasMappingStruct? updateThoughtLeadershipAreasMappingStruct(
  ThoughtLeadershipAreasMappingStruct? thoughtLeadershipAreasMapping, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    thoughtLeadershipAreasMapping
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThoughtLeadershipAreasMappingStructData(
  Map<String, dynamic> firestoreData,
  ThoughtLeadershipAreasMappingStruct? thoughtLeadershipAreasMapping,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (thoughtLeadershipAreasMapping == null) {
    return;
  }
  if (thoughtLeadershipAreasMapping.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      thoughtLeadershipAreasMapping.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final thoughtLeadershipAreasMappingData =
      getThoughtLeadershipAreasMappingFirestoreData(
          thoughtLeadershipAreasMapping, forFieldValue);
  final nestedData = thoughtLeadershipAreasMappingData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      thoughtLeadershipAreasMapping.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThoughtLeadershipAreasMappingFirestoreData(
  ThoughtLeadershipAreasMappingStruct? thoughtLeadershipAreasMapping, [
  bool forFieldValue = false,
]) {
  if (thoughtLeadershipAreasMapping == null) {
    return {};
  }
  final firestoreData = mapToFirestore(thoughtLeadershipAreasMapping.toMap());

  // Add any Firestore field values
  thoughtLeadershipAreasMapping.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThoughtLeadershipAreasMappingListFirestoreData(
  List<ThoughtLeadershipAreasMappingStruct>? thoughtLeadershipAreasMappings,
) =>
    thoughtLeadershipAreasMappings
        ?.map((e) => getThoughtLeadershipAreasMappingFirestoreData(e, true))
        .toList() ??
    [];
