import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'brand_voice_widget.dart' show BrandVoiceWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
