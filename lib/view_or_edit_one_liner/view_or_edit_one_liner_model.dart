import '/flutter_flow/flutter_flow_util.dart';
import 'view_or_edit_one_liner_widget.dart' show ViewOrEditOneLinerWidget;
import 'package:flutter/material.dart';

class ViewOrEditOneLinerModel
    extends FlutterFlowModel<ViewOrEditOneLinerWidget> {
  ///  Local state fields for this page.

  int? whichIndexExpanded;

  String oneLinerText = 'null';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
