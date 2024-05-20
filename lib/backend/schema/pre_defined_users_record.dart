import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PreDefinedUsersRecord extends FirestoreRecord {
  PreDefinedUsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "linkedinUrl" field.
  String? _linkedinUrl;
  String get linkedinUrl => _linkedinUrl ?? '';
  bool hasLinkedinUrl() => _linkedinUrl != null;

  // "thought_leadership_areas" field.
  List<String>? _thoughtLeadershipAreas;
  List<String> get thoughtLeadershipAreas =>
      _thoughtLeadershipAreas ?? const [];
  bool hasThoughtLeadershipAreas() => _thoughtLeadershipAreas != null;

  // "broad_domains" field.
  List<String>? _broadDomains;
  List<String> get broadDomains => _broadDomains ?? const [];
  bool hasBroadDomains() => _broadDomains != null;

  // "thought_leadership_areas_mapping" field.
  List<ThoughtLeadershipAreasMappingStruct>? _thoughtLeadershipAreasMapping;
  List<ThoughtLeadershipAreasMappingStruct> get thoughtLeadershipAreasMapping =>
      _thoughtLeadershipAreasMapping ?? const [];
  bool hasThoughtLeadershipAreasMapping() =>
      _thoughtLeadershipAreasMapping != null;

  void _initializeFields() {
    _linkedinUrl = snapshotData['linkedinUrl'] as String?;
    _thoughtLeadershipAreas =
        getDataList(snapshotData['thought_leadership_areas']);
    _broadDomains = getDataList(snapshotData['broad_domains']);
    _thoughtLeadershipAreasMapping = getStructList(
      snapshotData['thought_leadership_areas_mapping'],
      ThoughtLeadershipAreasMappingStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('preDefinedUsers');

  static Stream<PreDefinedUsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PreDefinedUsersRecord.fromSnapshot(s));

  static Future<PreDefinedUsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PreDefinedUsersRecord.fromSnapshot(s));

  static PreDefinedUsersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PreDefinedUsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PreDefinedUsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PreDefinedUsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PreDefinedUsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PreDefinedUsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPreDefinedUsersRecordData({
  String? linkedinUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'linkedinUrl': linkedinUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class PreDefinedUsersRecordDocumentEquality
    implements Equality<PreDefinedUsersRecord> {
  const PreDefinedUsersRecordDocumentEquality();

  @override
  bool equals(PreDefinedUsersRecord? e1, PreDefinedUsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.linkedinUrl == e2?.linkedinUrl &&
        listEquality.equals(
            e1?.thoughtLeadershipAreas, e2?.thoughtLeadershipAreas) &&
        listEquality.equals(e1?.broadDomains, e2?.broadDomains) &&
        listEquality.equals(e1?.thoughtLeadershipAreasMapping,
            e2?.thoughtLeadershipAreasMapping);
  }

  @override
  int hash(PreDefinedUsersRecord? e) => const ListEquality().hash([
        e?.linkedinUrl,
        e?.thoughtLeadershipAreas,
        e?.broadDomains,
        e?.thoughtLeadershipAreasMapping
      ]);

  @override
  bool isValidKey(Object? o) => o is PreDefinedUsersRecord;
}
