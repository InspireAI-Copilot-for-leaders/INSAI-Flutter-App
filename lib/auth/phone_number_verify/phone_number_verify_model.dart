import '/flutter_flow/flutter_flow_util.dart';
import 'phone_number_verify_widget.dart' show PhoneNumberVerifyWidget;
import 'package:flutter/material.dart';

class PhoneNumberVerifyModel extends FlutterFlowModel<PhoneNumberVerifyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for phoneOTPcode widget.
  TextEditingController? phoneOTPcode;
  String? Function(BuildContext, String?)? phoneOTPcodeValidator;

  @override
  void initState(BuildContext context) {
    phoneOTPcode = TextEditingController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    phoneOTPcode?.dispose();
  }
}
