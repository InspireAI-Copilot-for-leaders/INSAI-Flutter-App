import '/flutter_flow/flutter_flow_util.dart';
import 'upload_doc_widget.dart' show UploadDocWidget;
import 'package:flutter/material.dart';

class UploadDocModel extends FlutterFlowModel<UploadDocWidget> {
  ///  Local state fields for this component.

  bool fileUploaded = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for question widget.
  FocusNode? questionFocusNode;
  TextEditingController? questionTextController;
  String? Function(BuildContext, String?)? questionTextControllerValidator;
  String? _questionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {
    questionTextControllerValidator = _questionTextControllerValidator;
  }

  @override
  void dispose() {
    questionFocusNode?.dispose();
    questionTextController?.dispose();
  }
}
