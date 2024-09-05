import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'view_or_edit_campaign_post_widget.dart'
    show ViewOrEditCampaignPostWidget;
import 'package:flutter/material.dart';

class ViewOrEditCampaignPostModel
    extends FlutterFlowModel<ViewOrEditCampaignPostWidget> {
  ///  Local state fields for this page.

  String typeOfMediaUploaded = 'onlyText';

  int numberOfImagesUploaded = 0;

  List<FFUploadedFile> uploadedMedia = [];
  void addToUploadedMedia(FFUploadedFile item) => uploadedMedia.add(item);
  void removeFromUploadedMedia(FFUploadedFile item) =>
      uploadedMedia.remove(item);
  void removeAtIndexFromUploadedMedia(int index) =>
      uploadedMedia.removeAt(index);
  void insertAtIndexInUploadedMedia(int index, FFUploadedFile item) =>
      uploadedMedia.insert(index, item);
  void updateUploadedMediaAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      uploadedMedia[index] = updateFn(uploadedMedia[index]);

  FFUploadedFile? uploadedDoc;

  String? pollQuestion;

  String? pollOption1;

  String? pollOption2;

  String? pollOption3;

  String? pollOption4;

  String? pollDuration;

  String? uploadedDocTitle;

  int noOfImagesUploadedToFirebase = 0;

  List<String> pollOptionsList = [];
  void addToPollOptionsList(String item) => pollOptionsList.add(item);
  void removeFromPollOptionsList(String item) => pollOptionsList.remove(item);
  void removeAtIndexFromPollOptionsList(int index) =>
      pollOptionsList.removeAt(index);
  void insertAtIndexInPollOptionsList(int index, String item) =>
      pollOptionsList.insert(index, item);
  void updatePollOptionsListAtIndex(int index, Function(String) updateFn) =>
      pollOptionsList[index] = updateFn(pollOptionsList[index]);

  DateTime? scheduledTime;

  DateTime? scheduledDate;

  bool isScheduled = false;

  bool datePickerVisbile = false;

  DocumentReference? scheduledDocument;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in onlyTextSchedule widget.
  ScheduledPostsRecord? scheduledDocOnlyText;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Backend Call - API (getDocUploadUrlFromLinkedin)] action in docSchedule widget.
  ApiCallResponse? liDocURLScheCopy;
  // Stores action output result for [Backend Call - API (uploadDocToLinkedin)] action in docSchedule widget.
  ApiCallResponse? docUploadedScheCopy;
  // Stores action output result for [Backend Call - Create Document] action in docSchedule widget.
  ScheduledPostsRecord? scheduledDocDoc;
  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  // Stores action output result for [Backend Call - API (getImageUploadUrlFromLinkedin)] action in ImageSchedule widget.
  ApiCallResponse? imageUrlSchCamp;
  // Stores action output result for [Backend Call - API (uploadImageToLinkedin)] action in ImageSchedule widget.
  ApiCallResponse? imageUploadedSchCamp;
  // Stores action output result for [Backend Call - Create Document] action in ImageSchedule widget.
  ScheduledPostsRecord? scheduledDocImage;
  // Stores action output result for [Backend Call - Create Document] action in pollSchedule widget.
  ScheduledPostsRecord? scheduledDocOnlyPoll;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for shortPost widget.
  FocusNode? shortPostFocusNode;
  TextEditingController? shortPostTextController;
  String? Function(BuildContext, String?)? shortPostTextControllerValidator;
  // State field(s) for MediumPost widget.
  FocusNode? mediumPostFocusNode;
  TextEditingController? mediumPostTextController;
  String? Function(BuildContext, String?)? mediumPostTextControllerValidator;
  // State field(s) for longPost widget.
  FocusNode? longPostFocusNode;
  TextEditingController? longPostTextController;
  String? Function(BuildContext, String?)? longPostTextControllerValidator;
  bool isDataUploading3 = false;
  List<FFUploadedFile> uploadedLocalFiles3 = [];

  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    shortPostFocusNode?.dispose();
    shortPostTextController?.dispose();

    mediumPostFocusNode?.dispose();
    mediumPostTextController?.dispose();

    longPostFocusNode?.dispose();
    longPostTextController?.dispose();
  }
}
