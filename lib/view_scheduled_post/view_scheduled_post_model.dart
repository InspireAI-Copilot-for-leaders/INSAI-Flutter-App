import '/flutter_flow/flutter_flow_util.dart';
import 'view_scheduled_post_widget.dart' show ViewScheduledPostWidget;
import 'package:flutter/material.dart';

class ViewScheduledPostModel extends FlutterFlowModel<ViewScheduledPostWidget> {
  ///  Local state fields for this page.

  String typeOfMediaUploaded = 'onlyText';

  int numberOfImagesUploaded = 0;

  List<String> uploadedMedia = [];
  void addToUploadedMedia(String item) => uploadedMedia.add(item);
  void removeFromUploadedMedia(String item) => uploadedMedia.remove(item);
  void removeAtIndexFromUploadedMedia(int index) =>
      uploadedMedia.removeAt(index);
  void insertAtIndexInUploadedMedia(int index, String item) =>
      uploadedMedia.insert(index, item);
  void updateUploadedMediaAtIndex(int index, Function(String) updateFn) =>
      uploadedMedia[index] = updateFn(uploadedMedia[index]);

  String? uploadedDoc;

  String? pollQuestion;

  String? pollOption1;

  String? pollOption2;

  String? pollOption3;

  String? pollOption4;

  String? pollDuration;

  String? uploadedDocTitle;

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

  bool datePickerVisbile = false;

  bool reschedule = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  DateTime? datePicked1;
  DateTime? datePicked2;

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
