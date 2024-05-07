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

  // "personUrn" field.
  String? _personUrn;
  String get personUrn => _personUrn ?? '';
  bool hasPersonUrn() => _personUrn != null;

  // "accessToken" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  bool hasAccessToken() => _accessToken != null;

  // "postText" field.
  String? _postText;
  String get postText => _postText ?? '';
  bool hasPostText() => _postText != null;

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

  void _initializeFields() {
    _personUrn = snapshotData['personUrn'] as String?;
    _accessToken = snapshotData['accessToken'] as String?;
    _postText = snapshotData['postText'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _timeOfCreation = snapshotData['timeOfCreation'] as DateTime?;
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
  String? personUrn,
  String? accessToken,
  String? postText,
  DocumentReference? userRef,
  DateTime? timestamp,
  DateTime? timeOfCreation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'personUrn': personUrn,
      'accessToken': accessToken,
      'postText': postText,
      'userRef': userRef,
      'timestamp': timestamp,
      'timeOfCreation': timeOfCreation,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScheduledPostsRecordDocumentEquality
    implements Equality<ScheduledPostsRecord> {
  const ScheduledPostsRecordDocumentEquality();

  @override
  bool equals(ScheduledPostsRecord? e1, ScheduledPostsRecord? e2) {
    return e1?.personUrn == e2?.personUrn &&
        e1?.accessToken == e2?.accessToken &&
        e1?.postText == e2?.postText &&
        e1?.userRef == e2?.userRef &&
        e1?.timestamp == e2?.timestamp &&
        e1?.timeOfCreation == e2?.timeOfCreation;
  }

  @override
  int hash(ScheduledPostsRecord? e) => const ListEquality().hash([
        e?.personUrn,
        e?.accessToken,
        e?.postText,
        e?.userRef,
        e?.timestamp,
        e?.timeOfCreation
      ]);

  @override
  bool isValidKey(Object? o) => o is ScheduledPostsRecord;
}
