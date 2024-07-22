// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LinkedinScrappedStruct extends FFFirebaseStruct {
  LinkedinScrappedStruct({
    String? firstName,
    String? fullName,
    String? lastName,
    String? headline,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _firstName = firstName,
        _fullName = fullName,
        _lastName = lastName,
        _headline = headline,
        super(firestoreUtilData);

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "headline" field.
  String? _headline;
  String get headline => _headline ?? '';
  set headline(String? val) => _headline = val;

  bool hasHeadline() => _headline != null;

  static LinkedinScrappedStruct fromMap(Map<String, dynamic> data) =>
      LinkedinScrappedStruct(
        firstName: data['first_name'] as String?,
        fullName: data['full_name'] as String?,
        lastName: data['last_name'] as String?,
        headline: data['headline'] as String?,
      );

  static LinkedinScrappedStruct? maybeFromMap(dynamic data) => data is Map
      ? LinkedinScrappedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'first_name': _firstName,
        'full_name': _fullName,
        'last_name': _lastName,
        'headline': _headline,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'full_name': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'headline': serializeParam(
          _headline,
          ParamType.String,
        ),
      }.withoutNulls;

  static LinkedinScrappedStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LinkedinScrappedStruct(
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        headline: deserializeParam(
          data['headline'],
          ParamType.String,
          false,
        ),
      );

  static LinkedinScrappedStruct fromAlgoliaData(Map<String, dynamic> data) =>
      LinkedinScrappedStruct(
        firstName: convertAlgoliaParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        fullName: convertAlgoliaParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        lastName: convertAlgoliaParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        headline: convertAlgoliaParam(
          data['headline'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'LinkedinScrappedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LinkedinScrappedStruct &&
        firstName == other.firstName &&
        fullName == other.fullName &&
        lastName == other.lastName &&
        headline == other.headline;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([firstName, fullName, lastName, headline]);
}

LinkedinScrappedStruct createLinkedinScrappedStruct({
  String? firstName,
  String? fullName,
  String? lastName,
  String? headline,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LinkedinScrappedStruct(
      firstName: firstName,
      fullName: fullName,
      lastName: lastName,
      headline: headline,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LinkedinScrappedStruct? updateLinkedinScrappedStruct(
  LinkedinScrappedStruct? linkedinScrapped, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    linkedinScrapped
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLinkedinScrappedStructData(
  Map<String, dynamic> firestoreData,
  LinkedinScrappedStruct? linkedinScrapped,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (linkedinScrapped == null) {
    return;
  }
  if (linkedinScrapped.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && linkedinScrapped.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final linkedinScrappedData =
      getLinkedinScrappedFirestoreData(linkedinScrapped, forFieldValue);
  final nestedData =
      linkedinScrappedData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = linkedinScrapped.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLinkedinScrappedFirestoreData(
  LinkedinScrappedStruct? linkedinScrapped, [
  bool forFieldValue = false,
]) {
  if (linkedinScrapped == null) {
    return {};
  }
  final firestoreData = mapToFirestore(linkedinScrapped.toMap());

  // Add any Firestore field values
  linkedinScrapped.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLinkedinScrappedListFirestoreData(
  List<LinkedinScrappedStruct>? linkedinScrappeds,
) =>
    linkedinScrappeds
        ?.map((e) => getLinkedinScrappedFirestoreData(e, true))
        .toList() ??
    [];
