import '/flutter_flow/flutter_flow_util.dart';
import 'phone_number_input_widget.dart' show PhoneNumberInputWidget;
import 'package:flutter/material.dart';

class PhoneNumberInputModel extends FlutterFlowModel<PhoneNumberInputWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
