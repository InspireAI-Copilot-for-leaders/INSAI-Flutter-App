import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExpertiseAreasCollectionRecord extends FirestoreRecord {
  ExpertiseAreasCollectionRecord._(
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

  // "usersInThis" field.
  List<DocumentReference>? _usersInThis;
  List<DocumentReference> get usersInThis => _usersInThis ?? const [];
  bool hasUsersInThis() => _usersInThis != null;

  // "number_of_users" field.
  int? _numberOfUsers;
  int get numberOfUsers => _numberOfUsers ?? 0;
  bool hasNumberOfUsers() => _numberOfUsers != null;

  // "number_of_articles" field.
  int? _numberOfArticles;
  int get numberOfArticles => _numberOfArticles ?? 0;
  bool hasNumberOfArticles() => _numberOfArticles != null;

  // "broadDomain" field.
  DocumentReference? _broadDomain;
  DocumentReference? get broadDomain => _broadDomain;
  bool hasBroadDomain() => _broadDomain != null;

  void _initializeFields() {
    _createdAt = snapshotData['created_at'] as DateTime?;
    _expertiseArea = snapshotData['expertise_area'] as String?;
    _usersInThis = getDataList(snapshotData['usersInThis']);
    _numberOfUsers = castToType<int>(snapshotData['number_of_users']);
    _numberOfArticles = castToType<int>(snapshotData['number_of_articles']);
    _broadDomain = snapshotData['broadDomain'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('expertiseAreasCollection');

  static Stream<ExpertiseAreasCollectionRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => ExpertiseAreasCollectionRecord.fromSnapshot(s));

  static Future<ExpertiseAreasCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ExpertiseAreasCollectionRecord.fromSnapshot(s));

  static ExpertiseAreasCollectionRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      ExpertiseAreasCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExpertiseAreasCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExpertiseAreasCollectionRecord._(reference, mapFromFirestore(data));

  static ExpertiseAreasCollectionRecord fromAlgolia(
          AlgoliaObjectSnapshot snapshot) =>
      ExpertiseAreasCollectionRecord.getDocumentFromData(
        {
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'expertise_area': snapshot.data['expertise_area'],
          'usersInThis': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['usersInThis'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'number_of_users': convertAlgoliaParam(
            snapshot.data['number_of_users'],
            ParamType.int,
            false,
          ),
          'number_of_articles': convertAlgoliaParam(
            snapshot.data['number_of_articles'],
            ParamType.int,
            false,
          ),
          'broadDomain': convertAlgoliaParam(
            snapshot.data['broadDomain'],
            ParamType.DocumentReference,
            false,
          ),
        },
        ExpertiseAreasCollectionRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ExpertiseAreasCollectionRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'expertiseAreasCollection',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ExpertiseAreasCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExpertiseAreasCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExpertiseAreasCollectionRecordData({
  DateTime? createdAt,
  String? expertiseArea,
  int? numberOfUsers,
  int? numberOfArticles,
  DocumentReference? broadDomain,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_at': createdAt,
      'expertise_area': expertiseArea,
      'number_of_users': numberOfUsers,
      'number_of_articles': numberOfArticles,
      'broadDomain': broadDomain,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExpertiseAreasCollectionRecordDocumentEquality
    implements Equality<ExpertiseAreasCollectionRecord> {
  const ExpertiseAreasCollectionRecordDocumentEquality();

  @override
  bool equals(
      ExpertiseAreasCollectionRecord? e1, ExpertiseAreasCollectionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdAt == e2?.createdAt &&
        e1?.expertiseArea == e2?.expertiseArea &&
        listEquality.equals(e1?.usersInThis, e2?.usersInThis) &&
        e1?.numberOfUsers == e2?.numberOfUsers &&
        e1?.numberOfArticles == e2?.numberOfArticles &&
        e1?.broadDomain == e2?.broadDomain;
  }

  @override
  int hash(ExpertiseAreasCollectionRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.expertiseArea,
        e?.usersInThis,
        e?.numberOfUsers,
        e?.numberOfArticles,
        e?.broadDomain
      ]);

  @override
  bool isValidKey(Object? o) => o is ExpertiseAreasCollectionRecord;
}
