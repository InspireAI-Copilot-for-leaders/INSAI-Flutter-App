import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'phone_number_verify_widget.dart' show PhoneNumberVerifyWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhoneNumberVerifyModel extends FlutterFlowModel<PhoneNumberVerifyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for phoneOTPcode widget.
  TextEditingController? phoneOTPcode;
  String? Function(BuildContext, String?)? phoneOTPcodeValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    phoneOTPcode = TextEditingController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    phoneOTPcode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
