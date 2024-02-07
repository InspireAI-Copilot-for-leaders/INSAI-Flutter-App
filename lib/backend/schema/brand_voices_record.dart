import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class BrandVoicesRecord extends FirestoreRecord {
  BrandVoicesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "voice" field.
  String? _voice;
  String get voice => _voice ?? '';
  bool hasVoice() => _voice != null;

  // "voice_displayed" field.
  String? _voiceDisplayed;
  String get voiceDisplayed => _voiceDisplayed ?? '';
  bool hasVoiceDisplayed() => _voiceDisplayed != null;

  void _initializeFields() {
    _voice = snapshotData['voice'] as String?;
    _voiceDisplayed = snapshotData['voice_displayed'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('brand_voices');

  static Stream<BrandVoicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BrandVoicesRecord.fromSnapshot(s));

  static Future<BrandVoicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BrandVoicesRecord.fromSnapshot(s));

  static BrandVoicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BrandVoicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BrandVoicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BrandVoicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BrandVoicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BrandVoicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBrandVoicesRecordData({
  String? voice,
  String? voiceDisplayed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'voice': voice,
      'voice_displayed': voiceDisplayed,
    }.withoutNulls,
  );

  return firestoreData;
}

class BrandVoicesRecordDocumentEquality implements Equality<BrandVoicesRecord> {
  const BrandVoicesRecordDocumentEquality();

  @override
  bool equals(BrandVoicesRecord? e1, BrandVoicesRecord? e2) {
    return e1?.voice == e2?.voice && e1?.voiceDisplayed == e2?.voiceDisplayed;
  }

  @override
  int hash(BrandVoicesRecord? e) =>
      const ListEquality().hash([e?.voice, e?.voiceDisplayed]);

  @override
  bool isValidKey(Object? o) => o is BrandVoicesRecord;
}
