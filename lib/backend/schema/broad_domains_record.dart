import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class BroadDomainsRecord extends FirestoreRecord {
  BroadDomainsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "domain" field.
  String? _domain;
  String get domain => _domain ?? '';
  bool hasDomain() => _domain != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _domain = snapshotData['domain'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('broad_domains');

  static Stream<BroadDomainsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BroadDomainsRecord.fromSnapshot(s));

  static Future<BroadDomainsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BroadDomainsRecord.fromSnapshot(s));

  static BroadDomainsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BroadDomainsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BroadDomainsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BroadDomainsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BroadDomainsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BroadDomainsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBroadDomainsRecordData({
  DateTime? createdAt,
  String? domain,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'domain': domain,
    }.withoutNulls,
  );

  return firestoreData;
}

class BroadDomainsRecordDocumentEquality
    implements Equality<BroadDomainsRecord> {
  const BroadDomainsRecordDocumentEquality();

  @override
  bool equals(BroadDomainsRecord? e1, BroadDomainsRecord? e2) {
    return e1?.createdAt == e2?.createdAt && e1?.domain == e2?.domain;
  }

  @override
  int hash(BroadDomainsRecord? e) =>
      const ListEquality().hash([e?.createdAt, e?.domain]);

  @override
  bool isValidKey(Object? o) => o is BroadDomainsRecord;
}
