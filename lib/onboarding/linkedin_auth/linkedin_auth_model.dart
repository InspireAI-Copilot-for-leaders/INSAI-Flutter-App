import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/empty_state_widget.dart';
import '/components/profile_loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'linkedin_auth_widget.dart' show LinkedinAuthWidget;
import 'package:flutter/material.dart';

class LinkedinAuthModel extends FlutterFlowModel<LinkedinAuthWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  List<ThoughtLeadershipAreasMappingStruct> leadershipAreasMapping = [];
  void addToLeadershipAreasMapping(ThoughtLeadershipAreasMappingStruct item) =>
      leadershipAreasMapping.add(item);
  void removeFromLeadershipAreasMapping(
          ThoughtLeadershipAreasMappingStruct item) =>
      leadershipAreasMapping.remove(item);
  void removeAtIndexFromLeadershipAreasMapping(int index) =>
      leadershipAreasMapping.removeAt(index);
  void insertAtIndexInLeadershipAreasMapping(
          int index, ThoughtLeadershipAreasMappingStruct item) =>
      leadershipAreasMapping.insert(index, item);
  void updateLeadershipAreasMappingAtIndex(
          int index, Function(ThoughtLeadershipAreasMappingStruct) updateFn) =>
      leadershipAreasMapping[index] = updateFn(leadershipAreasMapping[index]);

  List<String> addExpertiseAreaList = [];
  void addToAddExpertiseAreaList(String item) => addExpertiseAreaList.add(item);
  void removeFromAddExpertiseAreaList(String item) =>
      addExpertiseAreaList.remove(item);
  void removeAtIndexFromAddExpertiseAreaList(int index) =>
      addExpertiseAreaList.removeAt(index);
  void insertAtIndexInAddExpertiseAreaList(int index, String item) =>
      addExpertiseAreaList.insert(index, item);
  void updateAddExpertiseAreaListAtIndex(
          int index, Function(String) updateFn) =>
      addExpertiseAreaList[index] = updateFn(addExpertiseAreaList[index]);

  bool addNewArea = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (LinkedinTokens)] action in linkedinAuth widget.
  ApiCallResponse? linkedintokens;
  // Stores action output result for [Backend Call - API (Linkedin Profile Details)] action in linkedinAuth widget.
  ApiCallResponse? lIprofileDetails;
  // Stores action output result for [Firestore Query - Query a collection] action in linkedinAuth widget.
  PreDefinedUsersRecord? wannabeUser;
  // Stores action output result for [Backend Call - API (Expertise of Person)] action in linkedinAuth widget.
  ApiCallResponse? getExpertiseWorflow;
  // State field(s) for contentURL1 widget.
  FocusNode? contentURL1FocusNode;
  TextEditingController? contentURL1TextController;
  String? Function(BuildContext, String?)? contentURL1TextControllerValidator;
  // Algolia Search Results from action on contentURL1
  List<ExpertiseAreasCollectionRecord>? algoliaSearchResults = [];
  // Model for emptyState component.
  late EmptyStateModel emptyStateModel;
  // Model for profileLoadingScreen component.
  late ProfileLoadingScreenModel profileLoadingScreenModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    emptyStateModel = createModel(context, () => EmptyStateModel());
    profileLoadingScreenModel =
        createModel(context, () => ProfileLoadingScreenModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    contentURL1FocusNode?.dispose();
    contentURL1TextController?.dispose();

    emptyStateModel.dispose();
    profileLoadingScreenModel.dispose();
    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
