import '/backend/api_requests/api_calls.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_with_inspire_a_i_widget.dart' show CreateWithInspireAIWidget;
import 'package:flutter/material.dart';

class CreateWithInspireAIModel
    extends FlutterFlowModel<CreateWithInspireAIWidget> {
  ///  Local state fields for this page.

  String createWhat = 'post';

  String typeOfMediaUploaded = 'none';

  bool loadingScreenVisible = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // Stores action output result for [Backend Call - API (InspireAI Content from Topics)] action in Button widget.
  ApiCallResponse? contentfromtopic;
  // Stores action output result for [Backend Call - API (InspireAI Content from Contxt)] action in Button widget.
  ApiCallResponse? contentfromcontext;
  // Model for LoadingScreen component.
  late LoadingScreenModel loadingScreenModel;

  @override
  void initState(BuildContext context) {
    loadingScreenModel = createModel(context, () => LoadingScreenModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    loadingScreenModel.dispose();
  }
}
