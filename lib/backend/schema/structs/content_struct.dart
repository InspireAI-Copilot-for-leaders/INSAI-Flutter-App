// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ContentStruct extends FFFirebaseStruct {
  ContentStruct({
    String? content,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _content = content,
        super(firestoreUtilData);

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;
  bool hasContent() => _content != null;

  static ContentStruct fromMap(Map<String, dynamic> data) => ContentStruct(
        content: data['content'] as String?,
      );

  static ContentStruct? maybeFromMap(dynamic data) =>
      data is Map ? ContentStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'content': _content,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContentStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContentStruct(
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
      );

  static ContentStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ContentStruct(
        content: convertAlgoliaParam(
          data['content'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ContentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContentStruct && content == other.content;
  }

  @override
  int get hashCode => const ListEquality().hash([content]);
}

ContentStruct createContentStruct({
  String? content,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContentStruct(
      content: content,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContentStruct? updateContentStruct(
  ContentStruct? contentStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contentStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContentStructData(
  Map<String, dynamic> firestoreData,
  ContentStruct? contentStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contentStruct == null) {
    return;
  }
  if (contentStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contentStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contentStructData =
      getContentFirestoreData(contentStruct, forFieldValue);
  final nestedData =
      contentStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contentStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContentFirestoreData(
  ContentStruct? contentStruct, [
  bool forFieldValue = false,
]) {
  if (contentStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contentStruct.toMap());

  // Add any Firestore field values
  contentStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContentListFirestoreData(
  List<ContentStruct>? contentStructs,
) =>
    contentStructs?.map((e) => getContentFirestoreData(e, true)).toList() ?? [];
