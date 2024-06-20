import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticleRecord extends FirestoreRecord {
  ArticleRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "article_summary" field.
  String? _articleSummary;
  String get articleSummary => _articleSummary ?? '';
  bool hasArticleSummary() => _articleSummary != null;

  // "metadata" field.
  List<ArticleMetadataStruct>? _metadata;
  List<ArticleMetadataStruct> get metadata => _metadata ?? const [];
  bool hasMetadata() => _metadata != null;

  // "original_google_search_term" field.
  String? _originalGoogleSearchTerm;
  String get originalGoogleSearchTerm => _originalGoogleSearchTerm ?? '';
  bool hasOriginalGoogleSearchTerm() => _originalGoogleSearchTerm != null;

  // "scrapped_at" field.
  DateTime? _scrappedAt;
  DateTime? get scrappedAt => _scrappedAt;
  bool hasScrappedAt() => _scrappedAt != null;

  // "trend_keyword" field.
  String? _trendKeyword;
  String get trendKeyword => _trendKeyword ?? '';
  bool hasTrendKeyword() => _trendKeyword != null;

  // "domain" field.
  String? _domain;
  String get domain => _domain ?? '';
  bool hasDomain() => _domain != null;

  // "expertise_area" field.
  String? _expertiseArea;
  String get expertiseArea => _expertiseArea ?? '';
  bool hasExpertiseArea() => _expertiseArea != null;

  // "publish_dates" field.
  List<DateTime>? _publishDates;
  List<DateTime> get publishDates => _publishDates ?? const [];
  bool hasPublishDates() => _publishDates != null;

  void _initializeFields() {
    _articleSummary = snapshotData['article_summary'] as String?;
    _metadata = getStructList(
      snapshotData['metadata'],
      ArticleMetadataStruct.fromMap,
    );
    _originalGoogleSearchTerm =
        snapshotData['original_google_search_term'] as String?;
    _scrappedAt = snapshotData['scrapped_at'] as DateTime?;
    _trendKeyword = snapshotData['trend_keyword'] as String?;
    _domain = snapshotData['domain'] as String?;
    _expertiseArea = snapshotData['expertise_area'] as String?;
    _publishDates = getDataList(snapshotData['publish_dates']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('article');

  static Stream<ArticleRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArticleRecord.fromSnapshot(s));

  static Future<ArticleRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ArticleRecord.fromSnapshot(s));

  static ArticleRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArticleRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArticleRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArticleRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArticleRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArticleRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArticleRecordData({
  String? articleSummary,
  String? originalGoogleSearchTerm,
  DateTime? scrappedAt,
  String? trendKeyword,
  String? domain,
  String? expertiseArea,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'article_summary': articleSummary,
      'original_google_search_term': originalGoogleSearchTerm,
      'scrapped_at': scrappedAt,
      'trend_keyword': trendKeyword,
      'domain': domain,
      'expertise_area': expertiseArea,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArticleRecordDocumentEquality implements Equality<ArticleRecord> {
  const ArticleRecordDocumentEquality();

  @override
  bool equals(ArticleRecord? e1, ArticleRecord? e2) {
    const listEquality = ListEquality();
    return e1?.articleSummary == e2?.articleSummary &&
        listEquality.equals(e1?.metadata, e2?.metadata) &&
        e1?.originalGoogleSearchTerm == e2?.originalGoogleSearchTerm &&
        e1?.scrappedAt == e2?.scrappedAt &&
        e1?.trendKeyword == e2?.trendKeyword &&
        e1?.domain == e2?.domain &&
        e1?.expertiseArea == e2?.expertiseArea &&
        listEquality.equals(e1?.publishDates, e2?.publishDates);
  }

  @override
  int hash(ArticleRecord? e) => const ListEquality().hash([
        e?.articleSummary,
        e?.metadata,
        e?.originalGoogleSearchTerm,
        e?.scrappedAt,
        e?.trendKeyword,
        e?.domain,
        e?.expertiseArea,
        e?.publishDates
      ]);

  @override
  bool isValidKey(Object? o) => o is ArticleRecord;
}
