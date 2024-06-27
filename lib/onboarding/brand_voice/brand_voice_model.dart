import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'brand_voice_widget.dart' show BrandVoiceWidget;
import 'package:flutter/material.dart';

class BrandVoiceModel extends FlutterFlowModel<BrandVoiceWidget> {
  ///  Local state fields for this page.

  String contentUrlFields = '1';

  String? selectedVoice;

  String? typedVoice;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Linkedin Profile Picture)] action in brandVoice widget.
  ApiCallResponse? profilePicture;
  // Stores action output result for [Backend Call - API (First degree connections size)] action in brandVoice widget.
  ApiCallResponse? firstConnectionSize;
  // State field(s) for contentURL2 widget.
  FocusNode? contentURL2FocusNode;
  TextEditingController? contentURL2TextController;
  String? Function(BuildContext, String?)? contentURL2TextControllerValidator;
  // State field(s) for contentURL3 widget.
  FocusNode? contentURL3FocusNode;
  TextEditingController? contentURL3TextController;
  String? Function(BuildContext, String?)? contentURL3TextControllerValidator;
  // State field(s) for contentURL1 widget.
  FocusNode? contentURL1FocusNode1;
  TextEditingController? contentURL1TextController1;
  String? Function(BuildContext, String?)? contentURL1TextController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for contentURL1 widget.
  FocusNode? contentURL1FocusNode2;
  TextEditingController? contentURL1TextController2;
  String? Function(BuildContext, String?)? contentURL1TextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    contentURL2FocusNode?.dispose();
    contentURL2TextController?.dispose();

    contentURL3FocusNode?.dispose();
    contentURL3TextController?.dispose();

    contentURL1FocusNode1?.dispose();
    contentURL1TextController1?.dispose();

    textFieldFocusNode1?.dispose();
    textController4?.dispose();

    textFieldFocusNode2?.dispose();
    textController5?.dispose();

    contentURL1FocusNode2?.dispose();
    contentURL1TextController2?.dispose();
  }
}
