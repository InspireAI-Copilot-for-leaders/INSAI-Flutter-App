import '/flutter_flow/flutter_flow_util.dart';
import 'auth_signup_or_login_widget.dart' show AuthSignupOrLoginWidget;
import 'package:flutter/material.dart';

class AuthSignupOrLoginModel extends FlutterFlowModel<AuthSignupOrLoginWidget> {
  ///  Local state fields for this page.

  String authType = 'signup_email';

  bool loginBtnVisible = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for login_user_email widget.
  FocusNode? loginUserEmailFocusNode;
  TextEditingController? loginUserEmailTextController;
  String? Function(BuildContext, String?)?
      loginUserEmailTextControllerValidator;
  String? _loginUserEmailTextControllerValidator(
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
  TextEditingController? loginUserPassTextController;
  late bool loginUserPassVisibility;
  String? Function(BuildContext, String?)? loginUserPassTextControllerValidator;
  String? _loginUserPassTextControllerValidator(
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

  // State field(s) for signup_user_email widget.
  FocusNode? signupUserEmailFocusNode;
  TextEditingController? signupUserEmailTextController;
  String? Function(BuildContext, String?)?
      signupUserEmailTextControllerValidator;
  String? _signupUserEmailTextControllerValidator(
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
  TextEditingController? signupUserPassTextController;
  late bool signupUserPassVisibility;
  String? Function(BuildContext, String?)?
      signupUserPassTextControllerValidator;
  String? _signupUserPassTextControllerValidator(
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

  @override
  void initState(BuildContext context) {
    loginUserEmailTextControllerValidator =
        _loginUserEmailTextControllerValidator;
    loginUserPassVisibility = false;
    loginUserPassTextControllerValidator =
        _loginUserPassTextControllerValidator;
    signupUserEmailTextControllerValidator =
        _signupUserEmailTextControllerValidator;
    signupUserPassVisibility = false;
    signupUserPassTextControllerValidator =
        _signupUserPassTextControllerValidator;
  }

  @override
  void dispose() {
    loginUserEmailFocusNode?.dispose();
    loginUserEmailTextController?.dispose();

    loginUserPassFocusNode?.dispose();
    loginUserPassTextController?.dispose();

    signupUserEmailFocusNode?.dispose();
    signupUserEmailTextController?.dispose();

    signupUserPassFocusNode?.dispose();
    signupUserPassTextController?.dispose();
  }
}
