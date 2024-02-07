import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_pass_widget.dart' show ForgotPassWidget;
import 'package:flutter/material.dart';

class ForgotPassModel extends FlutterFlowModel<ForgotPassWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for forgot_pass_email widget.
  FocusNode? forgotPassEmailFocusNode;
  TextEditingController? forgotPassEmailController;
  String? Function(BuildContext, String?)? forgotPassEmailControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    forgotPassEmailFocusNode?.dispose();
    forgotPassEmailController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
