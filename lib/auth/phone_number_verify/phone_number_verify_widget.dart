import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'phone_number_verify_model.dart';
export 'phone_number_verify_model.dart';

class PhoneNumberVerifyWidget extends StatefulWidget {
  const PhoneNumberVerifyWidget({super.key});

  @override
  State<PhoneNumberVerifyWidget> createState() =>
      _PhoneNumberVerifyWidgetState();
}

class _PhoneNumberVerifyWidgetState extends State<PhoneNumberVerifyWidget>
    with TickerProviderStateMixin {
  late PhoneNumberVerifyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PhoneNumberVerifyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'phone_number_verify'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PHONE_NUMBER_VERIFY_phone_number_verify_');
      logFirebaseEvent('phone_number_verify_auth');
      final phoneNumberVal = FFAppState().userPhoneNumber;
      if (phoneNumberVal.isEmpty ||
          !phoneNumberVal.startsWith('+')) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Phone Number is required and has to start with +.'),
          ),
        );
        return;
      }
      await authManager.beginPhoneAuth(
        context: context,
        phoneNumber: phoneNumberVal,
        onCodeSent: (context) async {
          context.goNamedAuth(
            'phone_number_verify',
            context.mounted,
            ignoreRedirect: true,
          );
        },
      );
    });

    authManager.handlePhoneAuthStateChanges(context);
    authManager.handlePhoneAuthStateChanges(context);
    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(2.5, 2.5),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'richTextOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(2.5, 2.5),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'pinCodeOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(2.5, 2.5),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'richTextOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(2.5, 2.5),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 600.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 800.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 800.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 800.0.ms,
            begin: const Offset(-300.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'PHONE_NUMBER_VERIFY_Row_dkjtft3d_ON_TAP');
                        logFirebaseEvent('Row_navigate_back');
                        context.pop();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                25.0, 13.0, 0.0, 13.0),
                            child: Icon(
                              Icons.arrow_back_ios_rounded,
                              color: FlutterFlowTheme.of(context).alternate,
                              size: 24.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Back ',
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineMediumFamily,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineMediumFamily),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              centerTitle: false,
              expandedTitleScale: 1.0,
            ),
            elevation: 2.0,
          ),
        ),
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                  maxWidth: 570.0,
                ),
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'OTP Verification',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineLargeFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineLargeFamily),
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation']!),
                        ),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ))
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 44.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 44.0,
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'PHONE_NUMBER_VERIFY_arrow_back_rounded_I');
                                    logFirebaseEvent(
                                        'IconButton_navigate_back');
                                    context.pop();
                                  },
                                ),
                              ),
                              Text(
                                'Confirm your Code',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily),
                                    ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 8.0, 24.0, 0.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Enter the code we sent over SMS to',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              TextSpan(
                                text: ' - ',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              TextSpan(
                                text: FFAppState().userPhoneNumber,
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['richTextOnPageLoadAnimation1']!),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 0.0),
                        child: PinCodeTextField(
                          autoDisposeControllers: false,
                          appContext: context,
                          length: 6,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          enableActiveFill: false,
                          autoFocus: true,
                          enablePinAutofill: true,
                          errorTextSpace: 16.0,
                          showCursor: true,
                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                          obscureText: false,
                          hintCharacter: '-',
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            fieldHeight: 48.0,
                            fieldWidth: 48.0,
                            borderWidth: 2.0,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            shape: PinCodeFieldShape.box,
                            activeColor:
                                FlutterFlowTheme.of(context).primaryText,
                            inactiveColor: const Color(0xA757636C),
                            selectedColor:
                                FlutterFlowTheme.of(context).secondary,
                            activeFillColor:
                                FlutterFlowTheme.of(context).primaryText,
                            inactiveFillColor: const Color(0xA757636C),
                            selectedFillColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                          controller: _model.phoneOTPcode,
                          onChanged: (_) {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator:
                              _model.phoneOTPcodeValidator.asValidator(context),
                        ).animateOnPageLoad(
                            animationsMap['pinCodeOnPageLoadAnimation']!),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Didn\'t get a code?',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                const TextSpan(
                                  text: ' ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: 'Send Again',
                                  style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                  mouseCursor: SystemMouseCursors.click,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () async {
                                      logFirebaseEvent(
                                          'PHONE_NUMBER_VERIFY_RichTextSpan_elhsjg8');
                                      logFirebaseEvent('RichTextSpan_auth');
                                      final phoneNumberVal =
                                          FFAppState().userPhoneNumber;
                                      if (phoneNumberVal.isEmpty ||
                                          !phoneNumberVal.startsWith('+')) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Phone Number is required and has to start with +.'),
                                          ),
                                        );
                                        return;
                                      }
                                      await authManager.beginPhoneAuth(
                                        context: context,
                                        phoneNumber: phoneNumberVal,
                                        onCodeSent: (context) async {
                                          context.goNamedAuth(
                                            'phone_number_verify',
                                            context.mounted,
                                            ignoreRedirect: true,
                                          );
                                        },
                                      );
                                    },
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['richTextOnPageLoadAnimation2']!),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 40.0, 24.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderRadius: 56.0,
                            borderWidth: 1.0,
                            buttonSize: 56.0,
                            fillColor: FlutterFlowTheme.of(context).primaryText,
                            icon: FaIcon(
                              FontAwesomeIcons.arrowRight,
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              size: 28.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'PHONE_NUMBER_VERIFY_arrowRight_ICN_ON_TA');
                              logFirebaseEvent('IconButton_auth');
                              GoRouter.of(context).prepareAuthEvent(true);
                              final smsCodeVal = _model.phoneOTPcode!.text;
                              if (smsCodeVal.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Enter SMS verification code.'),
                                  ),
                                );
                                return;
                              }
                              final phoneVerifiedUser =
                                  await authManager.verifySmsCode(
                                context: context,
                                smsCode: smsCodeVal,
                              );
                              if (phoneVerifiedUser == null) {
                                return;
                              }

                              if ((valueOrDefault(
                                              currentUserDocument
                                                  ?.onboardingStatus,
                                              '') ==
                                          '') ||
                                  (valueOrDefault(
                                              currentUserDocument?.accessType,
                                              '') ==
                                          '')) {
                                logFirebaseEvent('IconButton_backend_call');

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  onboardingStatus: 'notStarted',
                                  accessType: 'noAccess',
                                ));
                              }
                              logFirebaseEvent('IconButton_revenue_cat');
                              final isEntitled = await revenue_cat
                                      .isEntitled('premium-full-access') ??
                                  false;
                              if (!isEntitled) {
                                await revenue_cat.loadOfferings();
                              }

                              if (isEntitled) {
                                if (valueOrDefault(
                                        currentUserDocument?.onboardingStatus,
                                        '') ==
                                    'notStarted') {
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.goNamedAuth(
                                    'paymentSuccess',
                                    context.mounted,
                                    ignoreRedirect: true,
                                  );
                                } else {
                                  if (valueOrDefault(
                                          currentUserDocument?.onboardingStatus,
                                          '') ==
                                      'inProgress') {
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.goNamedAuth(
                                      'linkedinAuth',
                                      context.mounted,
                                      ignoreRedirect: true,
                                    );
                                  } else {
                                    if (valueOrDefault(
                                            currentUserDocument
                                                ?.onboardingStatus,
                                            '') ==
                                        'completed') {
                                      logFirebaseEvent(
                                          'IconButton_navigate_to');

                                      context.goNamedAuth(
                                          'dashboard', context.mounted);
                                    } else {
                                      logFirebaseEvent(
                                          'IconButton_alert_dialog');
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Failed!'),
                                            content: const Text(
                                                'All validation conditions failed.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  }
                                }
                              } else {
                                if ((valueOrDefault(
                                            currentUserDocument?.accessType,
                                            '') ==
                                        'noAccess') ||
                                    (valueOrDefault(
                                            currentUserDocument?.accessType,
                                            '') ==
                                        'paidWaitlist')) {
                                  logFirebaseEvent('IconButton_navigate_to');

                                  context.goNamedAuth(
                                    'payWall',
                                    context.mounted,
                                    ignoreRedirect: true,
                                  );
                                } else {
                                  if (valueOrDefault(
                                          currentUserDocument?.accessType,
                                          '') ==
                                      'specialWaitlist') {
                                    logFirebaseEvent('IconButton_navigate_to');

                                    context.goNamedAuth(
                                      'accessRequested',
                                      context.mounted,
                                      ignoreRedirect: true,
                                    );
                                  } else {
                                    if ((valueOrDefault(
                                                currentUserDocument?.accessType,
                                                '') ==
                                            'specialGranted') &&
                                        (valueOrDefault(
                                                currentUserDocument
                                                    ?.onboardingStatus,
                                                '') ==
                                            'notStarted')) {
                                      logFirebaseEvent(
                                          'IconButton_navigate_to');

                                      context.goNamedAuth(
                                        'accessRequested',
                                        context.mounted,
                                        ignoreRedirect: true,
                                      );
                                    } else {
                                      if ((valueOrDefault(
                                                  currentUserDocument
                                                      ?.accessType,
                                                  '') ==
                                              'specialGranted') &&
                                          (valueOrDefault(
                                                  currentUserDocument
                                                      ?.onboardingStatus,
                                                  '') ==
                                              'inProgress')) {
                                        logFirebaseEvent(
                                            'IconButton_navigate_to');

                                        context.goNamedAuth(
                                          'linkedinAuth',
                                          context.mounted,
                                          ignoreRedirect: true,
                                        );
                                      } else {
                                        if ((valueOrDefault(
                                                    currentUserDocument
                                                        ?.accessType,
                                                    '') ==
                                                'specialGranted') &&
                                            (valueOrDefault(
                                                    currentUserDocument
                                                        ?.onboardingStatus,
                                                    '') ==
                                                'completed')) {
                                          logFirebaseEvent(
                                              'IconButton_navigate_to');

                                          context.goNamedAuth(
                                              'dashboard', context.mounted);
                                        } else {
                                          logFirebaseEvent(
                                              'IconButton_navigate_to');

                                          context.goNamedAuth(
                                              'subsExpired', context.mounted);
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            },
                          ).animateOnPageLoad(
                              animationsMap['iconButtonOnPageLoadAnimation']!),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
