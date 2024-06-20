import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToBeReviewedRecord extends FirestoreRecord {
  ToBeReviewedRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "addedByUser" field.
  List<String>? _addedByUser;
  List<String> get addedByUser => _addedByUser ?? const [];
  bool hasAddedByUser() => _addedByUser != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _addedByUser = getDataList(snapshotData['addedByUser']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('to_be_reviewed');

  static Stream<ToBeReviewedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToBeReviewedRecord.fromSnapshot(s));

  static Future<ToBeReviewedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToBeReviewedRecord.fromSnapshot(s));

  static ToBeReviewedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ToBeReviewedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToBeReviewedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToBeReviewedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToBeReviewedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToBeReviewedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createToBeReviewedRecordData({
  String? uid,
  DateTime? time,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'time': time,
    }.withoutNulls,
  );

  return firestoreData;
}

class ToBeReviewedRecordDocumentEquality
    implements Equality<ToBeReviewedRecord> {
  const ToBeReviewedRecordDocumentEquality();

  @override
  bool equals(ToBeReviewedRecord? e1, ToBeReviewedRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.time == e2?.time &&
        listEquality.equals(e1?.addedByUser, e2?.addedByUser);
  }

  @override
  int hash(ToBeReviewedRecord? e) =>
      const ListEquality().hash([e?.uid, e?.time, e?.addedByUser]);

  @override
  bool isValidKey(Object? o) => o is ToBeReviewedRecord;
}
