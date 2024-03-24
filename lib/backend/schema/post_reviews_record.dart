import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostReviewsRecord extends FirestoreRecord {
  PostReviewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "postRef" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "problemDescription" field.
  String? _problemDescription;
  String get problemDescription => _problemDescription ?? '';
  bool hasProblemDescription() => _problemDescription != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "problems" field.
  List<String>? _problems;
  List<String> get problems => _problems ?? const [];
  bool hasProblems() => _problems != null;

  void _initializeFields() {
    _postRef = snapshotData['postRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _problemDescription = snapshotData['problemDescription'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _problems = getDataList(snapshotData['problems']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('postReviews');

  static Stream<PostReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostReviewsRecord.fromSnapshot(s));

  static Future<PostReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostReviewsRecord.fromSnapshot(s));

  static PostReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostReviewsRecordData({
  DocumentReference? postRef,
  DocumentReference? userRef,
  String? problemDescription,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postRef': postRef,
      'userRef': userRef,
      'problemDescription': problemDescription,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostReviewsRecordDocumentEquality implements Equality<PostReviewsRecord> {
  const PostReviewsRecordDocumentEquality();

  @override
  bool equals(PostReviewsRecord? e1, PostReviewsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.postRef == e2?.postRef &&
        e1?.userRef == e2?.userRef &&
        e1?.problemDescription == e2?.problemDescription &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.problems, e2?.problems);
  }

  @override
  int hash(PostReviewsRecord? e) => const ListEquality().hash([
        e?.postRef,
        e?.userRef,
        e?.problemDescription,
        e?.timestamp,
        e?.problems
      ]);

  @override
  bool isValidKey(Object? o) => o is PostReviewsRecord;
}
