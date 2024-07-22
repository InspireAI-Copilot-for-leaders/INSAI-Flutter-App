import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_signup_or_login_model.dart';
export 'auth_signup_or_login_model.dart';

class AuthSignupOrLoginWidget extends StatefulWidget {
  const AuthSignupOrLoginWidget({super.key});

  @override
  State<AuthSignupOrLoginWidget> createState() =>
      _AuthSignupOrLoginWidgetState();
}

class _AuthSignupOrLoginWidgetState extends State<AuthSignupOrLoginWidget>
    with TickerProviderStateMixin {
  late AuthSignupOrLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;
  var hasButtonTriggered1 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuthSignupOrLoginModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'auth_signupOrLogin'});
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.loginUserEmailTextController ??= TextEditingController();
    _model.loginUserEmailFocusNode ??= FocusNode();

    _model.loginUserPassTextController ??= TextEditingController();
    _model.loginUserPassFocusNode ??= FocusNode();

    _model.signupUserEmailTextController ??= TextEditingController();
    _model.signupUserEmailFocusNode ??= FocusNode();

    _model.signupUserPassTextController ??= TextEditingController();
    _model.signupUserPassFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: const Offset(20.0, 20.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'imageOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1200.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1200.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1200.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          BlurEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(4.0, 4.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-300.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(2.0, 1.0),
            end: const Offset(1.0, 1.0),
          ),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-81.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(4.0, 4.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(-106.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(4.0, 4.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primary,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation1']!),
                  Align(
                    alignment: const AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/DALL_E_2024-01-13_17.25_1.png',
                          width: 96.0,
                          height: 88.0,
                          fit: BoxFit.contain,
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation']!),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 72.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-0.05, 0.21),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? 'assets/images/InspireAI_LOGO2_(1).png'
                                      : 'assets/images/InspireAI_LOGO2_(1).png',
                                  width: 161.0,
                                  height: 25.0,
                                  fit: BoxFit.contain,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: AutoSizeText(
                                      'Lead the Digital Era',
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      minFontSize: 18.0,
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .displaySmallFamily,
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .displaySmallFamily),
                                          ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 24.0),
                                      child: AutoSizeText(
                                        'Your Ideas, Amplified.',
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        minFontSize: 18.0,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 22.0,
                                              letterSpacing: 1.5,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLargeFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Opacity(
                                          opacity: 0.4,
                                          child: Container(
                                            width: (_model.authType ==
                                                        'signup_email') ||
                                                    (_model.authType ==
                                                        'login_email')
                                                ? 90.0
                                                : 72.0,
                                            height: 1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.8,
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: Text(
                                                () {
                                                  if (_model.authType ==
                                                      'signup_email') {
                                                    return 'Sign up';
                                                  } else if (_model.authType ==
                                                      'login_email') {
                                                    return 'Login';
                                                  } else {
                                                    return 'Login or signup';
                                                  }
                                                }(),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily),
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.4,
                                          child: Container(
                                            width: (_model.authType ==
                                                        'signup_email') ||
                                                    (_model.authType ==
                                                        'login_email')
                                                ? 90.0
                                                : 72.0,
                                            height: 1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (_model.authType == 'login_email')
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .loginUserEmailTextController,
                                                  focusNode: _model
                                                      .loginUserEmailFocusNode,
                                                  autofocus: false,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Email Address',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    hintText:
                                                        'Enter your email here...',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFFE0E3E7),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFF5A5D5D),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                24.0,
                                                                20.0,
                                                                24.0),
                                                    prefixIcon: const Icon(
                                                      Icons.email_outlined,
                                                      color: Color(0x9C57636C),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  validator: _model
                                                      .loginUserEmailTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 16.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .loginUserPassTextController,
                                                  focusNode: _model
                                                      .loginUserPassFocusNode,
                                                  autofocus: false,
                                                  obscureText: !_model
                                                      .loginUserPassVisibility,
                                                  decoration: InputDecoration(
                                                    labelText: 'Password',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    hintText:
                                                        'Choose a secure password...',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFFE0E3E7),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFF5A5D5D),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                24.0,
                                                                20.0,
                                                                24.0),
                                                    prefixIcon: const Icon(
                                                      Icons.password_rounded,
                                                      color: Color(0x9C57636C),
                                                    ),
                                                    suffixIcon: InkWell(
                                                      onTap: () => setState(
                                                        () => _model
                                                                .loginUserPassVisibility =
                                                            !_model
                                                                .loginUserPassVisibility,
                                                      ),
                                                      focusNode: FocusNode(
                                                          skipTraversal: true),
                                                      child: Icon(
                                                        _model.loginUserPassVisibility
                                                            ? Icons
                                                                .visibility_outlined
                                                            : Icons
                                                                .visibility_off_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  validator: _model
                                                      .loginUserPassTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (_model.authType == 'signup_email')
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .signupUserEmailTextController,
                                                  focusNode: _model
                                                      .signupUserEmailFocusNode,
                                                  autofocus: false,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Email Address',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    hintText:
                                                        'Enter your email here...',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFFE0E3E7),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFF5A5D5D),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                24.0,
                                                                20.0,
                                                                24.0),
                                                    prefixIcon: const Icon(
                                                      Icons.email_outlined,
                                                      color: Color(0x9C57636C),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  validator: _model
                                                      .signupUserEmailTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 12.0, 0.0, 20.0),
                                                child: TextFormField(
                                                  controller: _model
                                                      .signupUserPassTextController,
                                                  focusNode: _model
                                                      .signupUserPassFocusNode,
                                                  autofocus: false,
                                                  obscureText: !_model
                                                      .signupUserPassVisibility,
                                                  decoration: InputDecoration(
                                                    labelText: 'Password',
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    hintText:
                                                        'Choose a secure password...',
                                                    hintStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily),
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFFE0E3E7),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Color(0xFF5A5D5D),
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 2.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                24.0,
                                                                20.0,
                                                                24.0),
                                                    prefixIcon: const Icon(
                                                      Icons.password_rounded,
                                                      color: Color(0x9C57636C),
                                                    ),
                                                    suffixIcon: InkWell(
                                                      onTap: () => setState(
                                                        () => _model
                                                                .signupUserPassVisibility =
                                                            !_model
                                                                .signupUserPassVisibility,
                                                      ),
                                                      focusNode: FocusNode(
                                                          skipTraversal: true),
                                                      child: Icon(
                                                        _model.signupUserPassVisibility
                                                            ? Icons
                                                                .visibility_outlined
                                                            : Icons
                                                                .visibility_off_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 20.0,
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  keyboardType: TextInputType
                                                      .visiblePassword,
                                                  cursorColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  validator: _model
                                                      .signupUserPassTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: Stack(
                                      children: [
                                        if (_model.authType == 'signup_email')
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'AUTH_SIGNUP_OR_LOGIN_email_SignupContinu');
                                              logFirebaseEvent(
                                                  'email_SignupContinue_auth');
                                              GoRouter.of(context)
                                                  .prepareAuthEvent(true);

                                              final user = await authManager
                                                  .createAccountWithEmail(
                                                context,
                                                _model
                                                    .signupUserEmailTextController
                                                    .text,
                                                _model
                                                    .signupUserPassTextController
                                                    .text,
                                              );
                                              if (user == null) {
                                                return;
                                              }

                                              await UsersRecord.collection
                                                  .doc(user.uid)
                                                  .update(createUsersRecordData(
                                                    createdTime:
                                                        getCurrentTimestamp,
                                                    email: _model
                                                        .signupUserEmailTextController
                                                        .text,
                                                    pushNotifications:
                                                        createNotificationPopupStruct(
                                                      notificationPopupVisible:
                                                          true,
                                                      clearUnsetFields: false,
                                                      create: true,
                                                    ),
                                                    onboardingStatus:
                                                        'notStarted',
                                                    accessType: 'noAccess',
                                                    linkedinConnected: false,
                                                  ));

                                              logFirebaseEvent(
                                                  'email_SignupContinue_navigate_to');

                                              context.goNamedAuth(
                                                'freeTrial',
                                                context.mounted,
                                                ignoreRedirect: true,
                                              );
                                            },
                                            text: 'Continue',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily),
                                                  ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ).animateOnActionTrigger(
                                              animationsMap[
                                                  'buttonOnActionTriggerAnimation1']!,
                                              hasBeenTriggered:
                                                  hasButtonTriggered1),
                                        if (_model.authType == 'login_email')
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'AUTH_SIGNUP_OR_LOGIN_forgot_pass_ON_TAP');
                                                    logFirebaseEvent(
                                                        'forgot_pass_navigate_to');

                                                    context.pushNamed(
                                                        'forgot_pass');
                                                  },
                                                  text: 'Forgot Password?',
                                                  options: FFButtonOptions(
                                                    height: 24.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      width: 0.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                ).animateOnActionTrigger(
                                                  animationsMap[
                                                      'buttonOnActionTriggerAnimation2']!,
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Stack(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  children: [
                                                    if (!_model.loginBtnVisible)
                                                      Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 3.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Container(
                                                          width: 150.0,
                                                          height: 48.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'containerOnActionTriggerAnimation']!,
                                                      ),
                                                    if (!_model.loginBtnVisible)
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -0.05, -0.26),
                                                        child: Text(
                                                          'Continue',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'textOnActionTriggerAnimation']!,
                                                        ),
                                                      ),
                                                    if (_model.loginBtnVisible)
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'AUTH_SIGNUP_OR_LOGIN_email_loginContinue');
                                                          logFirebaseEvent(
                                                              'email_loginContinue_auth');
                                                          GoRouter.of(context)
                                                              .prepareAuthEvent(
                                                                  true);

                                                          final user =
                                                              await authManager
                                                                  .signInWithEmail(
                                                            context,
                                                            _model
                                                                .loginUserEmailTextController
                                                                .text,
                                                            _model
                                                                .loginUserPassTextController
                                                                .text,
                                                          );
                                                          if (user == null) {
                                                            return;
                                                          }

                                                          if ((currentUserEmail ==
                                                                  'admindemo@inspireai.com') &&
                                                              (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.accessType,
                                                                      '') !=
                                                                  'paidExpired')) {
                                                            logFirebaseEvent(
                                                                'email_loginContinue_navigate_to');

                                                            context.goNamedAuth(
                                                              'freeTrial',
                                                              context.mounted,
                                                              ignoreRedirect:
                                                                  true,
                                                            );
                                                          } else {
                                                            if ((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.accessType,
                                                                        '') ==
                                                                    'noAccess') ||
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.accessType,
                                                                        '') ==
                                                                    'paidWaitlist')) {
                                                              logFirebaseEvent(
                                                                  'email_loginContinue_navigate_to');

                                                              context
                                                                  .goNamedAuth(
                                                                'freeTrial',
                                                                context.mounted,
                                                                ignoreRedirect:
                                                                    true,
                                                              );
                                                            } else {
                                                              if (((valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.accessType,
                                                                              '') ==
                                                                          'freeTrial') ||
                                                                      (valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.accessType,
                                                                              '') ==
                                                                          'subscribed')) &&
                                                                  (valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.onboardingStatus,
                                                                          '') ==
                                                                      'notStarted')) {
                                                                logFirebaseEvent(
                                                                    'email_loginContinue_navigate_to');

                                                                context
                                                                    .goNamedAuth(
                                                                  'phoneNumberInput',
                                                                  context
                                                                      .mounted,
                                                                  ignoreRedirect:
                                                                      true,
                                                                );
                                                              } else {
                                                                if (((valueOrDefault(currentUserDocument?.accessType, '') ==
                                                                            'freeTrial') ||
                                                                        (valueOrDefault(currentUserDocument?.accessType, '') ==
                                                                            'subscribed')) &&
                                                                    (valueOrDefault(
                                                                            currentUserDocument?.onboardingStatus,
                                                                            '') ==
                                                                        'phoneVerified')) {
                                                                  logFirebaseEvent(
                                                                      'email_loginContinue_navigate_to');

                                                                  context
                                                                      .goNamedAuth(
                                                                    'linkedinProfileInput',
                                                                    context
                                                                        .mounted,
                                                                    ignoreRedirect:
                                                                        true,
                                                                  );
                                                                } else {
                                                                  if (((valueOrDefault(currentUserDocument?.accessType, '') ==
                                                                              'freeTrial') ||
                                                                          (valueOrDefault(currentUserDocument?.accessType, '') ==
                                                                              'subscribed')) &&
                                                                      (valueOrDefault(
                                                                              currentUserDocument?.onboardingStatus,
                                                                              '') ==
                                                                          'linkedinSet')) {
                                                                    logFirebaseEvent(
                                                                        'email_loginContinue_navigate_to');

                                                                    context
                                                                        .goNamedAuth(
                                                                      'setExpertise',
                                                                      context
                                                                          .mounted,
                                                                      ignoreRedirect:
                                                                          true,
                                                                    );
                                                                  } else {
                                                                    if (((valueOrDefault(currentUserDocument?.accessType, '') ==
                                                                                'freeTrial') ||
                                                                            (valueOrDefault(currentUserDocument?.accessType, '') ==
                                                                                'subscribed')) &&
                                                                        (valueOrDefault(currentUserDocument?.onboardingStatus,
                                                                                '') ==
                                                                            'expertiseSet')) {
                                                                      logFirebaseEvent(
                                                                          'email_loginContinue_navigate_to');

                                                                      context.goNamedAuth(
                                                                          'brandVoice',
                                                                          context
                                                                              .mounted);
                                                                    } else {
                                                                      if (((valueOrDefault(currentUserDocument?.accessType, '') == 'freeTrial') ||
                                                                              (valueOrDefault(currentUserDocument?.accessType, '') ==
                                                                                  'subscribed')) &&
                                                                          (valueOrDefault(currentUserDocument?.onboardingStatus, '') ==
                                                                              'completed')) {
                                                                        logFirebaseEvent(
                                                                            'email_loginContinue_navigate_to');

                                                                        context.goNamedAuth(
                                                                            'dashboard',
                                                                            context.mounted);
                                                                      } else {
                                                                        logFirebaseEvent(
                                                                            'email_loginContinue_navigate_to');

                                                                        context.pushNamedAuth(
                                                                            'subsExpired',
                                                                            context.mounted);
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        },
                                                        text: 'Continue',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 150.0,
                                                          height: 48.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleSmallFamily),
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              const BorderSide(
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        if (_model.authType == 'phone')
                                          FFButtonWidget(
                                            onPressed: () {
                                              print(
                                                  'phoneAuthContinue pressed ...');
                                            },
                                            text: 'Continue',
                                            options: FFButtonOptions(
                                              width: double.infinity,
                                              height: 48.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily),
                                                  ),
                                              elevation: 3.0,
                                              borderSide: const BorderSide(
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'buttonOnActionTriggerAnimation3']!,
                                          ),
                                      ],
                                    ),
                                  ),
                                  if (_model.authType == 'phone' ? false : true)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'AUTH_SIGNUP_OR_LOGIN_createAccount_ON_TA');
                                        if (_model.authType == 'signup_email') {
                                          logFirebaseEvent(
                                              'createAccount_update_page_state');
                                          _model.authType = 'login_email';
                                          setState(() {});
                                          logFirebaseEvent(
                                              'createAccount_wait__delay');
                                          await Future.delayed(const Duration(
                                              milliseconds: 100));
                                          logFirebaseEvent(
                                              'createAccount_widget_animation');
                                          if (animationsMap[
                                                  'containerOnActionTriggerAnimation'] !=
                                              null) {
                                            animationsMap[
                                                    'containerOnActionTriggerAnimation']!
                                                .controller
                                                .forward(from: 0.0);
                                          }
                                          logFirebaseEvent(
                                              'createAccount_widget_animation');
                                          if (animationsMap[
                                                  'textOnActionTriggerAnimation'] !=
                                              null) {
                                            animationsMap[
                                                    'textOnActionTriggerAnimation']!
                                                .controller
                                                .forward(from: 0.0);
                                          }
                                          logFirebaseEvent(
                                              'createAccount_widget_animation');
                                          if (animationsMap[
                                                  'buttonOnActionTriggerAnimation2'] !=
                                              null) {
                                            await animationsMap[
                                                    'buttonOnActionTriggerAnimation2']!
                                                .controller
                                                .forward(from: 0.0);
                                          }
                                          logFirebaseEvent(
                                              'createAccount_wait__delay');
                                          await Future.delayed(const Duration(
                                              milliseconds: 200));
                                          logFirebaseEvent(
                                              'createAccount_update_page_state');
                                          _model.loginBtnVisible = true;
                                          setState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'createAccount_update_page_state');
                                          _model.loginBtnVisible = false;
                                          setState(() {});
                                          logFirebaseEvent(
                                              'createAccount_wait__delay');
                                          await Future.delayed(const Duration(
                                              milliseconds: 100));
                                          logFirebaseEvent(
                                              'createAccount_widget_animation');
                                          if (animationsMap[
                                                  'containerOnActionTriggerAnimation'] !=
                                              null) {
                                            animationsMap[
                                                    'containerOnActionTriggerAnimation']!
                                                .controller
                                                .reverse();
                                          }
                                          logFirebaseEvent(
                                              'createAccount_widget_animation');
                                          if (animationsMap[
                                                  'textOnActionTriggerAnimation'] !=
                                              null) {
                                            animationsMap[
                                                    'textOnActionTriggerAnimation']!
                                                .controller
                                                .reverse();
                                          }
                                          logFirebaseEvent(
                                              'createAccount_widget_animation');
                                          if (animationsMap[
                                                  'buttonOnActionTriggerAnimation2'] !=
                                              null) {
                                            await animationsMap[
                                                    'buttonOnActionTriggerAnimation2']!
                                                .controller
                                                .reverse();
                                          }
                                          logFirebaseEvent(
                                              'createAccount_update_page_state');
                                          _model.authType = 'signup_email';
                                          setState(() {});
                                          logFirebaseEvent(
                                              'createAccount_widget_animation');
                                          if (animationsMap[
                                                  'buttonOnActionTriggerAnimation1'] !=
                                              null) {
                                            setState(() =>
                                                hasButtonTriggered1 = true);
                                            SchedulerBinding.instance
                                                .addPostFrameCallback((_) async =>
                                                    await animationsMap[
                                                            'buttonOnActionTriggerAnimation1']!
                                                        .controller
                                                        .forward(from: 0.0));
                                          }
                                        }
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 8.0),
                                            child: Text(
                                              _model.authType == 'signup_email'
                                                  ? 'Already have an account?'
                                                  : 'Are you new here?',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 8.0, 0.0, 8.0),
                                            child: Text(
                                              _model.authType == 'signup_email'
                                                  ? 'Login'
                                                  : 'Signup',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmallFamily),
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Opacity(
                                            opacity: 0.4,
                                            child: Container(
                                              width: 90.0,
                                              height: 1.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ),
                                          ),
                                          Opacity(
                                            opacity: 0.8,
                                            child: Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Text(
                                                  'or',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLargeFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Opacity(
                                            opacity: 0.4,
                                            child: Container(
                                              width: 90.0,
                                              height: 1.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 1.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Opacity(
                                          opacity: 0.8,
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderRadius: 48.0,
                                              borderWidth: 1.0,
                                              buttonSize: 48.0,
                                              fillColor: const Color(0xB2979797),
                                              icon: FaIcon(
                                                FontAwesomeIcons.google,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'AUTH_SIGNUP_OR_LOGIN_googleAuthButton_ON');
                                                logFirebaseEvent(
                                                    'googleAuthButton_auth');
                                                GoRouter.of(context)
                                                    .prepareAuthEvent(true);
                                                final user = await authManager
                                                    .signInWithGoogle(context);
                                                if (user == null) {
                                                  return;
                                                }
                                                if ((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.onboardingStatus,
                                                                '') ==
                                                            '') ||
                                                    (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.accessType,
                                                                '') ==
                                                            '')) {
                                                  logFirebaseEvent(
                                                      'googleAuthButton_backend_call');

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    onboardingStatus:
                                                        'notStarted',
                                                    accessType: 'noAccess',
                                                    linkedinConnected: false,
                                                  ));
                                                }
                                                if ((currentUserEmail ==
                                                        'admindemo@inspireai.com') &&
                                                    (valueOrDefault(
                                                            currentUserDocument
                                                                ?.accessType,
                                                            '') !=
                                                        'paidExpired')) {
                                                  logFirebaseEvent(
                                                      'googleAuthButton_navigate_to');

                                                  context.goNamedAuth(
                                                    'freeTrial',
                                                    context.mounted,
                                                    ignoreRedirect: true,
                                                  );
                                                } else {
                                                  if ((valueOrDefault(
                                                              currentUserDocument
                                                                  ?.accessType,
                                                              '') ==
                                                          'noAccess') ||
                                                      (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.accessType,
                                                              '') ==
                                                          'paidWaitlist')) {
                                                    logFirebaseEvent(
                                                        'googleAuthButton_navigate_to');

                                                    context.goNamedAuth(
                                                      'freeTrial',
                                                      context.mounted,
                                                      ignoreRedirect: true,
                                                    );
                                                  } else {
                                                    if (((valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.accessType,
                                                                    '') ==
                                                                'freeTrial') ||
                                                            (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.accessType,
                                                                    '') ==
                                                                'subscribed')) &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.onboardingStatus,
                                                                '') ==
                                                            'notStarted')) {
                                                      logFirebaseEvent(
                                                          'googleAuthButton_navigate_to');

                                                      context.goNamedAuth(
                                                        'phoneNumberInput',
                                                        context.mounted,
                                                        ignoreRedirect: true,
                                                      );
                                                    } else {
                                                      if (((valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.accessType,
                                                                      '') ==
                                                                  'freeTrial') ||
                                                              (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.accessType,
                                                                      '') ==
                                                                  'subscribed')) &&
                                                          (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.onboardingStatus,
                                                                  '') ==
                                                              'phoneVerified')) {
                                                        logFirebaseEvent(
                                                            'googleAuthButton_navigate_to');

                                                        context.goNamedAuth(
                                                          'linkedinProfileInput',
                                                          context.mounted,
                                                          ignoreRedirect: true,
                                                        );
                                                      } else {
                                                        if (((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.accessType,
                                                                        '') ==
                                                                    'freeTrial') ||
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.accessType,
                                                                        '') ==
                                                                    'subscribed')) &&
                                                            (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.onboardingStatus,
                                                                    '') ==
                                                                'linkedinSet')) {
                                                          logFirebaseEvent(
                                                              'googleAuthButton_navigate_to');

                                                          context.goNamedAuth(
                                                            'setExpertise',
                                                            context.mounted,
                                                            ignoreRedirect:
                                                                true,
                                                          );
                                                        } else {
                                                          if (((valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.accessType,
                                                                          '') ==
                                                                      'freeTrial') ||
                                                                  (valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.accessType,
                                                                          '') ==
                                                                      'subscribed')) &&
                                                              (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.onboardingStatus,
                                                                      '') ==
                                                                  'expertiseSet')) {
                                                            logFirebaseEvent(
                                                                'googleAuthButton_navigate_to');

                                                            context.goNamedAuth(
                                                                'brandVoice',
                                                                context
                                                                    .mounted);
                                                          } else {
                                                            if (((valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.accessType,
                                                                            '') ==
                                                                        'freeTrial') ||
                                                                    (valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.accessType,
                                                                            '') ==
                                                                        'subscribed')) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.onboardingStatus,
                                                                        '') ==
                                                                    'completed')) {
                                                              logFirebaseEvent(
                                                                  'googleAuthButton_navigate_to');

                                                              context.goNamedAuth(
                                                                  'dashboard',
                                                                  context
                                                                      .mounted);
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'googleAuthButton_navigate_to');

                                                              context.pushNamedAuth(
                                                                  'subsExpired',
                                                                  context
                                                                      .mounted);
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                        Opacity(
                                          opacity: 0.8,
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 16.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 48.0,
                                              borderWidth: 1.0,
                                              buttonSize: 48.0,
                                              fillColor: const Color(0xB2979797),
                                              icon: FaIcon(
                                                FontAwesomeIcons.apple,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'AUTH_SIGNUP_OR_LOGIN_appleAuthButton_ON_');
                                                logFirebaseEvent(
                                                    'appleAuthButton_auth');
                                                GoRouter.of(context)
                                                    .prepareAuthEvent(true);
                                                final user = await authManager
                                                    .signInWithApple(context);
                                                if (user == null) {
                                                  return;
                                                }
                                                if ((valueOrDefault(
                                                                currentUserDocument
                                                                    ?.onboardingStatus,
                                                                '') ==
                                                            '') ||
                                                    (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.accessType,
                                                                '') ==
                                                            '')) {
                                                  logFirebaseEvent(
                                                      'appleAuthButton_backend_call');

                                                  await currentUserReference!
                                                      .update(
                                                          createUsersRecordData(
                                                    onboardingStatus:
                                                        'notStarted',
                                                    accessType: 'noAccess',
                                                    linkedinConnected: false,
                                                  ));
                                                }
                                                if ((currentUserEmail ==
                                                        'admindemo@inspireai.com') &&
                                                    (valueOrDefault(
                                                            currentUserDocument
                                                                ?.accessType,
                                                            '') !=
                                                        'paidExpired')) {
                                                  logFirebaseEvent(
                                                      'appleAuthButton_navigate_to');

                                                  context.goNamedAuth(
                                                    'freeTrial',
                                                    context.mounted,
                                                    ignoreRedirect: true,
                                                  );
                                                } else {
                                                  if ((valueOrDefault(
                                                              currentUserDocument
                                                                  ?.accessType,
                                                              '') ==
                                                          'noAccess') ||
                                                      (valueOrDefault(
                                                              currentUserDocument
                                                                  ?.accessType,
                                                              '') ==
                                                          'paidWaitlist')) {
                                                    logFirebaseEvent(
                                                        'appleAuthButton_navigate_to');

                                                    context.goNamedAuth(
                                                      'freeTrial',
                                                      context.mounted,
                                                      ignoreRedirect: true,
                                                    );
                                                  } else {
                                                    if (((valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.accessType,
                                                                    '') ==
                                                                'freeTrial') ||
                                                            (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.accessType,
                                                                    '') ==
                                                                'subscribed')) &&
                                                        (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.onboardingStatus,
                                                                '') ==
                                                            'notStarted')) {
                                                      logFirebaseEvent(
                                                          'appleAuthButton_navigate_to');

                                                      context.goNamedAuth(
                                                        'phoneNumberInput',
                                                        context.mounted,
                                                        ignoreRedirect: true,
                                                      );
                                                    } else {
                                                      if (((valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.accessType,
                                                                      '') ==
                                                                  'freeTrial') ||
                                                              (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.accessType,
                                                                      '') ==
                                                                  'subscribed')) &&
                                                          (valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.onboardingStatus,
                                                                  '') ==
                                                              'phoneVerified')) {
                                                        logFirebaseEvent(
                                                            'appleAuthButton_navigate_to');

                                                        context.goNamedAuth(
                                                          'linkedinProfileInput',
                                                          context.mounted,
                                                          ignoreRedirect: true,
                                                        );
                                                      } else {
                                                        if (((valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.accessType,
                                                                        '') ==
                                                                    'freeTrial') ||
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.accessType,
                                                                        '') ==
                                                                    'subscribed')) &&
                                                            (valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.onboardingStatus,
                                                                    '') ==
                                                                'linkedinSet')) {
                                                          logFirebaseEvent(
                                                              'appleAuthButton_navigate_to');

                                                          context.goNamedAuth(
                                                            'setExpertise',
                                                            context.mounted,
                                                            ignoreRedirect:
                                                                true,
                                                          );
                                                        } else {
                                                          if (((valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.accessType,
                                                                          '') ==
                                                                      'freeTrial') ||
                                                                  (valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.accessType,
                                                                          '') ==
                                                                      'subscribed')) &&
                                                              (valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.onboardingStatus,
                                                                      '') ==
                                                                  'expertiseSet')) {
                                                            logFirebaseEvent(
                                                                'appleAuthButton_navigate_to');

                                                            context.goNamedAuth(
                                                                'brandVoice',
                                                                context
                                                                    .mounted);
                                                          } else {
                                                            if (((valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.accessType,
                                                                            '') ==
                                                                        'freeTrial') ||
                                                                    (valueOrDefault(
                                                                            currentUserDocument
                                                                                ?.accessType,
                                                                            '') ==
                                                                        'subscribed')) &&
                                                                (valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.onboardingStatus,
                                                                        '') ==
                                                                    'completed')) {
                                                              logFirebaseEvent(
                                                                  'appleAuthButton_navigate_to');

                                                              context.goNamedAuth(
                                                                  'dashboard',
                                                                  context
                                                                      .mounted);
                                                            } else {
                                                              logFirebaseEvent(
                                                                  'appleAuthButton_navigate_to');

                                                              context.pushNamedAuth(
                                                                  'subsExpired',
                                                                  context
                                                                      .mounted);
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                        if ((_model.authType != 'phone') &&
                                            responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                            ))
                                          Opacity(
                                            opacity: 0.8,
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 48.0,
                                              borderWidth: 1.0,
                                              buttonSize: 48.0,
                                              fillColor: const Color(0xB2979797),
                                              icon: Icon(
                                                Icons.phone,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'AUTH_SIGNUP_OR_LOGIN_phoneAuthButton_ON_');
                                                if (_model.authType ==
                                                    'signup_email') {
                                                  logFirebaseEvent(
                                                      'phoneAuthButton_widget_animation');
                                                  if (animationsMap[
                                                          'buttonOnActionTriggerAnimation1'] !=
                                                      null) {
                                                    animationsMap[
                                                            'buttonOnActionTriggerAnimation1']!
                                                        .controller
                                                        .reverse();
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'phoneAuthButton_widget_animation');
                                                  if (animationsMap[
                                                          'containerOnActionTriggerAnimation'] !=
                                                      null) {
                                                    animationsMap[
                                                            'containerOnActionTriggerAnimation']!
                                                        .controller
                                                        .reverse();
                                                  }
                                                  logFirebaseEvent(
                                                      'phoneAuthButton_widget_animation');
                                                  if (animationsMap[
                                                          'textOnActionTriggerAnimation'] !=
                                                      null) {
                                                    animationsMap[
                                                            'textOnActionTriggerAnimation']!
                                                        .controller
                                                        .reverse();
                                                  }
                                                  logFirebaseEvent(
                                                      'phoneAuthButton_widget_animation');
                                                  if (animationsMap[
                                                          'buttonOnActionTriggerAnimation2'] !=
                                                      null) {
                                                    animationsMap[
                                                            'buttonOnActionTriggerAnimation2']!
                                                        .controller
                                                        .reverse();
                                                  }
                                                }

                                                logFirebaseEvent(
                                                    'phoneAuthButton_update_page_state');
                                                _model.authType = 'phone';
                                                setState(() {});
                                                logFirebaseEvent(
                                                    'phoneAuthButton_wait__delay');
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 100));
                                                logFirebaseEvent(
                                                    'phoneAuthButton_widget_animation');
                                                if (animationsMap[
                                                        'buttonOnActionTriggerAnimation3'] !=
                                                    null) {
                                                  animationsMap[
                                                          'buttonOnActionTriggerAnimation3']!
                                                      .controller
                                                      .forward(from: 0.0);
                                                }
                                              },
                                            ),
                                          ),
                                        if (_model.authType == 'phone')
                                          Opacity(
                                            opacity: 0.8,
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 48.0,
                                              borderWidth: 1.0,
                                              buttonSize: 48.0,
                                              fillColor: const Color(0xB2979797),
                                              icon: Icon(
                                                Icons.email_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'AUTH_SIGNUP_OR_LOGIN_emailAuthButton_ON_');
                                                logFirebaseEvent(
                                                    'emailAuthButton_widget_animation');
                                                if (animationsMap[
                                                        'buttonOnActionTriggerAnimation3'] !=
                                                    null) {
                                                  await animationsMap[
                                                          'buttonOnActionTriggerAnimation3']!
                                                      .controller
                                                      .reverse();
                                                }
                                                logFirebaseEvent(
                                                    'emailAuthButton_update_page_state');
                                                _model.authType =
                                                    'signup_email';
                                                setState(() {});
                                                logFirebaseEvent(
                                                    'emailAuthButton_wait__delay');
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 100));
                                                logFirebaseEvent(
                                                    'emailAuthButton_widget_animation');
                                                if (animationsMap[
                                                        'buttonOnActionTriggerAnimation1'] !=
                                                    null) {
                                                  setState(() =>
                                                      hasButtonTriggered1 =
                                                          true);
                                                  SchedulerBinding.instance
                                                      .addPostFrameCallback(
                                                          (_) async =>
                                                              await animationsMap[
                                                                      'buttonOnActionTriggerAnimation1']!
                                                                  .controller
                                                                  .forward(
                                                                      from:
                                                                          0.0));
                                                }
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 16.0),
                            child: Container(
                              decoration: const BoxDecoration(),
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Visibility(
                                visible: !(isWeb
                                    ? MediaQuery.viewInsetsOf(context).bottom >
                                        0
                                    : _isKeyboardVisible),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  'By continuing, you agree to our ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily),
                                                  ),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 1.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'AUTH_SIGNUP_OR_LOGIN_RichText_lhaxo90g_O');
                                            logFirebaseEvent(
                                                'RichText_launch_u_r_l');
                                            await launchURL(
                                                'https://www.theinspireai.com/termsandconditions');
                                          },
                                          child: RichText(
                                            textScaler: MediaQuery.of(context)
                                                .textScaler,
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Terms of Service',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                  mouseCursor:
                                                      SystemMouseCursors.click,
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () async {
                                                          logFirebaseEvent(
                                                              'AUTH_SIGNUP_OR_LOGIN_RichTextSpan_3vxhy1');
                                                          logFirebaseEvent(
                                                              'RichTextSpan_launch_u_r_l');
                                                          await launchURL(
                                                              'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/');
                                                        },
                                                ),
                                                TextSpan(
                                                  text: ', ',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Content Policy',
                                                  style: GoogleFonts.getFont(
                                                    'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12.0,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                )
                                              ],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 1.0),
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Privacy Policy.',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                mouseCursor:
                                                    SystemMouseCursors.click,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () async {
                                                        logFirebaseEvent(
                                                            'AUTH_SIGNUP_OR_LOGIN_RichTextSpan_yr8wow');
                                                        logFirebaseEvent(
                                                            'RichTextSpan_launch_u_r_l');
                                                        await launchURL(
                                                            'https://www.theinspireai.com/privacypolicy');
                                                      },
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation2']!),
            ),
          ],
        ),
      ),
    );
  }
}
