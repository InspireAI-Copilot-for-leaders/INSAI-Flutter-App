import '/components/create_poll_widget.dart';
import '/components/upload_doc_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import 'post_content_options_widget.dart' show PostContentOptionsWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
