import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
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

  String typeOfMediaUploaded = 'none';

  bool loadingScreenVisible = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  int? dropDownValue1;
  FormFieldController<int>? dropDownValueController1;
  // State field(s) for DropDown widget.
  int? dropDownValue2;
  FormFieldController<int>? dropDownValueController2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CampaignsDetailsRecord? apiResult7;
  // Stores action output result for [Backend Call - API (Domain Thought leaderhip Campaign)] action in Button widget.
  ApiCallResponse? apiResult7vv;
  // Model for LoadingScreen component.
  late LoadingScreenModel loadingScreenModel;

  @override
  void initState(BuildContext context) {
    loadingScreenModel = createModel(context, () => LoadingScreenModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    loadingScreenModel.dispose();
  }
}
