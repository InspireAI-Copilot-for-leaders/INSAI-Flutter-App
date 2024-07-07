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

  bool loadingScreenVisible = false;

  bool addNewCompany = false;

  int noOfUrls = 1;

  String? newCompanyName;

  String? typeOfContentUploaded;

  List<String> urlsOfContent = [];
  void addToUrlsOfContent(String item) => urlsOfContent.add(item);
  void removeFromUrlsOfContent(String item) => urlsOfContent.remove(item);
  void removeAtIndexFromUrlsOfContent(int index) =>
      urlsOfContent.removeAt(index);
  void insertAtIndexInUrlsOfContent(int index, String item) =>
      urlsOfContent.insert(index, item);
  void updateUrlsOfContentAtIndex(int index, Function(String) updateFn) =>
      urlsOfContent[index] = updateFn(urlsOfContent[index]);

  List<String> textOfContent = [];
  void addToTextOfContent(String item) => textOfContent.add(item);
  void removeFromTextOfContent(String item) => textOfContent.remove(item);
  void removeAtIndexFromTextOfContent(int index) =>
      textOfContent.removeAt(index);
  void insertAtIndexInTextOfContent(int index, String item) =>
      textOfContent.insert(index, item);
  void updateTextOfContentAtIndex(int index, Function(String) updateFn) =>
      textOfContent[index] = updateFn(textOfContent[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
  // Stores action output result for [Backend Call - API (Company Thought leadership with data )] action in Button widget.
  ApiCallResponse? apiResult2cx;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CampaignsDetailsRecord? apiResult7vv;
  // Stores action output result for [Backend Call - API (Company Thought leaderhip Campaign)] action in Button widget.
  ApiCallResponse? apiResultm97;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CampaignsDetailsRecord? apiResult7v;
  // Model for LoadingScreen component.
  late LoadingScreenModel loadingScreenModel;
  // State field(s) for contentURL1 widget.
  FocusNode? contentURL1FocusNode1;
  TextEditingController? contentURL1TextController1;
  String? Function(BuildContext, String?)? contentURL1TextController1Validator;
  // State field(s) for DropDownType widget.
  String? dropDownTypeValue;
  FormFieldController<String>? dropDownTypeValueController;
  // State field(s) for contentURL1 widget.
  FocusNode? contentURL1FocusNode2;
  TextEditingController? contentURL1TextController2;
  String? Function(BuildContext, String?)? contentURL1TextController2Validator;
  // State field(s) for contentURL2 widget.
  FocusNode? contentURL2FocusNode;
  TextEditingController? contentURL2TextController;
  String? Function(BuildContext, String?)? contentURL2TextControllerValidator;
  // State field(s) for contentURL3 widget.
  FocusNode? contentURL3FocusNode;
  TextEditingController? contentURL3TextController;
  String? Function(BuildContext, String?)? contentURL3TextControllerValidator;
  // State field(s) for PlainText widget.
  FocusNode? plainTextFocusNode;
  TextEditingController? plainTextTextController;
  String? Function(BuildContext, String?)? plainTextTextControllerValidator;
  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  @override
  void initState(BuildContext context) {
    loadingScreenModel = createModel(context, () => LoadingScreenModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    loadingScreenModel.dispose();
    contentURL1FocusNode1?.dispose();
    contentURL1TextController1?.dispose();

    contentURL1FocusNode2?.dispose();
    contentURL1TextController2?.dispose();

    contentURL2FocusNode?.dispose();
    contentURL2TextController?.dispose();

    contentURL3FocusNode?.dispose();
    contentURL3TextController?.dispose();

    plainTextFocusNode?.dispose();
    plainTextTextController?.dispose();
  }
}
