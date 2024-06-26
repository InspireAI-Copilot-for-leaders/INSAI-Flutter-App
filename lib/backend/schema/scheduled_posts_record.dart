import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScheduledPostsRecord extends FirestoreRecord {
  ScheduledPostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "timeOfCreation" field.
  DateTime? _timeOfCreation;
  DateTime? get timeOfCreation => _timeOfCreation;
  bool hasTimeOfCreation() => _timeOfCreation != null;

  // "postType" field.
  String? _postType;
  String get postType => _postType ?? '';
  bool hasPostType() => _postType != null;

  // "personUrn" field.
  String? _personUrn;
  String get personUrn => _personUrn ?? '';
  bool hasPersonUrn() => _personUrn != null;

  // "accessToken" field.
  String? _accessToken;
  String get accessToken => _accessToken ?? '';
  bool hasAccessToken() => _accessToken != null;

  // "postText" field.
  String? _postText;
  String get postText => _postText ?? '';
  bool hasPostText() => _postText != null;

  // "imagesJson" field.
  String? _imagesJson;
  String get imagesJson => _imagesJson ?? '';
  bool hasImagesJson() => _imagesJson != null;

  // "mediaId" field.
  String? _mediaId;
  String get mediaId => _mediaId ?? '';
  bool hasMediaId() => _mediaId != null;

  // "mediaTitle" field.
  String? _mediaTitle;
  String get mediaTitle => _mediaTitle ?? '';
  bool hasMediaTitle() => _mediaTitle != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "optionsJson" field.
  String? _optionsJson;
  String get optionsJson => _optionsJson ?? '';
  bool hasOptionsJson() => _optionsJson != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "imageUrns" field.
  List<String>? _imageUrns;
  List<String> get imageUrns => _imageUrns ?? const [];
  bool hasImageUrns() => _imageUrns != null;

  // "linkedinImgUrls" field.
  List<String>? _linkedinImgUrls;
  List<String> get linkedinImgUrls => _linkedinImgUrls ?? const [];
  bool hasLinkedinImgUrls() => _linkedinImgUrls != null;

  // "firebaseImgUrls" field.
  List<String>? _firebaseImgUrls;
  List<String> get firebaseImgUrls => _firebaseImgUrls ?? const [];
  bool hasFirebaseImgUrls() => _firebaseImgUrls != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "docFirebaseUrl" field.
  String? _docFirebaseUrl;
  String get docFirebaseUrl => _docFirebaseUrl ?? '';
  bool hasDocFirebaseUrl() => _docFirebaseUrl != null;

  // "postTitle" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _timeOfCreation = snapshotData['timeOfCreation'] as DateTime?;
    _postType = snapshotData['postType'] as String?;
    _personUrn = snapshotData['personUrn'] as String?;
    _accessToken = snapshotData['accessToken'] as String?;
    _postText = snapshotData['postText'] as String?;
    _imagesJson = snapshotData['imagesJson'] as String?;
    _mediaId = snapshotData['mediaId'] as String?;
    _mediaTitle = snapshotData['mediaTitle'] as String?;
    _question = snapshotData['question'] as String?;
    _optionsJson = snapshotData['optionsJson'] as String?;
    _duration = snapshotData['duration'] as String?;
    _imageUrns = getDataList(snapshotData['imageUrns']);
    _linkedinImgUrls = getDataList(snapshotData['linkedinImgUrls']);
    _firebaseImgUrls = getDataList(snapshotData['firebaseImgUrls']);
    _status = snapshotData['status'] as String?;
    _docFirebaseUrl = snapshotData['docFirebaseUrl'] as String?;
    _postTitle = snapshotData['postTitle'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('scheduled_posts');

  static Stream<ScheduledPostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ScheduledPostsRecord.fromSnapshot(s));

  static Future<ScheduledPostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ScheduledPostsRecord.fromSnapshot(s));

  static ScheduledPostsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ScheduledPostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ScheduledPostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ScheduledPostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ScheduledPostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ScheduledPostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createScheduledPostsRecordData({
  DocumentReference? userRef,
  DateTime? timestamp,
  DateTime? timeOfCreation,
  String? postType,
  String? personUrn,
  String? accessToken,
  String? postText,
  String? imagesJson,
  String? mediaId,
  String? mediaTitle,
  String? question,
  String? optionsJson,
  String? duration,
  String? status,
  String? docFirebaseUrl,
  String? postTitle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'timestamp': timestamp,
      'timeOfCreation': timeOfCreation,
      'postType': postType,
      'personUrn': personUrn,
      'accessToken': accessToken,
      'postText': postText,
      'imagesJson': imagesJson,
      'mediaId': mediaId,
      'mediaTitle': mediaTitle,
      'question': question,
      'optionsJson': optionsJson,
      'duration': duration,
      'status': status,
      'docFirebaseUrl': docFirebaseUrl,
      'postTitle': postTitle,
    }.withoutNulls,
  );

  return firestoreData;
}

class ScheduledPostsRecordDocumentEquality
    implements Equality<ScheduledPostsRecord> {
  const ScheduledPostsRecordDocumentEquality();

  @override
  bool equals(ScheduledPostsRecord? e1, ScheduledPostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.timestamp == e2?.timestamp &&
        e1?.timeOfCreation == e2?.timeOfCreation &&
        e1?.postType == e2?.postType &&
        e1?.personUrn == e2?.personUrn &&
        e1?.accessToken == e2?.accessToken &&
        e1?.postText == e2?.postText &&
        e1?.imagesJson == e2?.imagesJson &&
        e1?.mediaId == e2?.mediaId &&
        e1?.mediaTitle == e2?.mediaTitle &&
        e1?.question == e2?.question &&
        e1?.optionsJson == e2?.optionsJson &&
        e1?.duration == e2?.duration &&
        listEquality.equals(e1?.imageUrns, e2?.imageUrns) &&
        listEquality.equals(e1?.linkedinImgUrls, e2?.linkedinImgUrls) &&
        listEquality.equals(e1?.firebaseImgUrls, e2?.firebaseImgUrls) &&
        e1?.status == e2?.status &&
        e1?.docFirebaseUrl == e2?.docFirebaseUrl &&
        e1?.postTitle == e2?.postTitle;
  }

  @override
  int hash(ScheduledPostsRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.timestamp,
        e?.timeOfCreation,
        e?.postType,
        e?.personUrn,
        e?.accessToken,
        e?.postText,
        e?.imagesJson,
        e?.mediaId,
        e?.mediaTitle,
        e?.question,
        e?.optionsJson,
        e?.duration,
        e?.imageUrns,
        e?.linkedinImgUrls,
        e?.firebaseImgUrls,
        e?.status,
        e?.docFirebaseUrl,
        e?.postTitle
      ]);

  @override
  bool isValidKey(Object? o) => o is ScheduledPostsRecord;
}
