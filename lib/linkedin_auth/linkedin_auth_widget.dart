import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/profile_loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/backend/schema/structs/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'linkedin_auth_model.dart';
export 'linkedin_auth_model.dart';

class LinkedinAuthWidget extends StatefulWidget {
  const LinkedinAuthWidget({
    super.key,
    required this.code,
  });

  final String? code;

  @override
  State<LinkedinAuthWidget> createState() => _LinkedinAuthWidgetState();
}

class _LinkedinAuthWidgetState extends State<LinkedinAuthWidget> {
  late LinkedinAuthModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LinkedinAuthModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'linkedinAuth'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LINKEDIN_AUTH_linkedinAuth_ON_INIT_STATE');
      logFirebaseEvent('linkedinAuth_backend_call');
      _model.linkedintokens = await LinkedinTokensCall.call(
        authCodeRecieved: widget.code,
      );
      if ((_model.linkedintokens?.succeeded ?? true)) {
        logFirebaseEvent('linkedinAuth_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          linkedinAccess: getJsonField(
            (_model.linkedintokens?.jsonBody ?? ''),
            r'''$.access_token''',
          ).toString().toString(),
          linkedinRefresh: getJsonField(
            (_model.linkedintokens?.jsonBody ?? ''),
            r'''$.refresh_token''',
          ).toString().toString(),
        ));
        logFirebaseEvent('linkedinAuth_backend_call');
        _model.lIprofileDetails =
            await LinkedInDataGroup.linkedinProfileDetailsCall.call(
          authToken: valueOrDefault(currentUserDocument?.linkedinAccess, ''),
        );
        if ((_model.lIprofileDetails?.succeeded ?? true)) {
          logFirebaseEvent('linkedinAuth_backend_call');

          await currentUserReference!.update(createUsersRecordData(
            linkedinDetails: updateLinkedinDetailsAuthStruct(
              LinkedinDetailsAuthStruct.maybeFromMap(
                  (_model.lIprofileDetails?.jsonBody ?? '')),
              clearUnsetFields: false,
            ),
          ));
          logFirebaseEvent('linkedinAuth_backend_call');
          _model.getExpertiseWorflow =
              await ExpertiseOfPersonProxycurlCall.call(
            linkedinUrl:
                'https://www.linkedin.com/in/${currentUserDocument?.linkedinDetails?.vanityName}',
            uid: currentUserUid,
          );
          if ((_model.getExpertiseWorflow?.succeeded ?? true)) {
            logFirebaseEvent('linkedinAuth_update_page_state');
            setState(() {
              _model.isLoading = false;
            });
          } else {
            logFirebaseEvent('linkedinAuth_navigate_to');

            context.goNamed(
              'linkedinConnect',
              queryParameters: {
                'connectSuccess': serializeParam(
                  false,
                  ParamType.bool,
                ),
              }.withoutNulls,
            );
          }
        } else {
          logFirebaseEvent('linkedinAuth_navigate_to');

          context.goNamed(
            'linkedinConnect',
            queryParameters: {
              'connectSuccess': serializeParam(
                false,
                ParamType.bool,
              ),
            }.withoutNulls,
          );
        }
      } else {
        logFirebaseEvent('linkedinAuth_navigate_to');

        context.goNamed(
          'linkedinConnect',
          queryParameters: {
            'connectSuccess': serializeParam(
              false,
              ParamType.bool,
            ),
          }.withoutNulls,
        );
      }
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.contentURL1TextController ??= TextEditingController();
    _model.contentURL1FocusNode ??= FocusNode();

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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Container(
              width: double.infinity,
              child: Stack(
                alignment: AlignmentDirectional(-1.0, 0.0),
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'LINKEDIN_AUTH_PAGE_Row_8t9eg47v_ON_TAP');
                      logFirebaseEvent('Row_alert_dialog');
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Logout?'),
                                content: Text(
                                    'This will log you out of InspireAI completely. Are you sure you want to logout?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Yes, Logout'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        logFirebaseEvent('Row_auth');
                        GoRouter.of(context).prepareAuthEvent(true);
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        logFirebaseEvent('Row_navigate_to');

                        context.goNamedAuth(
                          'LandingPage',
                          context.mounted,
                          ignoreRedirect: true,
                        );
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 4.0),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 22.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 4.0, 0.0, 4.0),
                          child: Text(
                            'Back ',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineMediumFamily,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineMediumFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Text(
                      'Expertise',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'LINKEDIN_AUTH_PAGE_Icon_4rby4r5s_ON_TAP');
                        logFirebaseEvent('Icon_navigate_to');

                        context.pushNamed('support');
                      },
                      child: Icon(
                        Icons.contact_support_outlined,
                        color: FlutterFlowTheme.of(context).secondary,
                        size: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Align(
              alignment: AlignmentDirectional(-1.0, -1.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 24.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 4.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => AutoSizeText(
                                          'Welcome ${currentUserDocument?.linkedinDetails?.localizedFirstName}!',
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .displayMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .displayMediumFamily,
                                                fontSize: 30.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(FlutterFlowTheme
                                                            .of(context)
                                                        .displayMediumFamily),
                                              ),
                                          minFontSize: 26.0,
                                        ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.8,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: Text(
                                          'We\'re gonna inspire the world together ;)',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 3.0),
                                      child: Text(
                                        'Your Expertise Areas',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLargeFamily),
                                            ),
                                      ),
                                    ),
                                    Opacity(
                                      opacity: 0.8,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Text(
                                          'Our AI analysed your expertise to be in the following topics. Add more or remove some...',
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
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
                                    Flexible(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Builder(
                                              builder: (context) {
                                                final thoughtLeadershipAre =
                                                    (currentUserDocument
                                                                ?.thoughtLeadershipAreas
                                                                ?.toList() ??
                                                            [])
                                                        .toList();
                                                return Wrap(
                                                  spacing: 4.0,
                                                  runSpacing: 4.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: List.generate(
                                                      thoughtLeadershipAre
                                                          .length,
                                                      (thoughtLeadershipAreIndex) {
                                                    final thoughtLeadershipAreItem =
                                                        thoughtLeadershipAre[
                                                            thoughtLeadershipAreIndex];
                                                    return Container(
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(48.0),
                                                      ),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'LINKEDIN_AUTH_PAGE_Row_l7iwstls_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Row_backend_call');

                                                          await currentUserReference!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'thought_leadership_areas':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  thoughtLeadershipAreItem
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                          logFirebaseEvent(
                                                              'Row_backend_call');

                                                          await currentUserReference!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'thought_leadership_areas_mapping':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  getThoughtLeadershipAreasMappingFirestoreData(
                                                                    createThoughtLeadershipAreasMappingStruct(
                                                                      fieldValues: {
                                                                        'sub_categories':
                                                                            FieldValue.arrayRemove([
                                                                          thoughtLeadershipAreItem
                                                                        ]),
                                                                      },
                                                                      clearUnsetFields:
                                                                          false,
                                                                    ),
                                                                    true,
                                                                  )
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Flexible(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                                child: Text(
                                                                  thoughtLeadershipAreItem,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 3.0),
                                      child: Text(
                                        'Add More',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLargeFamily),
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller:
                                            _model.contentURL1TextController,
                                        focusNode: _model.contentURL1FocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          hintText: 'Type to add custom',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
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
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFE0E3E7),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFF5A5D5D),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        validator: _model
                                            .contentURL1TextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'LINKEDIN_AUTH_PAGE_ADD_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'thought_leadership_areas':
                                                      FieldValue.arrayUnion([
                                                    _model
                                                        .contentURL1TextController
                                                        .text
                                                  ]),
                                                },
                                              ),
                                            });
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'thought_leadership_areas_mapping':
                                                      FieldValue.arrayUnion([
                                                    getThoughtLeadershipAreasMappingFirestoreData(
                                                      createThoughtLeadershipAreasMappingStruct(
                                                        category:
                                                            'Miscellaneous',
                                                        fieldValues: {
                                                          'sub_categories':
                                                              FieldValue
                                                                  .arrayUnion([
                                                            _model
                                                                .contentURL1TextController
                                                                .text
                                                          ]),
                                                        },
                                                        clearUnsetFields: false,
                                                      ),
                                                      true,
                                                    )
                                                  ]),
                                                },
                                              ),
                                            });
                                            logFirebaseEvent(
                                                'Button_firestore_query');
                                            _model.toBeReviewedDoc =
                                                await queryToBeReviewedRecordOnce(
                                              queryBuilder:
                                                  (toBeReviewedRecord) =>
                                                      toBeReviewedRecord.where(
                                                'uid',
                                                isEqualTo: currentUserUid,
                                              ),
                                              singleRecord: true,
                                            ).then((s) => s.firstOrNull);
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await _model
                                                .toBeReviewedDoc!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'addedByUser':
                                                      FieldValue.arrayUnion([
                                                    _model
                                                        .contentURL1TextController
                                                        .text
                                                  ]),
                                                },
                                              ),
                                            });

                                            setState(() {});
                                          },
                                          text: 'Add',
                                          options: FFButtonOptions(
                                            height: 20.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Opacity(
                                              opacity: 0.4,
                                              child: Container(
                                                width: 65.0,
                                                height: 1.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                              ),
                                            ),
                                            Opacity(
                                              opacity: 0.8,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  child: Text(
                                                    'or select from below',
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                width: 65.0,
                                                height: 1.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: AuthUserStreamWidget(
                                        builder: (context) => StreamBuilder<
                                            List<BroadDomainRecord>>(
                                          stream: queryBroadDomainRecord(
                                            queryBuilder: (broadDomainRecord) =>
                                                broadDomainRecord.whereIn(
                                                    'broad_domain',
                                                    (currentUserDocument
                                                                ?.thoughtLeadershipAreasMapping
                                                                ?.toList() ??
                                                            [])
                                                        .map((e) => e.category)
                                                        .toList()),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  child: SpinKitRipple(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 100.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<BroadDomainRecord>
                                                listViewBroadDomainRecordList =
                                                snapshot.data!;
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  listViewBroadDomainRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, listViewIndex) {
                                                final listViewBroadDomainRecord =
                                                    listViewBroadDomainRecordList[
                                                        listViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Text(
                                                          listViewBroadDomainRecord
                                                              .broadDomain,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, -1.0),
                                                        child: StreamBuilder<
                                                            List<
                                                                ExpertiseAreasRecord>>(
                                                          stream:
                                                              queryExpertiseAreasRecord(
                                                            parent:
                                                                listViewBroadDomainRecord
                                                                    .reference,
                                                            limit: 10,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 100.0,
                                                                  height: 100.0,
                                                                  child:
                                                                      SpinKitRipple(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    size: 100.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<ExpertiseAreasRecord>
                                                                wrapExpertiseAreasRecordList =
                                                                snapshot.data!;
                                                            return Wrap(
                                                              spacing: 4.0,
                                                              runSpacing: 4.0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalDirection:
                                                                  VerticalDirection
                                                                      .down,
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: List.generate(
                                                                  wrapExpertiseAreasRecordList
                                                                      .length,
                                                                  (wrapIndex) {
                                                                final wrapExpertiseAreasRecord =
                                                                    wrapExpertiseAreasRecordList[
                                                                        wrapIndex];
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'LINKEDIN_AUTH_Container_p2frkdlp_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Container_backend_call');

                                                                    await currentUserReference!
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'thought_leadership_areas':
                                                                              FieldValue.arrayUnion([
                                                                            wrapExpertiseAreasRecord.expertiseArea
                                                                          ]),
                                                                          'broad_domains':
                                                                              FieldValue.arrayUnion([
                                                                            listViewBroadDomainRecord.broadDomain
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: valueOrDefault<
                                                                          Color>(
                                                                        (currentUserDocument?.thoughtLeadershipAreas?.toList() ?? []).contains(wrapExpertiseAreasRecord.expertiseArea)
                                                                            ? FlutterFlowTheme.of(context).secondary
                                                                            : Colors.transparent,
                                                                        Colors
                                                                            .transparent,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              48.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          8.0,
                                                                          12.0,
                                                                          8.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Text(
                                                                          wrapExpertiseAreasRecord
                                                                              .expertiseArea,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible: (currentUserDocument
                                                        ?.broadDomains
                                                        ?.toList() ??
                                                    [])
                                                .length <
                                            5,
                                        child: AuthUserStreamWidget(
                                          builder: (context) => StreamBuilder<
                                              List<BroadDomainRecord>>(
                                            stream: queryBroadDomainRecord(
                                              queryBuilder: (broadDomainRecord) =>
                                                  broadDomainRecord.whereNotIn(
                                                      'broad_domain',
                                                      (currentUserDocument
                                                              ?.broadDomains
                                                              ?.toList() ??
                                                          [])),
                                              limit: 3,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    child: SpinKitRipple(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 100.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<BroadDomainRecord>
                                                  listViewBroadDomainRecordList =
                                                  snapshot.data!;
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    listViewBroadDomainRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewBroadDomainRecord =
                                                      listViewBroadDomainRecordList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 12.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Text(
                                                            listViewBroadDomainRecord
                                                                .broadDomain,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  ExpertiseAreasRecord>>(
                                                            stream:
                                                                queryExpertiseAreasRecord(
                                                              parent:
                                                                  listViewBroadDomainRecord
                                                                      .reference,
                                                              limit: 10,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        100.0,
                                                                    child:
                                                                        SpinKitRipple(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      size:
                                                                          100.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<ExpertiseAreasRecord>
                                                                  wrapExpertiseAreasRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return Wrap(
                                                                spacing: 4.0,
                                                                runSpacing: 4.0,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                                direction: Axis
                                                                    .horizontal,
                                                                runAlignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                verticalDirection:
                                                                    VerticalDirection
                                                                        .down,
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: List.generate(
                                                                    wrapExpertiseAreasRecordList
                                                                        .length,
                                                                    (wrapIndex) {
                                                                  final wrapExpertiseAreasRecord =
                                                                      wrapExpertiseAreasRecordList[
                                                                          wrapIndex];
                                                                  return InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'LINKEDIN_AUTH_Container_xuuy1erv_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Container_backend_call');

                                                                      await currentUserReference!
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'thought_leadership_areas':
                                                                                FieldValue.arrayUnion([
                                                                              wrapExpertiseAreasRecord.expertiseArea
                                                                            ]),
                                                                            'broad_domains':
                                                                                FieldValue.arrayUnion([
                                                                              listViewBroadDomainRecord.broadDomain
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          (currentUserDocument?.thoughtLeadershipAreas?.toList() ?? []).contains(wrapExpertiseAreasRecord.expertiseArea)
                                                                              ? FlutterFlowTheme.of(context).secondary
                                                                              : Colors.transparent,
                                                                          Colors
                                                                              .transparent,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(48.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          width:
                                                                              2.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Text(
                                                                            wrapExpertiseAreasRecord.expertiseArea,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          if (!(isWeb
                              ? MediaQuery.viewInsetsOf(context).bottom > 0
                              : _isKeyboardVisible))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 24.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'LINKEDIN_AUTH_PAGE_CONTINUE_BTN_ON_TAP');
                                  logFirebaseEvent('Button_navigate_to');

                                  context.pushNamed('brandVoice');
                                },
                                text: 'Continue',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 48.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily),
                                      ),
                                  elevation: 4.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (_model.isLoading ? true : false)
                      wrapWithModel(
                        model: _model.profileLoadingScreenModel,
                        updateCallback: () => setState(() {}),
                        child: ProfileLoadingScreenWidget(
                          loadingText:
                              'Setting up your profile. This usually takes a minute. Hang Tight...',
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
