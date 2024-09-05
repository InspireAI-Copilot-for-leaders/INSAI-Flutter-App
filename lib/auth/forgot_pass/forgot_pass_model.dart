import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_pass_widget.dart' show ForgotPassWidget;
import 'package:flutter/material.dart';

class ForgotPassModel extends FlutterFlowModel<ForgotPassWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for forgot_pass_email widget.
  FocusNode? forgotPassEmailFocusNode;
  TextEditingController? forgotPassEmailTextController;
  String? Function(BuildContext, String?)?
      forgotPassEmailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    forgotPassEmailFocusNode?.dispose();
    forgotPassEmailTextController?.dispose();
  }
}
