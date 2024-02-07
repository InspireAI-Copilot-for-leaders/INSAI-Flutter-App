import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_detailed_widget.dart' show PostDetailedWidget;
import 'package:flutter/material.dart';

class PostDetailedModel extends FlutterFlowModel<PostDetailedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (get post likes)] action in Button widget.
  ApiCallResponse? likes;
  // Stores action output result for [Backend Call - API (get post comments)] action in Button widget.
  ApiCallResponse? comments;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
