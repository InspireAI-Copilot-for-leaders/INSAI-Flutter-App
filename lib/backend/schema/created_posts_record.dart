import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class CreatedPostsRecord extends FirestoreRecord {
  CreatedPostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  bool hasTopic() => _topic != null;

  // "time_stamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "content_review" field.
  String? _contentReview;
  String get contentReview => _contentReview ?? '';
  bool hasContentReview() => _contentReview != null;

  // "content" field.
  List<String>? _content;
  List<String> get content => _content ?? const [];
  bool hasContent() => _content != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _topic = snapshotData['topic'] as String?;
    _timeStamp = snapshotData['time_stamp'] as DateTime?;
    _contentReview = snapshotData['content_review'] as String?;
    _content = getDataList(snapshotData['content']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('created_posts')
          : FirebaseFirestore.instance.collectionGroup('created_posts');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('created_posts').doc(id);

  static Stream<CreatedPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CreatedPostsRecord.fromSnapshot(s));

  static Future<CreatedPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CreatedPostsRecord.fromSnapshot(s));

  static CreatedPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CreatedPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CreatedPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CreatedPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CreatedPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CreatedPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCreatedPostsRecordData({
  String? status,
  String? topic,
  DateTime? timeStamp,
  String? contentReview,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'topic': topic,
      'time_stamp': timeStamp,
      'content_review': contentReview,
    }.withoutNulls,
  );

  return firestoreData;
}

class CreatedPostsRecordDocumentEquality
    implements Equality<CreatedPostsRecord> {
  const CreatedPostsRecordDocumentEquality();

  @override
  bool equals(CreatedPostsRecord? e1, CreatedPostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.status == e2?.status &&
        e1?.topic == e2?.topic &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.contentReview == e2?.contentReview &&
        listEquality.equals(e1?.content, e2?.content);
  }

  @override
  int hash(CreatedPostsRecord? e) => const ListEquality()
      .hash([e?.status, e?.topic, e?.timeStamp, e?.contentReview, e?.content]);

  @override
  bool isValidKey(Object? o) => o is CreatedPostsRecord;
}
