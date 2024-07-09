import '/flutter_flow/flutter_flow_util.dart';
import 'access_wall_widget.dart' show AccessWallWidget;
import 'package:flutter/material.dart';

class AccessWallModel extends FlutterFlowModel<AccessWallWidget> {
  ///  Local state fields for this page.

  bool paymentLoading = false;

  bool isYearly = true;

  bool specialAccessClicked = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorWebsiteRegex).hasMatch(val)) {
      return 'Please enter a valid url';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
