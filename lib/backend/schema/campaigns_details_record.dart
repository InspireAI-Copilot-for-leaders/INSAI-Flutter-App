import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CampaignsDetailsRecord extends FirestoreRecord {
  CampaignsDetailsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "campaignId" field.
  String? _campaignId;
  String get campaignId => _campaignId ?? '';
  bool hasCampaignId() => _campaignId != null;

  // "createdOn" field.
  DateTime? _createdOn;
  DateTime? get createdOn => _createdOn;
  bool hasCreatedOn() => _createdOn != null;

  // "campaignTitle" field.
  String? _campaignTitle;
  String get campaignTitle => _campaignTitle ?? '';
  bool hasCampaignTitle() => _campaignTitle != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _campaignId = snapshotData['campaignId'] as String?;
    _createdOn = snapshotData['createdOn'] as DateTime?;
    _campaignTitle = snapshotData['campaignTitle'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('campaignsDetails')
          : FirebaseFirestore.instance.collectionGroup('campaignsDetails');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('campaignsDetails').doc(id);

  static Stream<CampaignsDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CampaignsDetailsRecord.fromSnapshot(s));

  static Future<CampaignsDetailsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CampaignsDetailsRecord.fromSnapshot(s));

  static CampaignsDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CampaignsDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CampaignsDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CampaignsDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CampaignsDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CampaignsDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCampaignsDetailsRecordData({
  String? campaignId,
  DateTime? createdOn,
  String? campaignTitle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'campaignId': campaignId,
      'createdOn': createdOn,
      'campaignTitle': campaignTitle,
    }.withoutNulls,
  );

  return firestoreData;
}

class CampaignsDetailsRecordDocumentEquality
    implements Equality<CampaignsDetailsRecord> {
  const CampaignsDetailsRecordDocumentEquality();

  @override
  bool equals(CampaignsDetailsRecord? e1, CampaignsDetailsRecord? e2) {
    return e1?.campaignId == e2?.campaignId &&
        e1?.createdOn == e2?.createdOn &&
        e1?.campaignTitle == e2?.campaignTitle;
  }

  @override
  int hash(CampaignsDetailsRecord? e) => const ListEquality()
      .hash([e?.campaignId, e?.createdOn, e?.campaignTitle]);

  @override
  bool isValidKey(Object? o) => o is CampaignsDetailsRecord;
}
