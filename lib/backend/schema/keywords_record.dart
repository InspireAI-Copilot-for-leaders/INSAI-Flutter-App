import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class KeywordsRecord extends FirestoreRecord {
  KeywordsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "keywords" field.
  String? _keywords;
  String get keywords => _keywords ?? '';
  bool hasKeywords() => _keywords != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _keywords = snapshotData['keywords'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('keywords')
          : FirebaseFirestore.instance.collectionGroup('keywords');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('keywords').doc(id);

  static Stream<KeywordsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KeywordsRecord.fromSnapshot(s));

  static Future<KeywordsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KeywordsRecord.fromSnapshot(s));

  static KeywordsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KeywordsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KeywordsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KeywordsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KeywordsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KeywordsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKeywordsRecordData({
  DateTime? createdAt,
  String? keywords,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'keywords': keywords,
    }.withoutNulls,
  );

  return firestoreData;
}

class KeywordsRecordDocumentEquality implements Equality<KeywordsRecord> {
  const KeywordsRecordDocumentEquality();

  @override
  bool equals(KeywordsRecord? e1, KeywordsRecord? e2) {
    return e1?.createdAt == e2?.createdAt && e1?.keywords == e2?.keywords;
  }

  @override
  int hash(KeywordsRecord? e) =>
      const ListEquality().hash([e?.createdAt, e?.keywords]);

  @override
  bool isValidKey(Object? o) => o is KeywordsRecord;
}
