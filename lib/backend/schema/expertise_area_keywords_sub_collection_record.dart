import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ExpertiseAreaKeywordsSubCollectionRecord extends FirestoreRecord {
  ExpertiseAreaKeywordsSubCollectionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "authors" field.
  List<String>? _authors;
  List<String> get authors => _authors ?? const [];
  bool hasAuthors() => _authors != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "keyword" field.
  String? _keyword;
  String get keyword => _keyword ?? '';
  bool hasKeyword() => _keyword != null;

  // "parent_expertise_area" field.
  String? _parentExpertiseArea;
  String get parentExpertiseArea => _parentExpertiseArea ?? '';
  bool hasParentExpertiseArea() => _parentExpertiseArea != null;

  // "source_url" field.
  String? _sourceUrl;
  String get sourceUrl => _sourceUrl ?? '';
  bool hasSourceUrl() => _sourceUrl != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "top_image" field.
  String? _topImage;
  String get topImage => _topImage ?? '';
  bool hasTopImage() => _topImage != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "scraped_at" field.
  DateTime? _scrapedAt;
  DateTime? get scrapedAt => _scrapedAt;
  bool hasScrapedAt() => _scrapedAt != null;

  // "publish_date" field.
  DateTime? _publishDate;
  DateTime? get publishDate => _publishDate;
  bool hasPublishDate() => _publishDate != null;

  // "headline" field.
  String? _headline;
  String get headline => _headline ?? '';
  bool hasHeadline() => _headline != null;

  // "modified_keyword" field.
  String? _modifiedKeyword;
  String get modifiedKeyword => _modifiedKeyword ?? '';
  bool hasModifiedKeyword() => _modifiedKeyword != null;

  // "modified_text" field.
  String? _modifiedText;
  String get modifiedText => _modifiedText ?? '';
  bool hasModifiedText() => _modifiedText != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _authors = getDataList(snapshotData['authors']);
    _description = snapshotData['description'] as String?;
    _keyword = snapshotData['keyword'] as String?;
    _parentExpertiseArea = snapshotData['parent_expertise_area'] as String?;
    _sourceUrl = snapshotData['source_url'] as String?;
    _text = snapshotData['text'] as String?;
    _topImage = snapshotData['top_image'] as String?;
    _url = snapshotData['url'] as String?;
    _scrapedAt = snapshotData['scraped_at'] as DateTime?;
    _publishDate = snapshotData['publish_date'] as DateTime?;
    _headline = snapshotData['headline'] as String?;
    _modifiedKeyword = snapshotData['modified_keyword'] as String?;
    _modifiedText = snapshotData['modified_text'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('expertise_area_keywords_sub_collection')
          : FirebaseFirestore.instance
              .collectionGroup('expertise_area_keywords_sub_collection');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('expertise_area_keywords_sub_collection').doc(id);

  static Stream<ExpertiseAreaKeywordsSubCollectionRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => ExpertiseAreaKeywordsSubCollectionRecord.fromSnapshot(s));

  static Future<ExpertiseAreaKeywordsSubCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => ExpertiseAreaKeywordsSubCollectionRecord.fromSnapshot(s));

  static ExpertiseAreaKeywordsSubCollectionRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ExpertiseAreaKeywordsSubCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExpertiseAreaKeywordsSubCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExpertiseAreaKeywordsSubCollectionRecord._(
          reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExpertiseAreaKeywordsSubCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExpertiseAreaKeywordsSubCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExpertiseAreaKeywordsSubCollectionRecordData({
  String? description,
  String? keyword,
  String? parentExpertiseArea,
  String? sourceUrl,
  String? text,
  String? topImage,
  String? url,
  DateTime? scrapedAt,
  DateTime? publishDate,
  String? headline,
  String? modifiedKeyword,
  String? modifiedText,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'keyword': keyword,
      'parent_expertise_area': parentExpertiseArea,
      'source_url': sourceUrl,
      'text': text,
      'top_image': topImage,
      'url': url,
      'scraped_at': scrapedAt,
      'publish_date': publishDate,
      'headline': headline,
      'modified_keyword': modifiedKeyword,
      'modified_text': modifiedText,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExpertiseAreaKeywordsSubCollectionRecordDocumentEquality
    implements Equality<ExpertiseAreaKeywordsSubCollectionRecord> {
  const ExpertiseAreaKeywordsSubCollectionRecordDocumentEquality();

  @override
  bool equals(ExpertiseAreaKeywordsSubCollectionRecord? e1,
      ExpertiseAreaKeywordsSubCollectionRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.authors, e2?.authors) &&
        e1?.description == e2?.description &&
        e1?.keyword == e2?.keyword &&
        e1?.parentExpertiseArea == e2?.parentExpertiseArea &&
        e1?.sourceUrl == e2?.sourceUrl &&
        e1?.text == e2?.text &&
        e1?.topImage == e2?.topImage &&
        e1?.url == e2?.url &&
        e1?.scrapedAt == e2?.scrapedAt &&
        e1?.publishDate == e2?.publishDate &&
        e1?.headline == e2?.headline &&
        e1?.modifiedKeyword == e2?.modifiedKeyword &&
        e1?.modifiedText == e2?.modifiedText;
  }

  @override
  int hash(ExpertiseAreaKeywordsSubCollectionRecord? e) =>
      const ListEquality().hash([
        e?.authors,
        e?.description,
        e?.keyword,
        e?.parentExpertiseArea,
        e?.sourceUrl,
        e?.text,
        e?.topImage,
        e?.url,
        e?.scrapedAt,
        e?.publishDate,
        e?.headline,
        e?.modifiedKeyword,
        e?.modifiedText
      ]);

  @override
  bool isValidKey(Object? o) => o is ExpertiseAreaKeywordsSubCollectionRecord;
}
