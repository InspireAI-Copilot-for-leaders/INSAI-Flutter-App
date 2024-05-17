import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class BroadDomainRecord extends FirestoreRecord {
  BroadDomainRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "broad_domain" field.
  String? _broadDomain;
  String get broadDomain => _broadDomain ?? '';
  bool hasBroadDomain() => _broadDomain != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _broadDomain = snapshotData['broad_domain'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('broad_domain');

  static Stream<BroadDomainRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BroadDomainRecord.fromSnapshot(s));

  static Future<BroadDomainRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BroadDomainRecord.fromSnapshot(s));

  static BroadDomainRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BroadDomainRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BroadDomainRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BroadDomainRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BroadDomainRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BroadDomainRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBroadDomainRecordData({
  String? broadDomain,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'broad_domain': broadDomain,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class BroadDomainRecordDocumentEquality implements Equality<BroadDomainRecord> {
  const BroadDomainRecordDocumentEquality();

  @override
  bool equals(BroadDomainRecord? e1, BroadDomainRecord? e2) {
    return e1?.broadDomain == e2?.broadDomain && e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(BroadDomainRecord? e) =>
      const ListEquality().hash([e?.broadDomain, e?.createdAt]);

  @override
  bool isValidKey(Object? o) => o is BroadDomainRecord;
}
