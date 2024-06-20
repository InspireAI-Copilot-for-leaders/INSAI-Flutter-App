// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticleMetadataStruct extends FFFirebaseStruct {
  ArticleMetadataStruct({
    String? favicon,
    String? imageUrl,
    DateTime? publishDate,
    String? sourceUrl,
    String? url,
    OriginalArticleForRagStruct? orginialArticleUsedForRag,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _favicon = favicon,
        _imageUrl = imageUrl,
        _publishDate = publishDate,
        _sourceUrl = sourceUrl,
        _url = url,
        _orginialArticleUsedForRag = orginialArticleUsedForRag,
        super(firestoreUtilData);

  // "favicon" field.
  String? _favicon;
  String get favicon => _favicon ?? '';
  set favicon(String? val) => _favicon = val;

  bool hasFavicon() => _favicon != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  // "publish_date" field.
  DateTime? _publishDate;
  DateTime? get publishDate => _publishDate;
  set publishDate(DateTime? val) => _publishDate = val;

  bool hasPublishDate() => _publishDate != null;

  // "source_url" field.
  String? _sourceUrl;
  String get sourceUrl => _sourceUrl ?? '';
  set sourceUrl(String? val) => _sourceUrl = val;

  bool hasSourceUrl() => _sourceUrl != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "orginial_article_used_for_rag" field.
  OriginalArticleForRagStruct? _orginialArticleUsedForRag;
  OriginalArticleForRagStruct get orginialArticleUsedForRag =>
      _orginialArticleUsedForRag ?? OriginalArticleForRagStruct();
  set orginialArticleUsedForRag(OriginalArticleForRagStruct? val) =>
      _orginialArticleUsedForRag = val;

  void updateOrginialArticleUsedForRag(
      Function(OriginalArticleForRagStruct) updateFn) {
    updateFn(orginialArticleUsedForRag ??= OriginalArticleForRagStruct());
  }

  bool hasOrginialArticleUsedForRag() => _orginialArticleUsedForRag != null;

  static ArticleMetadataStruct fromMap(Map<String, dynamic> data) =>
      ArticleMetadataStruct(
        favicon: data['favicon'] as String?,
        imageUrl: data['image_url'] as String?,
        publishDate: data['publish_date'] as DateTime?,
        sourceUrl: data['source_url'] as String?,
        url: data['url'] as String?,
        orginialArticleUsedForRag: OriginalArticleForRagStruct.maybeFromMap(
            data['orginial_article_used_for_rag']),
      );

  static ArticleMetadataStruct? maybeFromMap(dynamic data) => data is Map
      ? ArticleMetadataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'favicon': _favicon,
        'image_url': _imageUrl,
        'publish_date': _publishDate,
        'source_url': _sourceUrl,
        'url': _url,
        'orginial_article_used_for_rag': _orginialArticleUsedForRag?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'favicon': serializeParam(
          _favicon,
          ParamType.String,
        ),
        'image_url': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
        'publish_date': serializeParam(
          _publishDate,
          ParamType.DateTime,
        ),
        'source_url': serializeParam(
          _sourceUrl,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'orginial_article_used_for_rag': serializeParam(
          _orginialArticleUsedForRag,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ArticleMetadataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ArticleMetadataStruct(
        favicon: deserializeParam(
          data['favicon'],
          ParamType.String,
          false,
        ),
        imageUrl: deserializeParam(
          data['image_url'],
          ParamType.String,
          false,
        ),
        publishDate: deserializeParam(
          data['publish_date'],
          ParamType.DateTime,
          false,
        ),
        sourceUrl: deserializeParam(
          data['source_url'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        orginialArticleUsedForRag: deserializeStructParam(
          data['orginial_article_used_for_rag'],
          ParamType.DataStruct,
          false,
          structBuilder: OriginalArticleForRagStruct.fromSerializableMap,
        ),
      );

  static ArticleMetadataStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ArticleMetadataStruct(
        favicon: convertAlgoliaParam(
          data['favicon'],
          ParamType.String,
          false,
        ),
        imageUrl: convertAlgoliaParam(
          data['image_url'],
          ParamType.String,
          false,
        ),
        publishDate: convertAlgoliaParam(
          data['publish_date'],
          ParamType.DateTime,
          false,
        ),
        sourceUrl: convertAlgoliaParam(
          data['source_url'],
          ParamType.String,
          false,
        ),
        url: convertAlgoliaParam(
          data['url'],
          ParamType.String,
          false,
        ),
        orginialArticleUsedForRag: convertAlgoliaParam(
          data['orginial_article_used_for_rag'],
          ParamType.DataStruct,
          false,
          structBuilder: OriginalArticleForRagStruct.fromAlgoliaData,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ArticleMetadataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ArticleMetadataStruct &&
        favicon == other.favicon &&
        imageUrl == other.imageUrl &&
        publishDate == other.publishDate &&
        sourceUrl == other.sourceUrl &&
        url == other.url &&
        orginialArticleUsedForRag == other.orginialArticleUsedForRag;
  }

  @override
  int get hashCode => const ListEquality().hash([
        favicon,
        imageUrl,
        publishDate,
        sourceUrl,
        url,
        orginialArticleUsedForRag
      ]);
}

ArticleMetadataStruct createArticleMetadataStruct({
  String? favicon,
  String? imageUrl,
  DateTime? publishDate,
  String? sourceUrl,
  String? url,
  OriginalArticleForRagStruct? orginialArticleUsedForRag,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ArticleMetadataStruct(
      favicon: favicon,
      imageUrl: imageUrl,
      publishDate: publishDate,
      sourceUrl: sourceUrl,
      url: url,
      orginialArticleUsedForRag: orginialArticleUsedForRag ??
          (clearUnsetFields ? OriginalArticleForRagStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ArticleMetadataStruct? updateArticleMetadataStruct(
  ArticleMetadataStruct? articleMetadata, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    articleMetadata
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addArticleMetadataStructData(
  Map<String, dynamic> firestoreData,
  ArticleMetadataStruct? articleMetadata,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (articleMetadata == null) {
    return;
  }
  if (articleMetadata.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && articleMetadata.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final articleMetadataData =
      getArticleMetadataFirestoreData(articleMetadata, forFieldValue);
  final nestedData =
      articleMetadataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = articleMetadata.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getArticleMetadataFirestoreData(
  ArticleMetadataStruct? articleMetadata, [
  bool forFieldValue = false,
]) {
  if (articleMetadata == null) {
    return {};
  }
  final firestoreData = mapToFirestore(articleMetadata.toMap());

  // Handle nested data for "orginial_article_used_for_rag" field.
  addOriginalArticleForRagStructData(
    firestoreData,
    articleMetadata.hasOrginialArticleUsedForRag()
        ? articleMetadata.orginialArticleUsedForRag
        : null,
    'orginial_article_used_for_rag',
    forFieldValue,
  );

  // Add any Firestore field values
  articleMetadata.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getArticleMetadataListFirestoreData(
  List<ArticleMetadataStruct>? articleMetadatas,
) =>
    articleMetadatas
        ?.map((e) => getArticleMetadataFirestoreData(e, true))
        .toList() ??
    [];
