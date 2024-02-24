import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/profile_loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'linkedin_auth_widget.dart' show LinkedinAuthWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LinkedinAuthModel extends FlutterFlowModel<LinkedinAuthWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for contentURL1 widget.
  FocusNode? contentURL1FocusNode;
  TextEditingController? contentURL1Controller;
  String? Function(BuildContext, String?)? contentURL1ControllerValidator;
  // Model for profileLoadingScreen component.
  late ProfileLoadingScreenModel profileLoadingScreenModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    profileLoadingScreenModel =
        createModel(context, () => ProfileLoadingScreenModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    contentURL1FocusNode?.dispose();
    contentURL1Controller?.dispose();

    profileLoadingScreenModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
