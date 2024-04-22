import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'expertise_area_edit_widget.dart' show ExpertiseAreaEditWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExpertiseAreaEditModel extends FlutterFlowModel<ExpertiseAreaEditWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for contentURL1 widget.
  FocusNode? contentURL1FocusNode;
  TextEditingController? contentURL1TextController;
  String? Function(BuildContext, String?)? contentURL1TextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ToBeReviewedRecord? toBeReviewedDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    contentURL1FocusNode?.dispose();
    contentURL1TextController?.dispose();
  }
}
