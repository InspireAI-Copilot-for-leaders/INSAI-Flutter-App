import '/flutter_flow/flutter_flow_util.dart';
import 'one_liner_expandable_widget.dart' show OneLinerExpandableWidget;
import 'package:flutter/material.dart';

class OneLinerExpandableModel
    extends FlutterFlowModel<OneLinerExpandableWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
