import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'phone_number_verify_widget.dart' show PhoneNumberVerifyWidget;
import 'package:flutter/material.dart';

class PhoneNumberVerifyModel extends FlutterFlowModel<PhoneNumberVerifyWidget> {
  ///  Local state fields for this page.

  String? otp;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Send Code)] action in phoneNumberVerify widget.
  ApiCallResponse? apiResultash;
  // State field(s) for phoneOTPcode widget.
  TextEditingController? phoneOTPcode;
  String? Function(BuildContext, String?)? phoneOTPcodeValidator;
  // Stores action output result for [Backend Call - API (Verify Code)] action in Button widget.
  ApiCallResponse? apiResult7uq;

  @override
  void initState(BuildContext context) {
    phoneOTPcode = TextEditingController();
  }

  @override
  void dispose() {
    phoneOTPcode?.dispose();
  }
}
