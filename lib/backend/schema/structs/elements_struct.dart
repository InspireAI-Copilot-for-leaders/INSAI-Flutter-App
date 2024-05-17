// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ElementsStruct extends FFFirebaseStruct {
  ElementsStruct({
    String? artifact,
    String? authorizationMethod,
    IdentifiersStruct? identifiers,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _artifact = artifact,
        _authorizationMethod = authorizationMethod,
        _identifiers = identifiers,
        super(firestoreUtilData);

  // "artifact" field.
  String? _artifact;
  String get artifact => _artifact ?? '';
  set artifact(String? val) => _artifact = val;
  bool hasArtifact() => _artifact != null;

  // "authorizationMethod" field.
  String? _authorizationMethod;
  String get authorizationMethod => _authorizationMethod ?? '';
  set authorizationMethod(String? val) => _authorizationMethod = val;
  bool hasAuthorizationMethod() => _authorizationMethod != null;

  // "identifiers" field.
  IdentifiersStruct? _identifiers;
  IdentifiersStruct get identifiers => _identifiers ?? IdentifiersStruct();
  set identifiers(IdentifiersStruct? val) => _identifiers = val;
  void updateIdentifiers(Function(IdentifiersStruct) updateFn) =>
      updateFn(_identifiers ??= IdentifiersStruct());
  bool hasIdentifiers() => _identifiers != null;

  static ElementsStruct fromMap(Map<String, dynamic> data) => ElementsStruct(
        artifact: data['artifact'] as String?,
        authorizationMethod: data['authorizationMethod'] as String?,
        identifiers: IdentifiersStruct.maybeFromMap(data['identifiers']),
      );

  static ElementsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ElementsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'artifact': _artifact,
        'authorizationMethod': _authorizationMethod,
        'identifiers': _identifiers?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'artifact': serializeParam(
          _artifact,
          ParamType.String,
        ),
        'authorizationMethod': serializeParam(
          _authorizationMethod,
          ParamType.String,
        ),
        'identifiers': serializeParam(
          _identifiers,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ElementsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ElementsStruct(
        artifact: deserializeParam(
          data['artifact'],
          ParamType.String,
          false,
        ),
        authorizationMethod: deserializeParam(
          data['authorizationMethod'],
          ParamType.String,
          false,
        ),
        identifiers: deserializeStructParam(
          data['identifiers'],
          ParamType.DataStruct,
          false,
          structBuilder: IdentifiersStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ElementsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ElementsStruct &&
        artifact == other.artifact &&
        authorizationMethod == other.authorizationMethod &&
        identifiers == other.identifiers;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([artifact, authorizationMethod, identifiers]);
}

ElementsStruct createElementsStruct({
  String? artifact,
  String? authorizationMethod,
  IdentifiersStruct? identifiers,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ElementsStruct(
      artifact: artifact,
      authorizationMethod: authorizationMethod,
      identifiers:
          identifiers ?? (clearUnsetFields ? IdentifiersStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ElementsStruct? updateElementsStruct(
  ElementsStruct? elements, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    elements
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addElementsStructData(
  Map<String, dynamic> firestoreData,
  ElementsStruct? elements,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (elements == null) {
    return;
  }
  if (elements.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && elements.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final elementsData = getElementsFirestoreData(elements, forFieldValue);
  final nestedData = elementsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = elements.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getElementsFirestoreData(
  ElementsStruct? elements, [
  bool forFieldValue = false,
]) {
  if (elements == null) {
    return {};
  }
  final firestoreData = mapToFirestore(elements.toMap());

  // Handle nested data for "identifiers" field.
  addIdentifiersStructData(
    firestoreData,
    elements.hasIdentifiers() ? elements.identifiers : null,
    'identifiers',
    forFieldValue,
  );

  // Add any Firestore field values
  elements.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getElementsListFirestoreData(
  List<ElementsStruct>? elementss,
) =>
    elementss?.map((e) => getElementsFirestoreData(e, true)).toList() ?? [];
