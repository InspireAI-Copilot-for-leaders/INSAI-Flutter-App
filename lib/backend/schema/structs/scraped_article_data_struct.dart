// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ScrapedArticleDataStruct extends FFFirebaseStruct {
  ScrapedArticleDataStruct({
    String? description,
    String? publishDate,
    String? scrapedAt,
    String? sourceUrl,
    String? text,
    String? title,
    String? topImage,
    String? url,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _description = description,
        _publishDate = publishDate,
        _scrapedAt = scrapedAt,
        _sourceUrl = sourceUrl,
        _text = text,
        _title = title,
        _topImage = topImage,
        _url = url,
        super(firestoreUtilData);

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "publish_date" field.
  String? _publishDate;
  String get publishDate => _publishDate ?? '';
  set publishDate(String? val) => _publishDate = val;

  bool hasPublishDate() => _publishDate != null;

  // "scraped_at" field.
  String? _scrapedAt;
  String get scrapedAt => _scrapedAt ?? '';
  set scrapedAt(String? val) => _scrapedAt = val;

  bool hasScrapedAt() => _scrapedAt != null;

  // "source_url" field.
  String? _sourceUrl;
  String get sourceUrl => _sourceUrl ?? '';
  set sourceUrl(String? val) => _sourceUrl = val;

  bool hasSourceUrl() => _sourceUrl != null;

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

  // "top_image" field.
  String? _topImage;
  String get topImage => _topImage ?? '';
  set topImage(String? val) => _topImage = val;

  bool hasTopImage() => _topImage != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static ScrapedArticleDataStruct fromMap(Map<String, dynamic> data) =>
      ScrapedArticleDataStruct(
        description: data['description'] as String?,
        publishDate: data['publish_date'] as String?,
        scrapedAt: data['scraped_at'] as String?,
        sourceUrl: data['source_url'] as String?,
        text: data['text'] as String?,
        title: data['title'] as String?,
        topImage: data['top_image'] as String?,
        url: data['url'] as String?,
      );

  static ScrapedArticleDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ScrapedArticleDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'description': _description,
        'publish_date': _publishDate,
        'scraped_at': _scrapedAt,
        'source_url': _sourceUrl,
        'text': _text,
        'title': _title,
        'top_image': _topImage,
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'publish_date': serializeParam(
          _publishDate,
          ParamType.String,
        ),
        'scraped_at': serializeParam(
          _scrapedAt,
          ParamType.String,
        ),
        'source_url': serializeParam(
          _sourceUrl,
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
        'top_image': serializeParam(
          _topImage,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static ScrapedArticleDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ScrapedArticleDataStruct(
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        publishDate: deserializeParam(
          data['publish_date'],
          ParamType.String,
          false,
        ),
        scrapedAt: deserializeParam(
          data['scraped_at'],
          ParamType.String,
          false,
        ),
        sourceUrl: deserializeParam(
          data['source_url'],
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
        topImage: deserializeParam(
          data['top_image'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  static ScrapedArticleDataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ScrapedArticleDataStruct(
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        publishDate: convertAlgoliaParam(
          data['publish_date'],
          ParamType.String,
          false,
        ),
        scrapedAt: convertAlgoliaParam(
          data['scraped_at'],
          ParamType.String,
          false,
        ),
        sourceUrl: convertAlgoliaParam(
          data['source_url'],
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
        topImage: convertAlgoliaParam(
          data['top_image'],
          ParamType.String,
          false,
        ),
        url: convertAlgoliaParam(
          data['url'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ScrapedArticleDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ScrapedArticleDataStruct &&
        description == other.description &&
        publishDate == other.publishDate &&
        scrapedAt == other.scrapedAt &&
        sourceUrl == other.sourceUrl &&
        text == other.text &&
        title == other.title &&
        topImage == other.topImage &&
        url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([
        description,
        publishDate,
        scrapedAt,
        sourceUrl,
        text,
        title,
        topImage,
        url
      ]);
}

ScrapedArticleDataStruct createScrapedArticleDataStruct({
  String? description,
  String? publishDate,
  String? scrapedAt,
  String? sourceUrl,
  String? text,
  String? title,
  String? topImage,
  String? url,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ScrapedArticleDataStruct(
      description: description,
      publishDate: publishDate,
      scrapedAt: scrapedAt,
      sourceUrl: sourceUrl,
      text: text,
      title: title,
      topImage: topImage,
      url: url,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ScrapedArticleDataStruct? updateScrapedArticleDataStruct(
  ScrapedArticleDataStruct? scrapedArticleData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    scrapedArticleData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addScrapedArticleDataStructData(
  Map<String, dynamic> firestoreData,
  ScrapedArticleDataStruct? scrapedArticleData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (scrapedArticleData == null) {
    return;
  }
  if (scrapedArticleData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && scrapedArticleData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final scrapedArticleDataData =
      getScrapedArticleDataFirestoreData(scrapedArticleData, forFieldValue);
  final nestedData =
      scrapedArticleDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      scrapedArticleData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getScrapedArticleDataFirestoreData(
  ScrapedArticleDataStruct? scrapedArticleData, [
  bool forFieldValue = false,
]) {
  if (scrapedArticleData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(scrapedArticleData.toMap());

  // Add any Firestore field values
  scrapedArticleData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getScrapedArticleDataListFirestoreData(
  List<ScrapedArticleDataStruct>? scrapedArticleDatas,
) =>
    scrapedArticleDatas
        ?.map((e) => getScrapedArticleDataFirestoreData(e, true))
        .toList() ??
    [];
