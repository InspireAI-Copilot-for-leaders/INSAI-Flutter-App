import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/profile_loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/backend/schema/structs/index.dart';
import 'linkedin_auth_widget.dart' show LinkedinAuthWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
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
  // Stores action output result for [Backend Call - API (LinkedinTokens)] action in linkedinAuth widget.
  ApiCallResponse? linkedintokens;
  // Stores action output result for [Backend Call - API (Linkedin Profile Details)] action in linkedinAuth widget.
  ApiCallResponse? lIprofileDetails;
  // Stores action output result for [Backend Call - API (Expertise of Person Proxycurl)] action in linkedinAuth widget.
  ApiCallResponse? getExpertiseWorflow;
  // State field(s) for contentURL1 widget.
  FocusNode? contentURL1FocusNode;
  TextEditingController? contentURL1TextController;
  String? Function(BuildContext, String?)? contentURL1TextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ToBeReviewedRecord? toBeReviewedDoc;
  // Model for profileLoadingScreen component.
  late ProfileLoadingScreenModel profileLoadingScreenModel;

  @override
  void initState(BuildContext context) {
    profileLoadingScreenModel =
        createModel(context, () => ProfileLoadingScreenModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    contentURL1FocusNode?.dispose();
    contentURL1TextController?.dispose();

    profileLoadingScreenModel.dispose();
  }
}
