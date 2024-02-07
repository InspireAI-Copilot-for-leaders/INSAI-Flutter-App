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

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "time_stamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _topic = snapshotData['topic'] as String?;
    _content = snapshotData['content'] as String?;
    _timeStamp = snapshotData['time_stamp'] as DateTime?;
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
  String? content,
  DateTime? timeStamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'topic': topic,
      'content': content,
      'time_stamp': timeStamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class CreatedPostsRecordDocumentEquality
    implements Equality<CreatedPostsRecord> {
  const CreatedPostsRecordDocumentEquality();

  @override
  bool equals(CreatedPostsRecord? e1, CreatedPostsRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.topic == e2?.topic &&
        e1?.content == e2?.content &&
        e1?.timeStamp == e2?.timeStamp;
  }

  @override
  int hash(CreatedPostsRecord? e) => const ListEquality()
      .hash([e?.status, e?.topic, e?.content, e?.timeStamp]);

  @override
  bool isValidKey(Object? o) => o is CreatedPostsRecord;
}
