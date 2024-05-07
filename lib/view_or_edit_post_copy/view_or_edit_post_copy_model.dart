import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/post_content_options_widget.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'view_or_edit_post_copy_widget.dart' show ViewOrEditPostCopyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewOrEditPostCopyModel
    extends FlutterFlowModel<ViewOrEditPostCopyWidget> {
  ///  Local state fields for this page.

  String? typeOfMediaUploaded;

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
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  bool isDataUploading3 = false;
  List<FFUploadedFile> uploadedLocalFiles3 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
