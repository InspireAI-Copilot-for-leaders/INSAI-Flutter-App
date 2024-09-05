import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/profile_loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
            linkedinConnected: true,
          ));
          logFirebaseEvent('linkedinAuth_backend_call');
          _model.apiResult4vk =
              await LinkedInDataGroup.linkedinProfilePictureCall.call(
            authToken: valueOrDefault(currentUserDocument?.linkedinAccess, ''),
          );

          if ((_model.apiResult4vk?.succeeded ?? true)) {
            logFirebaseEvent('linkedinAuth_backend_call');

            await currentUserReference!.update({
              ...createUsersRecordData(
                linkedinUrn:
                    'urn:li:person:${currentUserDocument?.linkedinDetails.id}',
              ),
              ...mapToFirestore(
                {
                  'profilePictureLinks': LinkedInDataGroup
                      .linkedinProfilePictureCall
                      .profilePictureList(
                    (_model.apiResult4vk?.jsonBody ?? ''),
                  ),
                },
              ),
            });
          }
          logFirebaseEvent('linkedinAuth_backend_call');
          _model.apiResultzfw =
              await LinkedInDataGroup.firstDegreeConnectionsSizeCall.call(
            personUrn: valueOrDefault(currentUserDocument?.linkedinUrn, ''),
            authToken: valueOrDefault(currentUserDocument?.linkedinAccess, ''),
          );

          if ((_model.apiResultzfw?.succeeded ?? true)) {
            logFirebaseEvent('linkedinAuth_backend_call');

            await currentUserReference!.update(createUsersRecordData(
              firstDegreeConnectionsSize:
                  LinkedInDataGroup.firstDegreeConnectionsSizeCall.connects(
                (_model.apiResultzfw?.jsonBody ?? ''),
              ),
            ));
          }
          logFirebaseEvent('linkedinAuth_update_page_state');
          _model.isLoading = false;
          safeSetState(() {});
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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(72.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Stack(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Text(
                          'Connect Linkedin',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
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
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 36.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: 140.0,
                                      height: 140.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          (currentUserDocument
                                                          ?.profilePictureLinks
                                                          .toList() ??
                                                      [])
                                                  .isNotEmpty
                                              ? (currentUserDocument
                                                          ?.profilePictureLinks
                                                          .toList() ??
                                                      [])
                                                  .first
                                              : 'https://ofcan.org/wp-content/uploads/2021/01/100-1006688_headshot-silhouette-placeholder-image-person-free-1.png',
                                          'https://ofcan.org/wp-content/uploads/2021/01/100-1006688_headshot-silhouette-placeholder-image-person-free-1.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      '${currentUserDocument?.linkedinDetails.localizedFirstName} ${currentUserDocument?.linkedinDetails.localizedLastName}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 28.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      valueOrDefault<String>(
                                        currentUserDocument?.linkedinDetails
                                            .localizedHeadline,
                                        'Headline',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 36.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'LINKEDIN_AUTH_PAGE_CONTINUE_BTN_ON_TAP');
                              logFirebaseEvent('Button_navigate_to');

                              context.goNamed('allPostsOverview');
                            },
                            text: 'Continue',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 48.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleSmallFamily),
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_model.isLoading ? true : false)
                    wrapWithModel(
                      model: _model.profileLoadingScreenModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const ProfileLoadingScreenWidget(
                        loadingText:
                            'Connecting your profile. This usually takes a minute. Hang Tight...',
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
