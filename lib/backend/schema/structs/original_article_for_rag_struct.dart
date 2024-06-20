// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class OriginalArticleForRagStruct extends FFFirebaseStruct {
  OriginalArticleForRagStruct({
    String? description,
    String? domain,
    String? text,
    String? title,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _description = description,
        _domain = domain,
        _text = text,
        _title = title,
        super(firestoreUtilData);

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "domain" field.
  String? _domain;
  String get domain => _domain ?? '';
  set domain(String? val) => _domain = val;

  bool hasDomain() => _domain != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  static OriginalArticleForRagStruct fromMap(Map<String, dynamic> data) =>
      OriginalArticleForRagStruct(
        description: data['description'] as String?,
        domain: data['domain'] as String?,
        text: data['text'] as String?,
        title: data['title'] as String?,
      );

  static OriginalArticleForRagStruct? maybeFromMap(dynamic data) => data is Map
      ? OriginalArticleForRagStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'description': _description,
        'domain': _domain,
        'text': _text,
        'title': _title,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'domain': serializeParam(
          _domain,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
      }.withoutNulls;

  static OriginalArticleForRagStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      OriginalArticleForRagStruct(
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        domain: deserializeParam(
          data['domain'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
      );

  static OriginalArticleForRagStruct fromAlgoliaData(
          Map<String, dynamic> data) =>
      OriginalArticleForRagStruct(
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        domain: convertAlgoliaParam(
          data['domain'],
          ParamType.String,
          false,
        ),
        text: convertAlgoliaParam(
          data['text'],
          ParamType.String,
          false,
        ),
        title: convertAlgoliaParam(
          data['title'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'OriginalArticleForRagStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OriginalArticleForRagStruct &&
        description == other.description &&
        domain == other.domain &&
        text == other.text &&
        title == other.title;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([description, domain, text, title]);
}

OriginalArticleForRagStruct createOriginalArticleForRagStruct({
  String? description,
  String? domain,
  String? text,
  String? title,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OriginalArticleForRagStruct(
      description: description,
      domain: domain,
      text: text,
      title: title,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OriginalArticleForRagStruct? updateOriginalArticleForRagStruct(
  OriginalArticleForRagStruct? originalArticleForRag, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    originalArticleForRag
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOriginalArticleForRagStructData(
  Map<String, dynamic> firestoreData,
  OriginalArticleForRagStruct? originalArticleForRag,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (originalArticleForRag == null) {
    return;
  }
  if (originalArticleForRag.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      originalArticleForRag.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final originalArticleForRagData = getOriginalArticleForRagFirestoreData(
      originalArticleForRag, forFieldValue);
  final nestedData =
      originalArticleForRagData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      originalArticleForRag.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOriginalArticleForRagFirestoreData(
  OriginalArticleForRagStruct? originalArticleForRag, [
  bool forFieldValue = false,
]) {
  if (originalArticleForRag == null) {
    return {};
  }
  final firestoreData = mapToFirestore(originalArticleForRag.toMap());

  // Add any Firestore field values
  originalArticleForRag.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOriginalArticleForRagListFirestoreData(
  List<OriginalArticleForRagStruct>? originalArticleForRags,
) =>
    originalArticleForRags
        ?.map((e) => getOriginalArticleForRagFirestoreData(e, true))
        .toList() ??
    [];
