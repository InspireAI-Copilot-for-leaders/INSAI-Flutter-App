import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'brand_voice_widget.dart' show BrandVoiceWidget;
import 'package:flutter/material.dart';

class BrandVoiceModel extends FlutterFlowModel<BrandVoiceWidget> {
  ///  Local state fields for this page.

  String contentUrlFields = '1';

  String? selectedVoice;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Linkedin Profile Picture)] action in brandVoice widget.
  ApiCallResponse? profilePicture;
  // Stores action output result for [Backend Call - API (First degree connections size)] action in brandVoice widget.
  ApiCallResponse? firstConnectionSize;
  // Stores action output result for [Backend Call - API (InspireAI Keyword and articles)] action in brandVoice widget.
  ApiCallResponse? apiResultl4b;
  // State field(s) for contentURL1 widget.
  FocusNode? contentURL1FocusNode;
  TextEditingController? contentURL1Controller;
  String? Function(BuildContext, String?)? contentURL1ControllerValidator;
  // State field(s) for contentURL2 widget.
  FocusNode? contentURL2FocusNode;
  TextEditingController? contentURL2Controller;
  String? Function(BuildContext, String?)? contentURL2ControllerValidator;
  // State field(s) for contentURL3 widget.
  FocusNode? contentURL3FocusNode;
  TextEditingController? contentURL3Controller;
  String? Function(BuildContext, String?)? contentURL3ControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    contentURL1FocusNode?.dispose();
    contentURL1Controller?.dispose();

    contentURL2FocusNode?.dispose();
    contentURL2Controller?.dispose();

    contentURL3FocusNode?.dispose();
    contentURL3Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
