import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'auth_signup_or_login_widget.dart' show AuthSignupOrLoginWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthSignupOrLoginModel extends FlutterFlowModel<AuthSignupOrLoginWidget> {
  ///  Local state fields for this page.

  String authType = 'signup_email';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for login_user_email widget.
  FocusNode? loginUserEmailFocusNode;
  TextEditingController? loginUserEmailController;
  String? Function(BuildContext, String?)? loginUserEmailControllerValidator;
  String? _loginUserEmailControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for login_user_pass widget.
  FocusNode? loginUserPassFocusNode;
  TextEditingController? loginUserPassController;
  late bool loginUserPassVisibility;
  String? Function(BuildContext, String?)? loginUserPassControllerValidator;
  String? _loginUserPassControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 16) {
      return 'Maximum 16 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for signup_user_email widget.
  FocusNode? signupUserEmailFocusNode;
  TextEditingController? signupUserEmailController;
  String? Function(BuildContext, String?)? signupUserEmailControllerValidator;
  String? _signupUserEmailControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for signup_user_pass widget.
  FocusNode? signupUserPassFocusNode;
  TextEditingController? signupUserPassController;
  late bool signupUserPassVisibility;
  String? Function(BuildContext, String?)? signupUserPassControllerValidator;
  String? _signupUserPassControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 16) {
      return 'Maximum 16 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    loginUserEmailControllerValidator = _loginUserEmailControllerValidator;
    loginUserPassVisibility = false;
    loginUserPassControllerValidator = _loginUserPassControllerValidator;
    signupUserEmailControllerValidator = _signupUserEmailControllerValidator;
    signupUserPassVisibility = false;
    signupUserPassControllerValidator = _signupUserPassControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    loginUserEmailFocusNode?.dispose();
    loginUserEmailController?.dispose();

    loginUserPassFocusNode?.dispose();
    loginUserPassController?.dispose();

    signupUserEmailFocusNode?.dispose();
    signupUserEmailController?.dispose();

    signupUserPassFocusNode?.dispose();
    signupUserPassController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
