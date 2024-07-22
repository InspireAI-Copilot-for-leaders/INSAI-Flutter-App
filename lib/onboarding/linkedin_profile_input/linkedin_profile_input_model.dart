import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'linkedin_profile_input_widget.dart' show LinkedinProfileInputWidget;
import 'package:flutter/material.dart';

class LinkedinProfileInputModel
    extends FlutterFlowModel<LinkedinProfileInputWidget> {
  ///  Local state fields for this page.

  bool profileGetting = false;

  bool profileGot = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for forgot_pass_email widget.
  FocusNode? forgotPassEmailFocusNode;
  TextEditingController? forgotPassEmailTextController;
  String? Function(BuildContext, String?)?
      forgotPassEmailTextControllerValidator;
  String? _forgotPassEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(
            '^(https?:\\/\\/)?(www\\.)?linkedin\\.com\\/[a-zA-Z0-9-]+\\/?\$')
        .hasMatch(val)) {
      return 'Please enter a valid linkedin url';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (Expertise of Person)] action in Button widget.
  ApiCallResponse? apiResulthif;

  @override
  void initState(BuildContext context) {
    forgotPassEmailTextControllerValidator =
        _forgotPassEmailTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    forgotPassEmailFocusNode?.dispose();
    forgotPassEmailTextController?.dispose();
  }
}
