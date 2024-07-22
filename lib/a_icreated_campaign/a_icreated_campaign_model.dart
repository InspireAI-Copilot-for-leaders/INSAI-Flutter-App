import '/backend/api_requests/api_calls.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'a_icreated_campaign_widget.dart' show AIcreatedCampaignWidget;
import 'package:flutter/material.dart';

class AIcreatedCampaignModel extends FlutterFlowModel<AIcreatedCampaignWidget> {
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

  bool addCompany = false;

  String? newCompanyName;

  String? typeOfContentUploaded;

  List<String> listOfUrls = [];
  void addToListOfUrls(String item) => listOfUrls.add(item);
  void removeFromListOfUrls(String item) => listOfUrls.remove(item);
  void removeAtIndexFromListOfUrls(int index) => listOfUrls.removeAt(index);
  void insertAtIndexInListOfUrls(int index, String item) =>
      listOfUrls.insert(index, item);
  void updateListOfUrlsAtIndex(int index, Function(String) updateFn) =>
      listOfUrls[index] = updateFn(listOfUrls[index]);

  List<String> plainText = [];
  void addToPlainText(String item) => plainText.add(item);
  void removeFromPlainText(String item) => plainText.remove(item);
  void removeAtIndexFromPlainText(int index) => plainText.removeAt(index);
  void insertAtIndexInPlainText(int index, String item) =>
      plainText.insert(index, item);
  void updatePlainTextAtIndex(int index, Function(String) updateFn) =>
      plainText[index] = updateFn(plainText[index]);

  int noOfUrls = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (Domain Thought leaderhip Campaign)] action in Button widget.
  ApiCallResponse? apiResult7vv1;
  // Stores action output result for [Backend Call - API (Current events Campaign)] action in Button widget.
  ApiCallResponse? apiResulttd41;
  // Stores action output result for [Backend Call - API (Company Thought leadership with data )] action in Button widget.
  ApiCallResponse? apiResults131;
  // Stores action output result for [Backend Call - API (Company Thought leaderhip Campaign)] action in Button widget.
  ApiCallResponse? apiResultm971;
  // Stores action output result for [Backend Call - API (Domain Thought leaderhip Campaign)] action in Button widget.
  ApiCallResponse? apiResult7vv;
  // Stores action output result for [Backend Call - API (Current events Campaign)] action in Button widget.
  ApiCallResponse? apiResulttd4;
  // Stores action output result for [Backend Call - API (Company Thought leadership with data )] action in Button widget.
  ApiCallResponse? apiResults13;
  // Stores action output result for [Backend Call - API (Company Thought leaderhip Campaign)] action in Button widget.
  ApiCallResponse? apiResultm97;
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
