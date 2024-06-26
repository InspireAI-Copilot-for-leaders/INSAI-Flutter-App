import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CampaignRecord extends FirestoreRecord {
  CampaignRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "campaign_id" field.
  String? _campaignId;
  String get campaignId => _campaignId ?? '';
  bool hasCampaignId() => _campaignId != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  bool hasContent() => _content != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "final_post" field.
  String? _finalPost;
  String get finalPost => _finalPost ?? '';
  bool hasFinalPost() => _finalPost != null;

  // "scheduledTime" field.
  DateTime? _scheduledTime;
  DateTime? get scheduledTime => _scheduledTime;
  bool hasScheduledTime() => _scheduledTime != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "domain" field.
  String? _domain;
  String get domain => _domain ?? '';
  bool hasDomain() => _domain != null;

  // "expertise_area" field.
  String? _expertiseArea;
  String get expertiseArea => _expertiseArea ?? '';
  bool hasExpertiseArea() => _expertiseArea != null;

  // "scheduledPostRef" field.
  DocumentReference? _scheduledPostRef;
  DocumentReference? get scheduledPostRef => _scheduledPostRef;
  bool hasScheduledPostRef() => _scheduledPostRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _campaignId = snapshotData['campaign_id'] as String?;
    _content = snapshotData['content'] as String?;
    _status = snapshotData['status'] as String?;
    _finalPost = snapshotData['final_post'] as String?;
    _scheduledTime = snapshotData['scheduledTime'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _companyName = snapshotData['company_name'] as String?;
    _domain = snapshotData['domain'] as String?;
    _expertiseArea = snapshotData['expertise_area'] as String?;
    _scheduledPostRef = snapshotData['scheduledPostRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('campaign')
          : FirebaseFirestore.instance.collectionGroup('campaign');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('campaign').doc(id);

  static Stream<CampaignRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CampaignRecord.fromSnapshot(s));

  static Future<CampaignRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CampaignRecord.fromSnapshot(s));

  static CampaignRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CampaignRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CampaignRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CampaignRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CampaignRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CampaignRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCampaignRecordData({
  String? campaignId,
  String? content,
  String? status,
  String? finalPost,
  DateTime? scheduledTime,
  String? type,
  String? companyName,
  String? domain,
  String? expertiseArea,
  DocumentReference? scheduledPostRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'campaign_id': campaignId,
      'content': content,
      'status': status,
      'final_post': finalPost,
      'scheduledTime': scheduledTime,
      'type': type,
      'company_name': companyName,
      'domain': domain,
      'expertise_area': expertiseArea,
      'scheduledPostRef': scheduledPostRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CampaignRecordDocumentEquality implements Equality<CampaignRecord> {
  const CampaignRecordDocumentEquality();

  @override
  bool equals(CampaignRecord? e1, CampaignRecord? e2) {
    return e1?.campaignId == e2?.campaignId &&
        e1?.content == e2?.content &&
        e1?.status == e2?.status &&
        e1?.finalPost == e2?.finalPost &&
        e1?.scheduledTime == e2?.scheduledTime &&
        e1?.type == e2?.type &&
        e1?.companyName == e2?.companyName &&
        e1?.domain == e2?.domain &&
        e1?.expertiseArea == e2?.expertiseArea &&
        e1?.scheduledPostRef == e2?.scheduledPostRef;
  }

  @override
  int hash(CampaignRecord? e) => const ListEquality().hash([
        e?.campaignId,
        e?.content,
        e?.status,
        e?.finalPost,
        e?.scheduledTime,
        e?.type,
        e?.companyName,
        e?.domain,
        e?.expertiseArea,
        e?.scheduledPostRef
      ]);

  @override
  bool isValidKey(Object? o) => o is CampaignRecord;
}
