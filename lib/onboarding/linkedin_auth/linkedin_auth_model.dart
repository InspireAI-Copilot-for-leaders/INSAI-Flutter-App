import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/profile_loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'linkedin_auth_widget.dart' show LinkedinAuthWidget;
import 'package:flutter/material.dart';

class LinkedinAuthModel extends FlutterFlowModel<LinkedinAuthWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (LinkedinTokens)] action in linkedinAuth widget.
  ApiCallResponse? linkedintokens;
  // Stores action output result for [Backend Call - API (Linkedin Profile Details)] action in linkedinAuth widget.
  ApiCallResponse? lIprofileDetails;
  // Stores action output result for [Backend Call - API (Expertise of Person)] action in linkedinAuth widget.
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
