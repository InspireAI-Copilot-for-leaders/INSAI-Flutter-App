import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'view_or_edit_post_widget.dart' show ViewOrEditPostWidget;
import 'package:flutter/material.dart';

class ViewOrEditPostModel extends FlutterFlowModel<ViewOrEditPostWidget> {
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (postOnlyText)] action in onlyTextButton widget.
  ApiCallResponse? linkedinPost;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // Stores action output result for [Backend Call - API (getDocUploadUrlFromLinkedin)] action in docButton widget.
  ApiCallResponse? liDocURL;
  // Stores action output result for [Backend Call - API (uploadDocToLinkedin)] action in docButton widget.
  ApiCallResponse? docUploaded;
  // Stores action output result for [Backend Call - API (postTextWithMedia)] action in docButton widget.
  ApiCallResponse? apiResult9vv;
  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  // Stores action output result for [Backend Call - API (getImageUploadUrlFromLinkedin)] action in imageButton widget.
  ApiCallResponse? imageUrl;
  // Stores action output result for [Backend Call - API (uploadImageToLinkedin)] action in imageButton widget.
  ApiCallResponse? imageUploaded;
  // Stores action output result for [Backend Call - Create Document] action in imageButton widget.
  PostedOnLinkedinRecord? createdDocRefrence;
  // Stores action output result for [Backend Call - API (postTextWithMultipleImages)] action in imageButton widget.
  ApiCallResponse? multiImgPosted;
  // Stores action output result for [Backend Call - API (postTextWithMedia)] action in imageButton widget.
  ApiCallResponse? singleImgPosted;
  // Stores action output result for [Backend Call - API (postTextWithPoll)] action in pollButton widget.
  ApiCallResponse? linkedinPollPost;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Stores action output result for [Backend Call - API (getDocUploadUrlFromLinkedin)] action in scheduleDoc widget.
  ApiCallResponse? liDocURLSche;
  // Stores action output result for [Backend Call - API (uploadDocToLinkedin)] action in scheduleDoc widget.
  ApiCallResponse? docUploadedSche;
  bool isDataUploading4 = false;
  List<FFUploadedFile> uploadedLocalFiles4 = [];
  List<String> uploadedFileUrls4 = [];

  // Stores action output result for [Backend Call - API (getImageUploadUrlFromLinkedin)] action in scheduleImage widget.
  ApiCallResponse? imageUrlSch;
  // Stores action output result for [Backend Call - API (uploadImageToLinkedin)] action in scheduleImage widget.
  ApiCallResponse? imageUploadedSch;
  // Stores action output result for [Backend Call - Create Document] action in scheduleImage widget.
  ScheduledPostsRecord? createdDocRefrenceSch;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading5 = false;
  List<FFUploadedFile> uploadedLocalFiles5 = [];

  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
