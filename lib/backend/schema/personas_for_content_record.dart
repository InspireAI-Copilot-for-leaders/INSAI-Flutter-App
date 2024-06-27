import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonasForContentRecord extends FirestoreRecord {
  PersonasForContentRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "persona" field.
  String? _persona;
  String get persona => _persona ?? '';
  bool hasPersona() => _persona != null;

  // "usersInThis" field.
  List<DocumentReference>? _usersInThis;
  List<DocumentReference> get usersInThis => _usersInThis ?? const [];
  bool hasUsersInThis() => _usersInThis != null;

  void _initializeFields() {
    _persona = snapshotData['persona'] as String?;
    _usersInThis = getDataList(snapshotData['usersInThis']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('personasForContent');

  static Stream<PersonasForContentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PersonasForContentRecord.fromSnapshot(s));

  static Future<PersonasForContentRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PersonasForContentRecord.fromSnapshot(s));

  static PersonasForContentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PersonasForContentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PersonasForContentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PersonasForContentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PersonasForContentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PersonasForContentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPersonasForContentRecordData({
  String? persona,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'persona': persona,
    }.withoutNulls,
  );

  return firestoreData;
}

class PersonasForContentRecordDocumentEquality
    implements Equality<PersonasForContentRecord> {
  const PersonasForContentRecordDocumentEquality();

  @override
  bool equals(PersonasForContentRecord? e1, PersonasForContentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.persona == e2?.persona &&
        listEquality.equals(e1?.usersInThis, e2?.usersInThis);
  }

  @override
  int hash(PersonasForContentRecord? e) =>
      const ListEquality().hash([e?.persona, e?.usersInThis]);

  @override
  bool isValidKey(Object? o) => o is PersonasForContentRecord;
}
