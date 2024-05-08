import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScheduledPostsRecord extends FirestoreRecord {
  ScheduledPostsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "timeOfCreation" field.
  DateTime? _timeOfCreation;
  DateTime? get timeOfCreation => _timeOfCreation;
  bool hasTimeOfCreation() => _timeOfCreation != null;

  // "postData" field.
  ScheduledPostDataStruct? _postData;
  ScheduledPostDataStruct get postData =>
      _postData ?? ScheduledPostDataStruct();
  bool hasPostData() => _postData != null;

  // "postType" field.
  String? _postType;
  String get postType => _postType ?? '';
  bool hasPostType() => _postType != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _timeOfCreation = snapshotData['timeOfCreation'] as DateTime?;
    _postData = ScheduledPostDataStruct.maybeFromMap(snapshotData['postData']);
    _postType = snapshotData['postType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scheduled_posts');

  static Stream<ScheduledPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScheduledPostsRecord.fromSnapshot(s));

  static Future<ScheduledPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScheduledPostsRecord.fromSnapshot(s));

  static ScheduledPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScheduledPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScheduledPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScheduledPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScheduledPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScheduledPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScheduledPostsRecordData({
  DocumentReference? userRef,
  DateTime? timestamp,
  DateTime? timeOfCreation,
  ScheduledPostDataStruct? postData,
  String? postType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'timestamp': timestamp,
      'timeOfCreation': timeOfCreation,
      'postData': ScheduledPostDataStruct().toMap(),
      'postType': postType,
    }.withoutNulls,
  );

  // Handle nested data for "postData" field.
  addScheduledPostDataStructData(firestoreData, postData, 'postData');

  return firestoreData;
}

class ScheduledPostsRecordDocumentEquality
    implements Equality<ScheduledPostsRecord> {
  const ScheduledPostsRecordDocumentEquality();

  @override
  bool equals(ScheduledPostsRecord? e1, ScheduledPostsRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.timestamp == e2?.timestamp &&
        e1?.timeOfCreation == e2?.timeOfCreation &&
        e1?.postData == e2?.postData &&
        e1?.postType == e2?.postType;
  }

  @override
  int hash(ScheduledPostsRecord? e) => const ListEquality().hash(
      [e?.userRef, e?.timestamp, e?.timeOfCreation, e?.postData, e?.postType]);

  @override
  bool isValidKey(Object? o) => o is ScheduledPostsRecord;
}
