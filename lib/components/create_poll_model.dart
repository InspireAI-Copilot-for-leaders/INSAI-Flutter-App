import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_poll_widget.dart' show CreatePollWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreatePollModel extends FlutterFlowModel<CreatePollWidget> {
  ///  Local state fields for this component.

  int optionFieldsNumber = 2;

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

  // State field(s) for option1 widget.
  FocusNode? option1FocusNode;
  TextEditingController? option1TextController;
  String? Function(BuildContext, String?)? option1TextControllerValidator;
  String? _option1TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for option2 widget.
  FocusNode? option2FocusNode;
  TextEditingController? option2TextController;
  String? Function(BuildContext, String?)? option2TextControllerValidator;
  String? _option2TextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for option3 widget.
  FocusNode? option3FocusNode;
  TextEditingController? option3TextController;
  String? Function(BuildContext, String?)? option3TextControllerValidator;
  // State field(s) for option4 widget.
  FocusNode? option4FocusNode;
  TextEditingController? option4TextController;
  String? Function(BuildContext, String?)? option4TextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    questionTextControllerValidator = _questionTextControllerValidator;
    option1TextControllerValidator = _option1TextControllerValidator;
    option2TextControllerValidator = _option2TextControllerValidator;
  }

  @override
  void dispose() {
    questionFocusNode?.dispose();
    questionTextController?.dispose();

    option1FocusNode?.dispose();
    option1TextController?.dispose();

    option2FocusNode?.dispose();
    option2TextController?.dispose();

    option3FocusNode?.dispose();
    option3TextController?.dispose();

    option4FocusNode?.dispose();
    option4TextController?.dispose();
  }
}
