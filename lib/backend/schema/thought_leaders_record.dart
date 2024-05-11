import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ThoughtLeadersRecord extends FirestoreRecord {
  ThoughtLeadersRecord._(
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

  // "designation" field.
  String? _designation;
  String get designation => _designation ?? '';
  bool hasDesignation() => _designation != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "speaks_about" field.
  List<String>? _speaksAbout;
  List<String> get speaksAbout => _speaksAbout ?? const [];
  bool hasSpeaksAbout() => _speaksAbout != null;

  // "image_link" field.
  String? _imageLink;
  String get imageLink => _imageLink ?? '';
  bool hasImageLink() => _imageLink != null;

  void _initializeFields() {
    _broadDomain = snapshotData['broad_domain'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _designation = snapshotData['designation'] as String?;
    _name = snapshotData['name'] as String?;
    _speaksAbout = getDataList(snapshotData['speaks_about']);
    _imageLink = snapshotData['image_link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('thought_leaders');

  static Stream<ThoughtLeadersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ThoughtLeadersRecord.fromSnapshot(s));

  static Future<ThoughtLeadersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ThoughtLeadersRecord.fromSnapshot(s));

  static ThoughtLeadersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ThoughtLeadersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ThoughtLeadersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ThoughtLeadersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ThoughtLeadersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ThoughtLeadersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createThoughtLeadersRecordData({
  String? broadDomain,
  DateTime? createdAt,
  String? designation,
  String? name,
  String? imageLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'broad_domain': broadDomain,
      'created_at': createdAt,
      'designation': designation,
      'name': name,
      'image_link': imageLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class ThoughtLeadersRecordDocumentEquality
    implements Equality<ThoughtLeadersRecord> {
  const ThoughtLeadersRecordDocumentEquality();

  @override
  bool equals(ThoughtLeadersRecord? e1, ThoughtLeadersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.broadDomain == e2?.broadDomain &&
        e1?.createdAt == e2?.createdAt &&
        e1?.designation == e2?.designation &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.speaksAbout, e2?.speaksAbout) &&
        e1?.imageLink == e2?.imageLink;
  }

  @override
  int hash(ThoughtLeadersRecord? e) => const ListEquality().hash([
        e?.broadDomain,
        e?.createdAt,
        e?.designation,
        e?.name,
        e?.speaksAbout,
        e?.imageLink
      ]);

  @override
  bool isValidKey(Object? o) => o is ThoughtLeadersRecord;
}
