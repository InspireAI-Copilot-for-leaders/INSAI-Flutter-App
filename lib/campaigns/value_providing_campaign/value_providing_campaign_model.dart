import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/empty_state_widget.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'value_providing_campaign_widget.dart' show ValueProvidingCampaignWidget;
import 'package:flutter/material.dart';

class ValueProvidingCampaignModel
    extends FlutterFlowModel<ValueProvidingCampaignWidget> {
  ///  Local state fields for this page.

  List<String> expertiseForContent = [];
  void addToExpertiseForContent(String item) => expertiseForContent.add(item);
  void removeFromExpertiseForContent(String item) =>
      expertiseForContent.remove(item);
  void removeAtIndexFromExpertiseForContent(int index) =>
      expertiseForContent.removeAt(index);
  void insertAtIndexInExpertiseForContent(int index, String item) =>
      expertiseForContent.insert(index, item);
  void updateExpertiseForContentAtIndex(int index, Function(String) updateFn) =>
      expertiseForContent[index] = updateFn(expertiseForContent[index]);

  bool emptySearch = false;

  List<String> selectedAreas = [];
  void addToSelectedAreas(String item) => selectedAreas.add(item);
  void removeFromSelectedAreas(String item) => selectedAreas.remove(item);
  void removeAtIndexFromSelectedAreas(int index) =>
      selectedAreas.removeAt(index);
  void insertAtIndexInSelectedAreas(int index, String item) =>
      selectedAreas.insert(index, item);
  void updateSelectedAreasAtIndex(int index, Function(String) updateFn) =>
      selectedAreas[index] = updateFn(selectedAreas[index]);

  bool isLoading = false;

  bool addExpertiseArea = false;

  int indexToRemoveAt = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  int? dropDownValue1;
  FormFieldController<int>? dropDownValueController1;
  // State field(s) for DropDown widget.
  int? dropDownValue2;
  FormFieldController<int>? dropDownValueController2;
  // Stores action output result for [Backend Call - API (Domain Thought leaderhip Campaign)] action in Button widget.
  ApiCallResponse? apiResult7vv1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CampaignsDetailsRecord? apiResult71;
  // Stores action output result for [Backend Call - API (Domain Thought leaderhip Campaign)] action in Button widget.
  ApiCallResponse? apiResult7vv;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CampaignsDetailsRecord? apiResult7;
  // Model for LoadingScreen component.
  late LoadingScreenModel loadingScreenModel;
  // State field(s) for contentURL1 widget.
  FocusNode? contentURL1FocusNode;
  TextEditingController? contentURL1TextController;
  String? Function(BuildContext, String?)? contentURL1TextControllerValidator;
  // Algolia Search Results from action on contentURL1
  List<ExpertiseAreasCollectionRecord>? algoliaSearchResults = [];
  // Model for emptyState component.
  late EmptyStateModel emptyStateModel;

  @override
  void initState(BuildContext context) {
    loadingScreenModel = createModel(context, () => LoadingScreenModel());
    emptyStateModel = createModel(context, () => EmptyStateModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    loadingScreenModel.dispose();
    contentURL1FocusNode?.dispose();
    contentURL1TextController?.dispose();

    emptyStateModel.dispose();
  }
}
