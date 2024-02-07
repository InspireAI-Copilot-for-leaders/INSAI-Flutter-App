import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostedOnLinkedinRecord extends FirestoreRecord {
  PostedOnLinkedinRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "postURN" field.
  String? _postURN;
  String get postURN => _postURN ?? '';
  bool hasPostURN() => _postURN != null;

  // "postedOn" field.
  DateTime? _postedOn;
  DateTime? get postedOn => _postedOn;
  bool hasPostedOn() => _postedOn != null;

  // "postText" field.
  String? _postText;
  String get postText => _postText ?? '';
  bool hasPostText() => _postText != null;

  // "postTitle" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "likesNumber" field.
  int? _likesNumber;
  int get likesNumber => _likesNumber ?? 0;
  bool hasLikesNumber() => _likesNumber != null;

  // "commentsNumber" field.
  int? _commentsNumber;
  int get commentsNumber => _commentsNumber ?? 0;
  bool hasCommentsNumber() => _commentsNumber != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _postURN = snapshotData['postURN'] as String?;
    _postedOn = snapshotData['postedOn'] as DateTime?;
    _postText = snapshotData['postText'] as String?;
    _postTitle = snapshotData['postTitle'] as String?;
    _likesNumber = castToType<int>(snapshotData['likesNumber']);
    _commentsNumber = castToType<int>(snapshotData['commentsNumber']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('postedOnLinkedin')
          : FirebaseFirestore.instance.collectionGroup('postedOnLinkedin');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('postedOnLinkedin').doc(id);

  static Stream<PostedOnLinkedinRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostedOnLinkedinRecord.fromSnapshot(s));

  static Future<PostedOnLinkedinRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PostedOnLinkedinRecord.fromSnapshot(s));

  static PostedOnLinkedinRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostedOnLinkedinRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostedOnLinkedinRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostedOnLinkedinRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostedOnLinkedinRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostedOnLinkedinRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostedOnLinkedinRecordData({
  String? postURN,
  DateTime? postedOn,
  String? postText,
  String? postTitle,
  int? likesNumber,
  int? commentsNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'postURN': postURN,
      'postedOn': postedOn,
      'postText': postText,
      'postTitle': postTitle,
      'likesNumber': likesNumber,
      'commentsNumber': commentsNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostedOnLinkedinRecordDocumentEquality
    implements Equality<PostedOnLinkedinRecord> {
  const PostedOnLinkedinRecordDocumentEquality();

  @override
  bool equals(PostedOnLinkedinRecord? e1, PostedOnLinkedinRecord? e2) {
    return e1?.postURN == e2?.postURN &&
        e1?.postedOn == e2?.postedOn &&
        e1?.postText == e2?.postText &&
        e1?.postTitle == e2?.postTitle &&
        e1?.likesNumber == e2?.likesNumber &&
        e1?.commentsNumber == e2?.commentsNumber;
  }

  @override
  int hash(PostedOnLinkedinRecord? e) => const ListEquality().hash([
        e?.postURN,
        e?.postedOn,
        e?.postText,
        e?.postTitle,
        e?.likesNumber,
        e?.commentsNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is PostedOnLinkedinRecord;
}
