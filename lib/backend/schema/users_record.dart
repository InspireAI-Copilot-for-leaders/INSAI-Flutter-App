import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "linkedin_details" field.
  LinkedinDetailsAuthStruct? _linkedinDetails;
  LinkedinDetailsAuthStruct get linkedinDetails =>
      _linkedinDetails ?? LinkedinDetailsAuthStruct();
  bool hasLinkedinDetails() => _linkedinDetails != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "thought_leadership_areas" field.
  List<String>? _thoughtLeadershipAreas;
  List<String> get thoughtLeadershipAreas =>
      _thoughtLeadershipAreas ?? const [];
  bool hasThoughtLeadershipAreas() => _thoughtLeadershipAreas != null;

  // "linkedin_urn" field.
  String? _linkedinUrn;
  String get linkedinUrn => _linkedinUrn ?? '';
  bool hasLinkedinUrn() => _linkedinUrn != null;

  // "first_degree_connections_size" field.
  int? _firstDegreeConnectionsSize;
  int get firstDegreeConnectionsSize => _firstDegreeConnectionsSize ?? 0;
  bool hasFirstDegreeConnectionsSize() => _firstDegreeConnectionsSize != null;

  // "followers" field.
  int? _followers;
  int get followers => _followers ?? 0;
  bool hasFollowers() => _followers != null;

  // "profilePictureLinks" field.
  List<String>? _profilePictureLinks;
  List<String> get profilePictureLinks => _profilePictureLinks ?? const [];
  bool hasProfilePictureLinks() => _profilePictureLinks != null;

  // "other_selected_leaders" field.
  List<DocumentReference>? _otherSelectedLeaders;
  List<DocumentReference> get otherSelectedLeaders =>
      _otherSelectedLeaders ?? const [];
  bool hasOtherSelectedLeaders() => _otherSelectedLeaders != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "broad_domains" field.
  List<String>? _broadDomains;
  List<String> get broadDomains => _broadDomains ?? const [];
  bool hasBroadDomains() => _broadDomains != null;

  // "linkedinAccess" field.
  String? _linkedinAccess;
  String get linkedinAccess => _linkedinAccess ?? '';
  bool hasLinkedinAccess() => _linkedinAccess != null;

  // "linkedinRefresh" field.
  String? _linkedinRefresh;
  String get linkedinRefresh => _linkedinRefresh ?? '';
  bool hasLinkedinRefresh() => _linkedinRefresh != null;

  // "linkedinAccessLifetime" field.
  int? _linkedinAccessLifetime;
  int get linkedinAccessLifetime => _linkedinAccessLifetime ?? 0;
  bool hasLinkedinAccessLifetime() => _linkedinAccessLifetime != null;

  // "linkedinRefreshLifetime" field.
  int? _linkedinRefreshLifetime;
  int get linkedinRefreshLifetime => _linkedinRefreshLifetime ?? 0;
  bool hasLinkedinRefreshLifetime() => _linkedinRefreshLifetime != null;

  // "thought_leadership_areas_mapping" field.
  List<ThoughtLeadershipAreasMappingStruct>? _thoughtLeadershipAreasMapping;
  List<ThoughtLeadershipAreasMappingStruct> get thoughtLeadershipAreasMapping =>
      _thoughtLeadershipAreasMapping ?? const [];
  bool hasThoughtLeadershipAreasMapping() =>
      _thoughtLeadershipAreasMapping != null;

  // "pushNotifications" field.
  NotificationPopupStruct? _pushNotifications;
  NotificationPopupStruct get pushNotifications =>
      _pushNotifications ?? NotificationPopupStruct();
  bool hasPushNotifications() => _pushNotifications != null;

  // "totalLikes" field.
  int? _totalLikes;
  int get totalLikes => _totalLikes ?? 0;
  bool hasTotalLikes() => _totalLikes != null;

  // "totalComments" field.
  int? _totalComments;
  int get totalComments => _totalComments ?? 0;
  bool hasTotalComments() => _totalComments != null;

  // "accessType" field.
  String? _accessType;
  String get accessType => _accessType ?? '';
  bool hasAccessType() => _accessType != null;

  // "linkedinForSpecialAccess" field.
  String? _linkedinForSpecialAccess;
  String get linkedinForSpecialAccess => _linkedinForSpecialAccess ?? '';
  bool hasLinkedinForSpecialAccess() => _linkedinForSpecialAccess != null;

  // "onboardingStatus" field.
  String? _onboardingStatus;
  String get onboardingStatus => _onboardingStatus ?? '';
  bool hasOnboardingStatus() => _onboardingStatus != null;

  // "active_companies" field.
  List<ActiveCompaniesStruct>? _activeCompanies;
  List<ActiveCompaniesStruct> get activeCompanies =>
      _activeCompanies ?? const [];
  bool hasActiveCompanies() => _activeCompanies != null;

  // "personaAuto" field.
  String? _personaAuto;
  String get personaAuto => _personaAuto ?? '';
  bool hasPersonaAuto() => _personaAuto != null;

  // "personaForContent" field.
  String? _personaForContent;
  String get personaForContent => _personaForContent ?? '';
  bool hasPersonaForContent() => _personaForContent != null;

  // "linkedin_scrapped" field.
  LinkedinScrappedStruct? _linkedinScrapped;
  LinkedinScrappedStruct get linkedinScrapped =>
      _linkedinScrapped ?? LinkedinScrappedStruct();
  bool hasLinkedinScrapped() => _linkedinScrapped != null;

  // "freeTrialPostsCreated" field.
  int? _freeTrialPostsCreated;
  int get freeTrialPostsCreated => _freeTrialPostsCreated ?? 0;
  bool hasFreeTrialPostsCreated() => _freeTrialPostsCreated != null;

  // "freeTrialCampignsCreated" field.
  int? _freeTrialCampignsCreated;
  int get freeTrialCampignsCreated => _freeTrialCampignsCreated ?? 0;
  bool hasFreeTrialCampignsCreated() => _freeTrialCampignsCreated != null;

  // "linkedinConnected" field.
  bool? _linkedinConnected;
  bool get linkedinConnected => _linkedinConnected ?? false;
  bool hasLinkedinConnected() => _linkedinConnected != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _linkedinDetails = LinkedinDetailsAuthStruct.maybeFromMap(
        snapshotData['linkedin_details']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _thoughtLeadershipAreas =
        getDataList(snapshotData['thought_leadership_areas']);
    _linkedinUrn = snapshotData['linkedin_urn'] as String?;
    _firstDegreeConnectionsSize =
        castToType<int>(snapshotData['first_degree_connections_size']);
    _followers = castToType<int>(snapshotData['followers']);
    _profilePictureLinks = getDataList(snapshotData['profilePictureLinks']);
    _otherSelectedLeaders = getDataList(snapshotData['other_selected_leaders']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _broadDomains = getDataList(snapshotData['broad_domains']);
    _linkedinAccess = snapshotData['linkedinAccess'] as String?;
    _linkedinRefresh = snapshotData['linkedinRefresh'] as String?;
    _linkedinAccessLifetime =
        castToType<int>(snapshotData['linkedinAccessLifetime']);
    _linkedinRefreshLifetime =
        castToType<int>(snapshotData['linkedinRefreshLifetime']);
    _thoughtLeadershipAreasMapping = getStructList(
      snapshotData['thought_leadership_areas_mapping'],
      ThoughtLeadershipAreasMappingStruct.fromMap,
    );
    _pushNotifications =
        NotificationPopupStruct.maybeFromMap(snapshotData['pushNotifications']);
    _totalLikes = castToType<int>(snapshotData['totalLikes']);
    _totalComments = castToType<int>(snapshotData['totalComments']);
    _accessType = snapshotData['accessType'] as String?;
    _linkedinForSpecialAccess =
        snapshotData['linkedinForSpecialAccess'] as String?;
    _onboardingStatus = snapshotData['onboardingStatus'] as String?;
    _activeCompanies = getStructList(
      snapshotData['active_companies'],
      ActiveCompaniesStruct.fromMap,
    );
    _personaAuto = snapshotData['personaAuto'] as String?;
    _personaForContent = snapshotData['personaForContent'] as String?;
    _linkedinScrapped =
        LinkedinScrappedStruct.maybeFromMap(snapshotData['linkedin_scrapped']);
    _freeTrialPostsCreated =
        castToType<int>(snapshotData['freeTrialPostsCreated']);
    _freeTrialCampignsCreated =
        castToType<int>(snapshotData['freeTrialCampignsCreated']);
    _linkedinConnected = snapshotData['linkedinConnected'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? photoUrl,
  String? uid,
  String? displayName,
  LinkedinDetailsAuthStruct? linkedinDetails,
  String? phoneNumber,
  String? linkedinUrn,
  int? firstDegreeConnectionsSize,
  int? followers,
  DateTime? createdTime,
  String? linkedinAccess,
  String? linkedinRefresh,
  int? linkedinAccessLifetime,
  int? linkedinRefreshLifetime,
  NotificationPopupStruct? pushNotifications,
  int? totalLikes,
  int? totalComments,
  String? accessType,
  String? linkedinForSpecialAccess,
  String? onboardingStatus,
  String? personaAuto,
  String? personaForContent,
  LinkedinScrappedStruct? linkedinScrapped,
  int? freeTrialPostsCreated,
  int? freeTrialCampignsCreated,
  bool? linkedinConnected,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'photo_url': photoUrl,
      'uid': uid,
      'display_name': displayName,
      'linkedin_details': LinkedinDetailsAuthStruct().toMap(),
      'phone_number': phoneNumber,
      'linkedin_urn': linkedinUrn,
      'first_degree_connections_size': firstDegreeConnectionsSize,
      'followers': followers,
      'created_time': createdTime,
      'linkedinAccess': linkedinAccess,
      'linkedinRefresh': linkedinRefresh,
      'linkedinAccessLifetime': linkedinAccessLifetime,
      'linkedinRefreshLifetime': linkedinRefreshLifetime,
      'pushNotifications': NotificationPopupStruct().toMap(),
      'totalLikes': totalLikes,
      'totalComments': totalComments,
      'accessType': accessType,
      'linkedinForSpecialAccess': linkedinForSpecialAccess,
      'onboardingStatus': onboardingStatus,
      'personaAuto': personaAuto,
      'personaForContent': personaForContent,
      'linkedin_scrapped': LinkedinScrappedStruct().toMap(),
      'freeTrialPostsCreated': freeTrialPostsCreated,
      'freeTrialCampignsCreated': freeTrialCampignsCreated,
      'linkedinConnected': linkedinConnected,
    }.withoutNulls,
  );

  // Handle nested data for "linkedin_details" field.
  addLinkedinDetailsAuthStructData(
      firestoreData, linkedinDetails, 'linkedin_details');

  // Handle nested data for "pushNotifications" field.
  addNotificationPopupStructData(
      firestoreData, pushNotifications, 'pushNotifications');

  // Handle nested data for "linkedin_scrapped" field.
  addLinkedinScrappedStructData(
      firestoreData, linkedinScrapped, 'linkedin_scrapped');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.displayName == e2?.displayName &&
        e1?.linkedinDetails == e2?.linkedinDetails &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(
            e1?.thoughtLeadershipAreas, e2?.thoughtLeadershipAreas) &&
        e1?.linkedinUrn == e2?.linkedinUrn &&
        e1?.firstDegreeConnectionsSize == e2?.firstDegreeConnectionsSize &&
        e1?.followers == e2?.followers &&
        listEquality.equals(e1?.profilePictureLinks, e2?.profilePictureLinks) &&
        listEquality.equals(
            e1?.otherSelectedLeaders, e2?.otherSelectedLeaders) &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.broadDomains, e2?.broadDomains) &&
        e1?.linkedinAccess == e2?.linkedinAccess &&
        e1?.linkedinRefresh == e2?.linkedinRefresh &&
        e1?.linkedinAccessLifetime == e2?.linkedinAccessLifetime &&
        e1?.linkedinRefreshLifetime == e2?.linkedinRefreshLifetime &&
        listEquality.equals(e1?.thoughtLeadershipAreasMapping,
            e2?.thoughtLeadershipAreasMapping) &&
        e1?.pushNotifications == e2?.pushNotifications &&
        e1?.totalLikes == e2?.totalLikes &&
        e1?.totalComments == e2?.totalComments &&
        e1?.accessType == e2?.accessType &&
        e1?.linkedinForSpecialAccess == e2?.linkedinForSpecialAccess &&
        e1?.onboardingStatus == e2?.onboardingStatus &&
        listEquality.equals(e1?.activeCompanies, e2?.activeCompanies) &&
        e1?.personaAuto == e2?.personaAuto &&
        e1?.personaForContent == e2?.personaForContent &&
        e1?.linkedinScrapped == e2?.linkedinScrapped &&
        e1?.freeTrialPostsCreated == e2?.freeTrialPostsCreated &&
        e1?.freeTrialCampignsCreated == e2?.freeTrialCampignsCreated &&
        e1?.linkedinConnected == e2?.linkedinConnected;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.photoUrl,
        e?.uid,
        e?.displayName,
        e?.linkedinDetails,
        e?.phoneNumber,
        e?.thoughtLeadershipAreas,
        e?.linkedinUrn,
        e?.firstDegreeConnectionsSize,
        e?.followers,
        e?.profilePictureLinks,
        e?.otherSelectedLeaders,
        e?.createdTime,
        e?.broadDomains,
        e?.linkedinAccess,
        e?.linkedinRefresh,
        e?.linkedinAccessLifetime,
        e?.linkedinRefreshLifetime,
        e?.thoughtLeadershipAreasMapping,
        e?.pushNotifications,
        e?.totalLikes,
        e?.totalComments,
        e?.accessType,
        e?.linkedinForSpecialAccess,
        e?.onboardingStatus,
        e?.activeCompanies,
        e?.personaAuto,
        e?.personaForContent,
        e?.linkedinScrapped,
        e?.freeTrialPostsCreated,
        e?.freeTrialCampignsCreated,
        e?.linkedinConnected
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
