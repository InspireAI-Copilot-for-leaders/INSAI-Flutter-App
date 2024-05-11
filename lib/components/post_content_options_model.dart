import '/flutter_flow/flutter_flow_util.dart';
import 'post_content_options_widget.dart' show PostContentOptionsWidget;
import 'package:flutter/material.dart';

class PostContentOptionsModel
    extends FlutterFlowModel<PostContentOptionsWidget> {
  ///  Local state fields for this component.

  String? pollQuestion;

  String? pollOption1;

  String? pollOption2;

  String? pollDuration;

  String? pollOption3;

  String? pollOption4;

  FFUploadedFile? uploadedDoc;

  String? docTitle;

  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
