import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'company_campaign_widget.dart' show CompanyCampaignWidget;
import 'package:flutter/material.dart';

class CompanyCampaignModel extends FlutterFlowModel<CompanyCampaignWidget> {
  ///  Local state fields for this page.

  int selectedCompanyIndex = 0;

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
  CampaignsDetailsRecord? apiResult7vv;
  // Stores action output result for [Backend Call - API (Company Thought leaderhip Campaign)] action in Button widget.
  ApiCallResponse? apiResultm97;
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
