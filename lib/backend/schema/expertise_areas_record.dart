import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExpertiseAreasRecord extends FirestoreRecord {
  ExpertiseAreasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "expertise_area" field.
  String? _expertiseArea;
  String get expertiseArea => _expertiseArea ?? '';
  bool hasExpertiseArea() => _expertiseArea != null;

  // "number_of_articles" field.
  int? _numberOfArticles;
  int get numberOfArticles => _numberOfArticles ?? 0;
  bool hasNumberOfArticles() => _numberOfArticles != null;

  // "number_of_users" field.
  int? _numberOfUsers;
  int get numberOfUsers => _numberOfUsers ?? 0;
  bool hasNumberOfUsers() => _numberOfUsers != null;

  // "usersInThis" field.
  List<DocumentReference>? _usersInThis;
  List<DocumentReference> get usersInThis => _usersInThis ?? const [];
  bool hasUsersInThis() => _usersInThis != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _expertiseArea = snapshotData['expertise_area'] as String?;
    _numberOfArticles = castToType<int>(snapshotData['number_of_articles']);
    _numberOfUsers = castToType<int>(snapshotData['number_of_users']);
    _usersInThis = getDataList(snapshotData['usersInThis']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('expertise_areas')
          : FirebaseFirestore.instance.collectionGroup('expertise_areas');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('expertise_areas').doc(id);

  static Stream<ExpertiseAreasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExpertiseAreasRecord.fromSnapshot(s));

  static Future<ExpertiseAreasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExpertiseAreasRecord.fromSnapshot(s));

  static ExpertiseAreasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExpertiseAreasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExpertiseAreasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExpertiseAreasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExpertiseAreasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExpertiseAreasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExpertiseAreasRecordData({
  DateTime? createdAt,
  String? expertiseArea,
  int? numberOfArticles,
  int? numberOfUsers,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'expertise_area': expertiseArea,
      'number_of_articles': numberOfArticles,
      'number_of_users': numberOfUsers,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExpertiseAreasRecordDocumentEquality
    implements Equality<ExpertiseAreasRecord> {
  const ExpertiseAreasRecordDocumentEquality();

  @override
  bool equals(ExpertiseAreasRecord? e1, ExpertiseAreasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.expertiseArea == e2?.expertiseArea &&
        e1?.numberOfArticles == e2?.numberOfArticles &&
        e1?.numberOfUsers == e2?.numberOfUsers &&
        listEquality.equals(e1?.usersInThis, e2?.usersInThis);
  }

  @override
  int hash(ExpertiseAreasRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.expertiseArea,
        e?.numberOfArticles,
        e?.numberOfUsers,
        e?.usersInThis
      ]);

  @override
  bool isValidKey(Object? o) => o is ExpertiseAreasRecord;
}
