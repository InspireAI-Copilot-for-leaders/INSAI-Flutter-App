import '/flutter_flow/flutter_flow_util.dart';
import 'edit_brand_voice_widget.dart' show EditBrandVoiceWidget;
import 'package:flutter/material.dart';

class EditBrandVoiceModel extends FlutterFlowModel<EditBrandVoiceWidget> {
  ///  Local state fields for this page.

  String contentUrlFields = '1';

  String? selectedVoice;

  String? typedVoice;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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

    contentURL1FocusNode2?.dispose();
    contentURL1TextController2?.dispose();
  }
}
