// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LinkedinDetailsAuthStruct extends FFFirebaseStruct {
  LinkedinDetailsAuthStruct({
    String? localizedFirstName,
    PrefferedLocaleStruct? firstName,
    String? localizedLastName,
    PrefferedLocaleStruct? lastName,
    String? localizedHeadline,
    PrefferedLocaleStruct? headline,
    String? vanityName,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _localizedFirstName = localizedFirstName,
        _firstName = firstName,
        _localizedLastName = localizedLastName,
        _lastName = lastName,
        _localizedHeadline = localizedHeadline,
        _headline = headline,
        _vanityName = vanityName,
        _id = id,
        super(firestoreUtilData);

  // "localizedFirstName" field.
  String? _localizedFirstName;
  String get localizedFirstName => _localizedFirstName ?? '';
  set localizedFirstName(String? val) => _localizedFirstName = val;

  bool hasLocalizedFirstName() => _localizedFirstName != null;

  // "firstName" field.
  PrefferedLocaleStruct? _firstName;
  PrefferedLocaleStruct get firstName => _firstName ?? PrefferedLocaleStruct();
  set firstName(PrefferedLocaleStruct? val) => _firstName = val;

  void updateFirstName(Function(PrefferedLocaleStruct) updateFn) {
    updateFn(_firstName ??= PrefferedLocaleStruct());
  }

  bool hasFirstName() => _firstName != null;

  // "localizedLastName" field.
  String? _localizedLastName;
  String get localizedLastName => _localizedLastName ?? '';
  set localizedLastName(String? val) => _localizedLastName = val;

  bool hasLocalizedLastName() => _localizedLastName != null;

  // "lastName" field.
  PrefferedLocaleStruct? _lastName;
  PrefferedLocaleStruct get lastName => _lastName ?? PrefferedLocaleStruct();
  set lastName(PrefferedLocaleStruct? val) => _lastName = val;

  void updateLastName(Function(PrefferedLocaleStruct) updateFn) {
    updateFn(_lastName ??= PrefferedLocaleStruct());
  }

  bool hasLastName() => _lastName != null;

  // "localizedHeadline" field.
  String? _localizedHeadline;
  String get localizedHeadline => _localizedHeadline ?? '';
  set localizedHeadline(String? val) => _localizedHeadline = val;

  bool hasLocalizedHeadline() => _localizedHeadline != null;

  // "headline" field.
  PrefferedLocaleStruct? _headline;
  PrefferedLocaleStruct get headline => _headline ?? PrefferedLocaleStruct();
  set headline(PrefferedLocaleStruct? val) => _headline = val;

  void updateHeadline(Function(PrefferedLocaleStruct) updateFn) {
    updateFn(_headline ??= PrefferedLocaleStruct());
  }

  bool hasHeadline() => _headline != null;

  // "vanityName" field.
  String? _vanityName;
  String get vanityName => _vanityName ?? '';
  set vanityName(String? val) => _vanityName = val;

  bool hasVanityName() => _vanityName != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static LinkedinDetailsAuthStruct fromMap(Map<String, dynamic> data) =>
      LinkedinDetailsAuthStruct(
        localizedFirstName: data['localizedFirstName'] as String?,
        firstName: PrefferedLocaleStruct.maybeFromMap(data['firstName']),
        localizedLastName: data['localizedLastName'] as String?,
        lastName: PrefferedLocaleStruct.maybeFromMap(data['lastName']),
        localizedHeadline: data['localizedHeadline'] as String?,
        headline: PrefferedLocaleStruct.maybeFromMap(data['headline']),
        vanityName: data['vanityName'] as String?,
        id: data['id'] as String?,
      );

  static LinkedinDetailsAuthStruct? maybeFromMap(dynamic data) => data is Map
      ? LinkedinDetailsAuthStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'localizedFirstName': _localizedFirstName,
        'firstName': _firstName?.toMap(),
        'localizedLastName': _localizedLastName,
        'lastName': _lastName?.toMap(),
        'localizedHeadline': _localizedHeadline,
        'headline': _headline?.toMap(),
        'vanityName': _vanityName,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'localizedFirstName': serializeParam(
          _localizedFirstName,
          ParamType.String,
        ),
        'firstName': serializeParam(
          _firstName,
          ParamType.DataStruct,
        ),
        'localizedLastName': serializeParam(
          _localizedLastName,
          ParamType.String,
        ),
        'lastName': serializeParam(
          _lastName,
          ParamType.DataStruct,
        ),
        'localizedHeadline': serializeParam(
          _localizedHeadline,
          ParamType.String,
        ),
        'headline': serializeParam(
          _headline,
          ParamType.DataStruct,
        ),
        'vanityName': serializeParam(
          _vanityName,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static LinkedinDetailsAuthStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      LinkedinDetailsAuthStruct(
        localizedFirstName: deserializeParam(
          data['localizedFirstName'],
          ParamType.String,
          false,
        ),
        firstName: deserializeStructParam(
          data['firstName'],
          ParamType.DataStruct,
          false,
          structBuilder: PrefferedLocaleStruct.fromSerializableMap,
        ),
        localizedLastName: deserializeParam(
          data['localizedLastName'],
          ParamType.String,
          false,
        ),
        lastName: deserializeStructParam(
          data['lastName'],
          ParamType.DataStruct,
          false,
          structBuilder: PrefferedLocaleStruct.fromSerializableMap,
        ),
        localizedHeadline: deserializeParam(
          data['localizedHeadline'],
          ParamType.String,
          false,
        ),
        headline: deserializeStructParam(
          data['headline'],
          ParamType.DataStruct,
          false,
          structBuilder: PrefferedLocaleStruct.fromSerializableMap,
        ),
        vanityName: deserializeParam(
          data['vanityName'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  static LinkedinDetailsAuthStruct fromAlgoliaData(Map<String, dynamic> data) =>
      LinkedinDetailsAuthStruct(
        localizedFirstName: convertAlgoliaParam(
          data['localizedFirstName'],
          ParamType.String,
          false,
        ),
        firstName: convertAlgoliaParam(
          data['firstName'],
          ParamType.DataStruct,
          false,
          structBuilder: PrefferedLocaleStruct.fromAlgoliaData,
        ),
        localizedLastName: convertAlgoliaParam(
          data['localizedLastName'],
          ParamType.String,
          false,
        ),
        lastName: convertAlgoliaParam(
          data['lastName'],
          ParamType.DataStruct,
          false,
          structBuilder: PrefferedLocaleStruct.fromAlgoliaData,
        ),
        localizedHeadline: convertAlgoliaParam(
          data['localizedHeadline'],
          ParamType.String,
          false,
        ),
        headline: convertAlgoliaParam(
          data['headline'],
          ParamType.DataStruct,
          false,
          structBuilder: PrefferedLocaleStruct.fromAlgoliaData,
        ),
        vanityName: convertAlgoliaParam(
          data['vanityName'],
          ParamType.String,
          false,
        ),
        id: convertAlgoliaParam(
          data['id'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'LinkedinDetailsAuthStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LinkedinDetailsAuthStruct &&
        localizedFirstName == other.localizedFirstName &&
        firstName == other.firstName &&
        localizedLastName == other.localizedLastName &&
        lastName == other.lastName &&
        localizedHeadline == other.localizedHeadline &&
        headline == other.headline &&
        vanityName == other.vanityName &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([
        localizedFirstName,
        firstName,
        localizedLastName,
        lastName,
        localizedHeadline,
        headline,
        vanityName,
        id
      ]);
}

LinkedinDetailsAuthStruct createLinkedinDetailsAuthStruct({
  String? localizedFirstName,
  PrefferedLocaleStruct? firstName,
  String? localizedLastName,
  PrefferedLocaleStruct? lastName,
  String? localizedHeadline,
  PrefferedLocaleStruct? headline,
  String? vanityName,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LinkedinDetailsAuthStruct(
      localizedFirstName: localizedFirstName,
      firstName:
          firstName ?? (clearUnsetFields ? PrefferedLocaleStruct() : null),
      localizedLastName: localizedLastName,
      lastName: lastName ?? (clearUnsetFields ? PrefferedLocaleStruct() : null),
      localizedHeadline: localizedHeadline,
      headline: headline ?? (clearUnsetFields ? PrefferedLocaleStruct() : null),
      vanityName: vanityName,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LinkedinDetailsAuthStruct? updateLinkedinDetailsAuthStruct(
  LinkedinDetailsAuthStruct? linkedinDetailsAuth, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    linkedinDetailsAuth
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLinkedinDetailsAuthStructData(
  Map<String, dynamic> firestoreData,
  LinkedinDetailsAuthStruct? linkedinDetailsAuth,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (linkedinDetailsAuth == null) {
    return;
  }
  if (linkedinDetailsAuth.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && linkedinDetailsAuth.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final linkedinDetailsAuthData =
      getLinkedinDetailsAuthFirestoreData(linkedinDetailsAuth, forFieldValue);
  final nestedData =
      linkedinDetailsAuthData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      linkedinDetailsAuth.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLinkedinDetailsAuthFirestoreData(
  LinkedinDetailsAuthStruct? linkedinDetailsAuth, [
  bool forFieldValue = false,
]) {
  if (linkedinDetailsAuth == null) {
    return {};
  }
  final firestoreData = mapToFirestore(linkedinDetailsAuth.toMap());

  // Handle nested data for "firstName" field.
  addPrefferedLocaleStructData(
    firestoreData,
    linkedinDetailsAuth.hasFirstName() ? linkedinDetailsAuth.firstName : null,
    'firstName',
    forFieldValue,
  );

  // Handle nested data for "lastName" field.
  addPrefferedLocaleStructData(
    firestoreData,
    linkedinDetailsAuth.hasLastName() ? linkedinDetailsAuth.lastName : null,
    'lastName',
    forFieldValue,
  );

  // Handle nested data for "headline" field.
  addPrefferedLocaleStructData(
    firestoreData,
    linkedinDetailsAuth.hasHeadline() ? linkedinDetailsAuth.headline : null,
    'headline',
    forFieldValue,
  );

  // Add any Firestore field values
  linkedinDetailsAuth.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLinkedinDetailsAuthListFirestoreData(
  List<LinkedinDetailsAuthStruct>? linkedinDetailsAuths,
) =>
    linkedinDetailsAuths
        ?.map((e) => getLinkedinDetailsAuthFirestoreData(e, true))
        .toList() ??
    [];
