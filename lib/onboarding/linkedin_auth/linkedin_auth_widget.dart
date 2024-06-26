import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/empty_state_widget.dart';
import '/components/profile_loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'linkedin_auth_model.dart';
export 'linkedin_auth_model.dart';

class LinkedinAuthWidget extends StatefulWidget {
  const LinkedinAuthWidget({
    super.key,
    this.code,
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
      if (valueOrDefault(currentUserDocument?.onboardingStatus, '') !=
          'inProgress') {
        if (currentUserEmail == 'admindemo@inspireai.com') {
          logFirebaseEvent('linkedinAuth_update_page_state');
          _model.isLoading = false;
          setState(() {});
        } else {
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
              authToken:
                  valueOrDefault(currentUserDocument?.linkedinAccess, ''),
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
              logFirebaseEvent('linkedinAuth_firestore_query');
              _model.wannabeUser = await queryPreDefinedUsersRecordOnce(
                queryBuilder: (preDefinedUsersRecord) =>
                    preDefinedUsersRecord.where(
                  'linkedinUrl',
                  isEqualTo:
                      'https://www.linkedin.com/in/${currentUserDocument?.linkedinDetails.vanityName}',
                ),
              );
              if (_model.wannabeUser!.isNotEmpty) {
                logFirebaseEvent('linkedinAuth_update_page_state');
                _model.preDefinedUserDoc = _model.wannabeUser?.first;
                setState(() {});
                logFirebaseEvent('linkedinAuth_backend_call');

                await currentUserReference!.update({
                  ...mapToFirestore(
                    {
                      'thought_leadership_areas':
                          _model.preDefinedUserDoc?.thoughtLeadershipAreas,
                      'thought_leadership_areas_mapping':
                          getThoughtLeadershipAreasMappingListFirestoreData(
                        _model.preDefinedUserDoc?.thoughtLeadershipAreasMapping,
                      ),
                      'broad_domains': _model.preDefinedUserDoc?.broadDomains,
                    },
                  ),
                });
                logFirebaseEvent('linkedinAuth_update_page_state');
                _model.isLoading = false;
                setState(() {});
                logFirebaseEvent('linkedinAuth_backend_call');

                await currentUserReference!.update(createUsersRecordData(
                  onboardingStatus: 'inProgress',
                ));
              } else {
                logFirebaseEvent('linkedinAuth_backend_call');
                _model.getExpertiseWorflow = await ExpertiseOfPersonCall.call(
                  linkedinUrl:
                      'https://www.linkedin.com/in/${currentUserDocument?.linkedinDetails.vanityName}',
                  uid: currentUserUid,
                );

                if ((_model.getExpertiseWorflow?.succeeded ?? true)) {
                  logFirebaseEvent('linkedinAuth_update_page_state');
                  _model.isLoading = false;
                  setState(() {});
                  logFirebaseEvent('linkedinAuth_backend_call');

                  await currentUserReference!.update(createUsersRecordData(
                    onboardingStatus: 'inProgress',
                  ));
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
        }
      } else {
        logFirebaseEvent('linkedinAuth_update_page_state');
        _model.isLoading = false;
        setState(() {});
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

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
    return StreamBuilder<List<BroadDomainRecord>>(
      stream: queryBroadDomainRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 100.0,
                ),
              ),
            ),
          );
        }
        List<BroadDomainRecord> linkedinAuthBroadDomainRecordList =
            snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(72.0),
                child: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  title: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
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
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: const Text('Logout?'),
                                            content: const Text(
                                                'This will log you out of InspireAI completely. Are you sure you want to logout?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: const Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: const Text('Yes, Logout'),
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 4.0),
                                  child: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 22.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    'Back ',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
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
                          Align(
                            alignment: const AlignmentDirectional(0.0, 1.0),
                            child: Text(
                              'Expertise',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.0, 0.0),
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
                  ),
                  actions: const [],
                  centerTitle: false,
                  elevation: 2.0,
                ),
              ),
              body: Align(
                alignment: const AlignmentDirectional(-1.0, -1.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
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
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => AutoSizeText(
                                            'Hey ${currentUserDocument?.linkedinDetails.localizedFirstName}!',
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            minFontSize: 26.0,
                                            style: FlutterFlowTheme.of(context)
                                                .displayMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                          ),
                                        ),
                                      ),
                                      Opacity(
                                        opacity: 0.8,
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Text(
                                            'We\'re gonna inspire the world together ;)',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                        padding: const EdgeInsetsDirectional.fromSTEB(
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
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 12.0),
                                          child: Text(
                                            'Our AI analysed your expertise to be in the following topics. Add more or remove some...',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLargeFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                      Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Builder(
                                            builder: (context) {
                                              final thoughtLeadershipAreas =
                                                  (currentUserDocument
                                                              ?.thoughtLeadershipAreasMapping
                                                              .toList() ??
                                                          [])
                                                      .toList();
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    thoughtLeadershipAreas
                                                        .length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 4.0),
                                                itemBuilder: (context,
                                                    thoughtLeadershipAreasIndex) {
                                                  final thoughtLeadershipAreasItem =
                                                      thoughtLeadershipAreas[
                                                          thoughtLeadershipAreasIndex];
                                                  return Material(
                                                    color: Colors.transparent,
                                                    elevation: 2.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        color:
                                                            Colors.transparent,
                                                        child:
                                                            ExpandableNotifier(
                                                          initialExpanded:
                                                              false,
                                                          child:
                                                              ExpandablePanel(
                                                            header: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      if (Theme.of(context)
                                                                              .brightness ==
                                                                          Brightness
                                                                              .light)
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            linkedinAuthBroadDomainRecordList.where((e) => e.broadDomain == thoughtLeadershipAreasItem.category).toList().first.iconUrl,
                                                                            width:
                                                                                36.0,
                                                                            height:
                                                                                36.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      if (Theme.of(context)
                                                                              .brightness ==
                                                                          Brightness
                                                                              .dark)
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            linkedinAuthBroadDomainRecordList.where((e) => e.broadDomain == thoughtLeadershipAreasItem.category).toList().first.iconUrlDarkMode,
                                                                            width:
                                                                                36.0,
                                                                            height:
                                                                                36.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        thoughtLeadershipAreasItem
                                                                            .category,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .displaySmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            collapsed:
                                                                Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                            ),
                                                            expanded: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        4.0,
                                                                        12.0,
                                                                        12.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final expertiseArea =
                                                                        thoughtLeadershipAreasItem
                                                                            .subCategories
                                                                            .toList();
                                                                    return Wrap(
                                                                      spacing:
                                                                          4.0,
                                                                      runSpacing:
                                                                          4.0,
                                                                      alignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          WrapCrossAlignment
                                                                              .start,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      runAlignment:
                                                                          WrapAlignment
                                                                              .start,
                                                                      verticalDirection:
                                                                          VerticalDirection
                                                                              .down,
                                                                      clipBehavior:
                                                                          Clip.none,
                                                                      children: List.generate(
                                                                          expertiseArea
                                                                              .length,
                                                                          (expertiseAreaIndex) {
                                                                        final expertiseAreaItem =
                                                                            expertiseArea[expertiseAreaIndex];
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            logFirebaseEvent('LINKEDIN_AUTH_Container_dxz8mxil_ON_TAP');
                                                                            logFirebaseEvent('Container_update_page_state');
                                                                            _model.leadershipAreasMapping =
                                                                                (currentUserDocument?.thoughtLeadershipAreasMapping.toList() ?? []).toList().cast<ThoughtLeadershipAreasMappingStruct>();
                                                                            setState(() {});
                                                                            logFirebaseEvent('Container_update_page_state');
                                                                            _model.updateLeadershipAreasMappingAtIndex(
                                                                              thoughtLeadershipAreasIndex,
                                                                              (e) => e
                                                                                ..updateSubCategories(
                                                                                  (e) => e.remove(expertiseAreaItem),
                                                                                ),
                                                                            );
                                                                            setState(() {});
                                                                            logFirebaseEvent('Container_backend_call');

                                                                            await currentUserReference!.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'thought_leadership_areas_mapping': getThoughtLeadershipAreasMappingListFirestoreData(
                                                                                    _model.leadershipAreasMapping,
                                                                                  ),
                                                                                  'thought_leadership_areas': FieldValue.arrayRemove([
                                                                                    expertiseAreaItem
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                30.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              borderRadius: BorderRadius.circular(48.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                width: 2.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 16.0,
                                                                                    height: 16.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Icon(
                                                                                      Icons.close,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 12.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 8.0, 4.0),
                                                                                  child: Container(
                                                                                    decoration: const BoxDecoration(),
                                                                                    child: Text(
                                                                                      expertiseAreaItem,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                            theme:
                                                                ExpandableThemeData(
                                                              tapHeaderToExpand:
                                                                  true,
                                                              tapBodyToExpand:
                                                                  false,
                                                              tapBodyToCollapse:
                                                                  false,
                                                              headerAlignment:
                                                                  ExpandablePanelHeaderAlignment
                                                                      .center,
                                                              hasIcon: true,
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 1.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Text(
                                                      'add more areas',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
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
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 16.0),
                                        child: TextFormField(
                                          controller:
                                              _model.contentURL1TextController,
                                          focusNode:
                                              _model.contentURL1FocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.contentURL1TextController',
                                            const Duration(milliseconds: 2000),
                                            () async {
                                              logFirebaseEvent(
                                                  'LINKEDIN_AUTH_contentURL1_ON_TEXTFIELD_C');
                                              if (_model.contentURL1TextController
                                                          .text !=
                                                      '') {
                                                logFirebaseEvent(
                                                    'contentURL1_algolia_search');
                                                safeSetState(() => _model
                                                        .algoliaSearchResults =
                                                    null);
                                                await ExpertiseAreasCollectionRecord
                                                        .search(
                                                  term: _model
                                                      .contentURL1TextController
                                                      .text,
                                                )
                                                    .then((r) => _model
                                                            .algoliaSearchResults =
                                                        r)
                                                    .onError((_, __) => _model
                                                            .algoliaSearchResults =
                                                        [])
                                                    .whenComplete(
                                                        () => setState(() {}));

                                                if (_model.algoliaSearchResults !=
                                                        null &&
                                                    (_model.algoliaSearchResults)!
                                                        .isNotEmpty) {
                                                  logFirebaseEvent(
                                                      'contentURL1_update_page_state');
                                                  _model.emptySearch = false;
                                                  setState(() {});
                                                } else {
                                                  logFirebaseEvent(
                                                      'contentURL1_wait__delay');
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1000));
                                                  logFirebaseEvent(
                                                      'contentURL1_update_page_state');
                                                  _model.emptySearch = true;
                                                  setState(() {});
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'contentURL1_update_page_state');
                                                _model.emptySearch = false;
                                                setState(() {});
                                              }
                                            },
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText:
                                                'Start typing to search...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
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
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                color: Color(0xFFB2B4B8),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
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
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            suffixIcon: const Icon(
                                              Icons.search_rounded,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 14.0,
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
                                      Stack(
                                        children: [
                                          if (!_model.emptySearch)
                                            Builder(
                                              builder: (context) {
                                                if (_model.contentURL1TextController
                                                            .text ==
                                                        '') {
                                                  return Container(
                                                    decoration: const BoxDecoration(),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final broadDomainList =
                                                            linkedinAuthBroadDomainRecordList
                                                                .toList();
                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              broadDomainList
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              const SizedBox(
                                                                  height: 4.0),
                                                          itemBuilder: (context,
                                                              broadDomainListIndex) {
                                                            final broadDomainListItem =
                                                                broadDomainList[
                                                                    broadDomainListIndex];
                                                            return StreamBuilder<
                                                                List<
                                                                    ExpertiseAreasRecord>>(
                                                              stream:
                                                                  queryExpertiseAreasRecord(
                                                                parent:
                                                                    broadDomainListItem
                                                                        .reference,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        size:
                                                                            100.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<ExpertiseAreasRecord>
                                                                    containerExpertiseAreasRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      1.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          ExpandableNotifier(
                                                                        initialExpanded:
                                                                            true,
                                                                        child:
                                                                            ExpandablePanel(
                                                                          header:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                8.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Stack(
                                                                                  children: [
                                                                                    if (Theme.of(context).brightness == Brightness.light)
                                                                                      ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          broadDomainListItem.iconUrl,
                                                                                          width: 36.0,
                                                                                          height: 36.0,
                                                                                          fit: BoxFit.cover,
                                                                                          errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                            'assets/images/error_image.png',
                                                                                            width: 36.0,
                                                                                            height: 36.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if (Theme.of(context).brightness == Brightness.dark)
                                                                                      ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          broadDomainListItem.iconUrlDarkMode,
                                                                                          width: 36.0,
                                                                                          height: 36.0,
                                                                                          fit: BoxFit.cover,
                                                                                          errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                            'assets/images/error_image.png',
                                                                                            width: 36.0,
                                                                                            height: 36.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                                Flexible(
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        broadDomainListItem.broadDomain,
                                                                                        'BroadDomain',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          collapsed:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                          expanded:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 12.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final expertiseAreaNoSearch = containerExpertiseAreasRecordList.toList();
                                                                                  return Wrap(
                                                                                    spacing: 4.0,
                                                                                    runSpacing: 4.0,
                                                                                    alignment: WrapAlignment.start,
                                                                                    crossAxisAlignment: WrapCrossAlignment.start,
                                                                                    direction: Axis.horizontal,
                                                                                    runAlignment: WrapAlignment.start,
                                                                                    verticalDirection: VerticalDirection.down,
                                                                                    clipBehavior: Clip.none,
                                                                                    children: List.generate(expertiseAreaNoSearch.length, (expertiseAreaNoSearchIndex) {
                                                                                      final expertiseAreaNoSearchItem = expertiseAreaNoSearch[expertiseAreaNoSearchIndex];
                                                                                      return AuthUserStreamWidget(
                                                                                        builder: (context) => InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            logFirebaseEvent('LINKEDIN_AUTH_Container_nc4vam80_ON_TAP');
                                                                                            if (!(currentUserDocument?.thoughtLeadershipAreas.toList() ?? []).contains(expertiseAreaNoSearchItem.expertiseArea)) {
                                                                                              logFirebaseEvent('Container_update_page_state');
                                                                                              _model.leadershipAreasMapping = (currentUserDocument?.thoughtLeadershipAreasMapping.toList() ?? []).toList().cast<ThoughtLeadershipAreasMappingStruct>();
                                                                                              _model.addToAddExpertiseAreaList(expertiseAreaNoSearchItem.expertiseArea);
                                                                                              setState(() {});
                                                                                              if ((currentUserDocument?.broadDomains.toList() ?? []).contains(broadDomainListItem.broadDomain)) {
                                                                                                logFirebaseEvent('Container_update_page_state');
                                                                                                _model.updateLeadershipAreasMappingAtIndex(
                                                                                                  functions.getIndexFromList((currentUserDocument?.broadDomains.toList() ?? []).toList(), broadDomainListItem.broadDomain),
                                                                                                  (e) => e
                                                                                                    ..updateSubCategories(
                                                                                                      (e) => e.add(expertiseAreaNoSearchItem.expertiseArea),
                                                                                                    ),
                                                                                                );
                                                                                                setState(() {});
                                                                                                logFirebaseEvent('Container_backend_call');

                                                                                                await currentUserReference!.update({
                                                                                                  ...mapToFirestore(
                                                                                                    {
                                                                                                      'thought_leadership_areas_mapping': getThoughtLeadershipAreasMappingListFirestoreData(
                                                                                                        _model.leadershipAreasMapping,
                                                                                                      ),
                                                                                                      'thought_leadership_areas': FieldValue.arrayUnion([
                                                                                                        expertiseAreaNoSearchItem.expertiseArea
                                                                                                      ]),
                                                                                                    },
                                                                                                  ),
                                                                                                });
                                                                                              } else {
                                                                                                logFirebaseEvent('Container_update_page_state');
                                                                                                _model.addToLeadershipAreasMapping(ThoughtLeadershipAreasMappingStruct(
                                                                                                  category: broadDomainListItem.broadDomain,
                                                                                                  subCategories: _model.addExpertiseAreaList,
                                                                                                ));
                                                                                                setState(() {});
                                                                                                logFirebaseEvent('Container_backend_call');

                                                                                                await currentUserReference!.update({
                                                                                                  ...mapToFirestore(
                                                                                                    {
                                                                                                      'thought_leadership_areas_mapping': getThoughtLeadershipAreasMappingListFirestoreData(
                                                                                                        _model.leadershipAreasMapping,
                                                                                                      ),
                                                                                                      'thought_leadership_areas': FieldValue.arrayUnion([
                                                                                                        expertiseAreaNoSearchItem.expertiseArea
                                                                                                      ]),
                                                                                                      'broad_domains': FieldValue.arrayUnion([
                                                                                                        broadDomainListItem.broadDomain
                                                                                                      ]),
                                                                                                    },
                                                                                                  ),
                                                                                                });
                                                                                              }

                                                                                              logFirebaseEvent('Container_update_page_state');
                                                                                              _model.addExpertiseAreaList = [];
                                                                                              setState(() {});
                                                                                            }
                                                                                          },
                                                                                          child: Container(
                                                                                            height: 30.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: (currentUserDocument?.thoughtLeadershipAreas.toList() ?? []).contains(expertiseAreaNoSearchItem.expertiseArea) ? FlutterFlowTheme.of(context).secondary : const Color(0x00000000),
                                                                                              borderRadius: BorderRadius.circular(48.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                width: 2.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              children: [
                                                                                                if ((currentUserDocument?.thoughtLeadershipAreas.toList() ?? []).contains(expertiseAreaNoSearchItem.expertiseArea))
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      width: 20.0,
                                                                                                      height: 20.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        shape: BoxShape.circle,
                                                                                                      ),
                                                                                                      child: Icon(
                                                                                                        Icons.close,
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        size: 12.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 8.0, 4.0),
                                                                                                  child: Container(
                                                                                                    decoration: const BoxDecoration(),
                                                                                                    child: Text(
                                                                                                      expertiseAreaNoSearchItem.expertiseArea,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          theme:
                                                                              ExpandableThemeData(
                                                                            tapHeaderToExpand:
                                                                                true,
                                                                            tapBodyToExpand:
                                                                                false,
                                                                            tapBodyToCollapse:
                                                                                false,
                                                                            headerAlignment:
                                                                                ExpandablePanelHeaderAlignment.center,
                                                                            hasIcon:
                                                                                true,
                                                                            iconColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  );
                                                } else {
                                                  return Container(
                                                    decoration: const BoxDecoration(),
                                                    child: StreamBuilder<
                                                        List<
                                                            BroadDomainRecord>>(
                                                      stream:
                                                          queryBroadDomainRecord(
                                                        queryBuilder: (broadDomainRecord) =>
                                                            broadDomainRecord.whereIn(
                                                                'broad_domain',
                                                                _model
                                                                    .algoliaSearchResults
                                                                    ?.map((e) => e
                                                                        .broadDomain
                                                                        ?.id)
                                                                    .withoutNulls
                                                                    .toList()),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        List<BroadDomainRecord>
                                                            listViewBroadDomainRecordList =
                                                            snapshot.data!;
                                                        if (listViewBroadDomainRecordList
                                                            .isEmpty) {
                                                          return const EmptyStateWidget();
                                                        }
                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewBroadDomainRecordList
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              const SizedBox(
                                                                  height: 4.0),
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewBroadDomainRecord =
                                                                listViewBroadDomainRecordList[
                                                                    listViewIndex];
                                                            return Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 1.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  color: Colors
                                                                      .transparent,
                                                                  child:
                                                                      ExpandableNotifier(
                                                                    initialExpanded:
                                                                        true,
                                                                    child:
                                                                        ExpandablePanel(
                                                                      header:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                if (Theme.of(context).brightness == Brightness.light)
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      listViewBroadDomainRecord.iconUrl,
                                                                                      width: 36.0,
                                                                                      height: 36.0,
                                                                                      fit: BoxFit.cover,
                                                                                      errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                        'assets/images/error_image.png',
                                                                                        width: 36.0,
                                                                                        height: 36.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (Theme.of(context).brightness == Brightness.dark)
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      listViewBroadDomainRecord.iconUrlDarkMode,
                                                                                      width: 36.0,
                                                                                      height: 36.0,
                                                                                      fit: BoxFit.cover,
                                                                                      errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                        'assets/images/error_image.png',
                                                                                        width: 36.0,
                                                                                        height: 36.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Flexible(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  listViewBroadDomainRecord.broadDomain,
                                                                                  style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      collapsed:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                      expanded:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              4.0,
                                                                              12.0,
                                                                              12.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              if (_model.algoliaSearchResults?.where((e) => e.broadDomain == listViewBroadDomainRecord.reference).toList() == null) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 100.0,
                                                                                    height: 100.0,
                                                                                    child: SpinKitRipple(
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      size: 100.0,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              final expertiseAreaSearch = _model.algoliaSearchResults?.where((e) => e.broadDomain == listViewBroadDomainRecord.reference).toList().toList() ?? [];
                                                                              return Wrap(
                                                                                spacing: 4.0,
                                                                                runSpacing: 4.0,
                                                                                alignment: WrapAlignment.start,
                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                direction: Axis.horizontal,
                                                                                runAlignment: WrapAlignment.start,
                                                                                verticalDirection: VerticalDirection.down,
                                                                                clipBehavior: Clip.none,
                                                                                children: List.generate(expertiseAreaSearch.length, (expertiseAreaSearchIndex) {
                                                                                  final expertiseAreaSearchItem = expertiseAreaSearch[expertiseAreaSearchIndex];
                                                                                  return AuthUserStreamWidget(
                                                                                    builder: (context) => InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        logFirebaseEvent('LINKEDIN_AUTH_Container_43go6gof_ON_TAP');
                                                                                        if (!(currentUserDocument?.thoughtLeadershipAreas.toList() ?? []).contains(expertiseAreaSearchItem.expertiseArea)) {
                                                                                          logFirebaseEvent('Container_update_page_state');
                                                                                          _model.leadershipAreasMapping = (currentUserDocument?.thoughtLeadershipAreasMapping.toList() ?? []).toList().cast<ThoughtLeadershipAreasMappingStruct>();
                                                                                          _model.addToAddExpertiseAreaList(expertiseAreaSearchItem.expertiseArea);
                                                                                          setState(() {});
                                                                                          if ((currentUserDocument?.broadDomains.toList() ?? []).contains(listViewBroadDomainRecord.broadDomain)) {
                                                                                            logFirebaseEvent('Container_update_page_state');
                                                                                            _model.updateLeadershipAreasMappingAtIndex(
                                                                                              functions.getIndexFromList((currentUserDocument?.broadDomains.toList() ?? []).toList(), listViewBroadDomainRecord.broadDomain),
                                                                                              (e) => e
                                                                                                ..updateSubCategories(
                                                                                                  (e) => e.add(expertiseAreaSearchItem.expertiseArea),
                                                                                                ),
                                                                                            );
                                                                                            setState(() {});
                                                                                            logFirebaseEvent('Container_backend_call');

                                                                                            await currentUserReference!.update({
                                                                                              ...mapToFirestore(
                                                                                                {
                                                                                                  'thought_leadership_areas_mapping': getThoughtLeadershipAreasMappingListFirestoreData(
                                                                                                    _model.leadershipAreasMapping,
                                                                                                  ),
                                                                                                  'thought_leadership_areas': FieldValue.arrayUnion([
                                                                                                    expertiseAreaSearchItem.expertiseArea
                                                                                                  ]),
                                                                                                },
                                                                                              ),
                                                                                            });
                                                                                          } else {
                                                                                            logFirebaseEvent('Container_update_page_state');
                                                                                            _model.addToLeadershipAreasMapping(ThoughtLeadershipAreasMappingStruct(
                                                                                              category: listViewBroadDomainRecord.broadDomain,
                                                                                              subCategories: _model.addExpertiseAreaList,
                                                                                            ));
                                                                                            setState(() {});
                                                                                            logFirebaseEvent('Container_backend_call');

                                                                                            await currentUserReference!.update({
                                                                                              ...mapToFirestore(
                                                                                                {
                                                                                                  'thought_leadership_areas_mapping': getThoughtLeadershipAreasMappingListFirestoreData(
                                                                                                    _model.leadershipAreasMapping,
                                                                                                  ),
                                                                                                  'thought_leadership_areas': FieldValue.arrayUnion([
                                                                                                    expertiseAreaSearchItem.expertiseArea
                                                                                                  ]),
                                                                                                  'broad_domains': FieldValue.arrayUnion([
                                                                                                    listViewBroadDomainRecord.broadDomain
                                                                                                  ]),
                                                                                                },
                                                                                              ),
                                                                                            });
                                                                                          }

                                                                                          logFirebaseEvent('Container_update_page_state');
                                                                                          _model.addExpertiseAreaList = [];
                                                                                          setState(() {});
                                                                                        }
                                                                                      },
                                                                                      child: Container(
                                                                                        height: 30.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: (currentUserDocument?.thoughtLeadershipAreas.toList() ?? []).contains(expertiseAreaSearchItem.expertiseArea) ? FlutterFlowTheme.of(context).secondary : const Color(0x00000000),
                                                                                          borderRadius: BorderRadius.circular(48.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            width: 2.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                          child: Container(
                                                                                            decoration: const BoxDecoration(),
                                                                                            child: Text(
                                                                                              expertiseAreaSearchItem.expertiseArea,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
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
                                                                      ),
                                                                      theme:
                                                                          ExpandableThemeData(
                                                                        tapHeaderToExpand:
                                                                            true,
                                                                        tapBodyToExpand:
                                                                            false,
                                                                        tapBodyToCollapse:
                                                                            false,
                                                                        headerAlignment:
                                                                            ExpandablePanelHeaderAlignment.center,
                                                                        hasIcon:
                                                                            true,
                                                                        iconColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          if (_model.emptySearch)
                                            Stack(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 1.0),
                                              children: [
                                                wrapWithModel(
                                                  model: _model.emptyStateModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: const EmptyStateWidget(
                                                    loadingText:
                                                        'Cant find what you\'re looking for?',
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'LINKEDIN_AUTH_PAGE_+_ADD_NEW_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.addNewArea = true;
                                                      setState(() {});
                                                    },
                                                    text: '+ Add New',
                                                    options: FFButtonOptions(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Colors.transparent,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
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
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
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
                                padding: const EdgeInsetsDirectional.fromSTEB(
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
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
                                    borderSide: const BorderSide(
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
                          child: const ProfileLoadingScreenWidget(
                            loadingText:
                                'Setting up your profile. This usually takes a minute. Hang Tight...',
                          ),
                        ),
                      if (_model.addNewArea)
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                            color: Color(0x6D080808),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, -1.0),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 24.0, 24.0, 24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Form(
                                              key: _model.formKey,
                                              autovalidateMode:
                                                  AutovalidateMode.disabled,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Add New Area',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 24.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Poppins'),
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 4.0),
                                                    child: Text(
                                                      'Domain',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Poppins'),
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                  ),
                                                  FlutterFlowDropDown<String>(
                                                    controller: _model
                                                            .dropDownValueController ??=
                                                        FormFieldController<
                                                            String>(null),
                                                    options:
                                                        linkedinAuthBroadDomainRecordList
                                                            .map((e) =>
                                                                e.broadDomain)
                                                            .toList(),
                                                    onChanged: (val) =>
                                                        setState(() => _model
                                                                .dropDownValue =
                                                            val),
                                                    width: 300.0,
                                                    height: 56.0,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
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
                                                    hintText:
                                                        'Select the domain...',
                                                    icon: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    fillColor: FlutterFlowTheme
                                                            .of(context)
                                                        .secondaryBackground,
                                                    elevation: 2.0,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    borderWidth: 1.5,
                                                    borderRadius: 8.0,
                                                    margin:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 4.0,
                                                                16.0, 4.0),
                                                    hidesUnderline: true,
                                                    isOverButton: true,
                                                    isSearchable: false,
                                                    isMultiSelect: false,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 4.0),
                                                    child: Text(
                                                      'Expertise Area',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Poppins'),
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                  ),
                                                  TextFormField(
                                                    controller:
                                                        _model.textController2,
                                                    focusNode: _model
                                                        .textFieldFocusNode,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Type to add..',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
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
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    validator: _model
                                                        .textController2Validator
                                                        .asValidator(context),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 24.0, 0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'LINKEDIN_AUTH_ADD_EXPERTISE_AREA_BTN_ON_');
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.leadershipAreasMapping =
                                                          (currentUserDocument
                                                                      ?.thoughtLeadershipAreasMapping
                                                                      .toList() ??
                                                                  [])
                                                              .toList()
                                                              .cast<
                                                                  ThoughtLeadershipAreasMappingStruct>();
                                                      _model.addToAddExpertiseAreaList(
                                                          _model.textController2
                                                              .text);
                                                      setState(() {});
                                                      if ((currentUserDocument
                                                                  ?.broadDomains
                                                                  .toList() ??
                                                              [])
                                                          .contains(_model
                                                              .dropDownValue)) {
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model
                                                            .updateLeadershipAreasMappingAtIndex(
                                                          functions.getIndexFromList(
                                                              (currentUserDocument
                                                                          ?.broadDomains
                                                                          .toList() ??
                                                                      [])
                                                                  .toList(),
                                                              _model
                                                                  .dropDownValue!),
                                                          (e) => e
                                                            ..subCategories = _model
                                                                .addExpertiseAreaList
                                                                .toList(),
                                                        );
                                                        setState(() {});
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'thought_leadership_areas_mapping':
                                                                  getThoughtLeadershipAreasMappingListFirestoreData(
                                                                _model
                                                                    .leadershipAreasMapping,
                                                              ),
                                                              'thought_leadership_areas':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                _model
                                                                    .textController2
                                                                    .text
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      } else {
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model.addToLeadershipAreasMapping(
                                                            ThoughtLeadershipAreasMappingStruct(
                                                          category: _model
                                                              .dropDownValue,
                                                          subCategories: _model
                                                              .addExpertiseAreaList,
                                                        ));
                                                        setState(() {});
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        await currentUserReference!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'thought_leadership_areas_mapping':
                                                                  getThoughtLeadershipAreasMappingListFirestoreData(
                                                                _model
                                                                    .leadershipAreasMapping,
                                                              ),
                                                              'thought_leadership_areas':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                _model
                                                                    .textController2
                                                                    .text
                                                              ]),
                                                              'broad_domains':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                _model
                                                                    .dropDownValue
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                      }

                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.addNewArea = false;
                                                      _model.addExpertiseAreaList =
                                                          [];
                                                      setState(() {});
                                                      logFirebaseEvent(
                                                          'Button_clear_text_fields_pin_codes');
                                                      setState(() {
                                                        _model.textController2
                                                            ?.clear();
                                                      });
                                                    },
                                                    text: 'Add expertise area',
                                                    options: FFButtonOptions(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 44.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
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
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          24.0, 0.0, 24.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'LINKEDIN_AUTH_PAGE_CANCEL_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_update_page_state');
                                                      _model.addNewArea = false;
                                                      setState(() {});
                                                    },
                                                    text: 'Cancel',
                                                    options: FFButtonOptions(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 48.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: const Color(0x00FFFFFF),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: const Color(
                                                                    0xFF111111),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 0.0,
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
