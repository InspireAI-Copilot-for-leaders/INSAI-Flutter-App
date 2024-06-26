import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'camapign_details_widget.dart' show CamapignDetailsWidget;
import 'package:flutter/material.dart';

class CamapignDetailsModel extends FlutterFlowModel<CamapignDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ScheduledPostsRecord? scheduleddoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
