import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_brand_voice_widget.dart' show EditBrandVoiceWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditBrandVoiceModel extends FlutterFlowModel<EditBrandVoiceWidget> {
  ///  Local state fields for this page.

  String contentUrlFields = '1';

  String? selectedVoice;

  String? typedVoice;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for contentURL2 widget.
  FocusNode? contentURL2FocusNode;
  TextEditingController? contentURL2Controller;
  String? Function(BuildContext, String?)? contentURL2ControllerValidator;
  // State field(s) for contentURL3 widget.
  FocusNode? contentURL3FocusNode;
  TextEditingController? contentURL3Controller;
  String? Function(BuildContext, String?)? contentURL3ControllerValidator;
  // State field(s) for contentURL1 widget.
  FocusNode? contentURL1FocusNode1;
  TextEditingController? contentURL1Controller1;
  String? Function(BuildContext, String?)? contentURL1Controller1Validator;
  // State field(s) for contentURL1 widget.
  FocusNode? contentURL1FocusNode2;
  TextEditingController? contentURL1Controller2;
  String? Function(BuildContext, String?)? contentURL1Controller2Validator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    contentURL2FocusNode?.dispose();
    contentURL2Controller?.dispose();

    contentURL3FocusNode?.dispose();
    contentURL3Controller?.dispose();

    contentURL1FocusNode1?.dispose();
    contentURL1Controller1?.dispose();

    contentURL1FocusNode2?.dispose();
    contentURL1Controller2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
