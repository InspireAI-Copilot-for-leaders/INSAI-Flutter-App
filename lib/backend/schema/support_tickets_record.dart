import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SupportTicketsRecord extends FirestoreRecord {
  SupportTicketsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "problemDescription" field.
  String? _problemDescription;
  String get problemDescription => _problemDescription ?? '';
  bool hasProblemDescription() => _problemDescription != null;

  // "screenshots" field.
  List<String>? _screenshots;
  List<String> get screenshots => _screenshots ?? const [];
  bool hasScreenshots() => _screenshots != null;

  // "datetimeOfProblem" field.
  String? _datetimeOfProblem;
  String get datetimeOfProblem => _datetimeOfProblem ?? '';
  bool hasDatetimeOfProblem() => _datetimeOfProblem != null;

  // "BreifDescription" field.
  String? _breifDescription;
  String get breifDescription => _breifDescription ?? '';
  bool hasBreifDescription() => _breifDescription != null;

  void _initializeFields() {
    _problemDescription = snapshotData['problemDescription'] as String?;
    _screenshots = getDataList(snapshotData['screenshots']);
    _datetimeOfProblem = snapshotData['datetimeOfProblem'] as String?;
    _breifDescription = snapshotData['BreifDescription'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('supportTickets');

  static Stream<SupportTicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SupportTicketsRecord.fromSnapshot(s));

  static Future<SupportTicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SupportTicketsRecord.fromSnapshot(s));

  static SupportTicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SupportTicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SupportTicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SupportTicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SupportTicketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SupportTicketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSupportTicketsRecordData({
  String? problemDescription,
  String? datetimeOfProblem,
  String? breifDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'problemDescription': problemDescription,
      'datetimeOfProblem': datetimeOfProblem,
      'BreifDescription': breifDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class SupportTicketsRecordDocumentEquality
    implements Equality<SupportTicketsRecord> {
  const SupportTicketsRecordDocumentEquality();

  @override
  bool equals(SupportTicketsRecord? e1, SupportTicketsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.problemDescription == e2?.problemDescription &&
        listEquality.equals(e1?.screenshots, e2?.screenshots) &&
        e1?.datetimeOfProblem == e2?.datetimeOfProblem &&
        e1?.breifDescription == e2?.breifDescription;
  }

  @override
  int hash(SupportTicketsRecord? e) => const ListEquality().hash([
        e?.problemDescription,
        e?.screenshots,
        e?.datetimeOfProblem,
        e?.breifDescription
      ]);

  @override
  bool isValidKey(Object? o) => o is SupportTicketsRecord;
}
