import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'linkedin_connect_model.dart';
export 'linkedin_connect_model.dart';

class LinkedinConnectWidget extends StatefulWidget {
  const LinkedinConnectWidget({
    super.key,
    this.connectSuccess,
  });

  final bool? connectSuccess;

  @override
  State<LinkedinConnectWidget> createState() => _LinkedinConnectWidgetState();
}

class _LinkedinConnectWidgetState extends State<LinkedinConnectWidget> {
  late LinkedinConnectModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LinkedinConnectModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'linkedinConnect'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LINKEDIN_CONNECT_linkedinConnect_ON_INIT');
      logFirebaseEvent('linkedinConnect_backend_call');
      unawaited(
        () async {
          await currentUserReference!.update(createUsersRecordData(
            uid: currentUserReference?.id,
          ));
        }(),
      );
      if (!widget.connectSuccess!) {
        logFirebaseEvent('linkedinConnect_alert_dialog');
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('Failed!'),
              content: const Text('LinkedIn Authentication Failed'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('Try Again'),
                ),
              ],
            );
          },
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
          backgroundColor: Colors.white,
          body: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 670.0,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? 'assets/images/backgroundDark.png'
                        : 'assets/images/backgroundLight.png',
                  ).image,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'LINKEDIN_CONNECT_arrow_back_ios_rounded_');
                                logFirebaseEvent('IconButton_navigate_back');
                                context.safePop();
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 36.0, 0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: Image.asset(
                              Theme.of(context).brightness == Brightness.dark
                                  ? 'assets/images/InspireAI_LOGO2_(1).png'
                                  : 'assets/images/InspireAI_LOGO2_(2).png',
                              width: 200.0,
                              height: 32.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 36.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: AutoSizeText(
                                'Externalize your thought leadership.',
                                textAlign: TextAlign.start,
                                maxLines: 3,
                                minFontSize: 30.0,
                                style: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 36.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Montserrat'),
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: AutoSizeText(
                                'To be able to schedule or post to Linkedin, we need you to connect your LinkedIn account.',
                                maxLines: 3,
                                minFontSize: 14.0,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 16.0,
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
                          Divider(
                            thickness: 1.0,
                            indent: 8.0,
                            endIndent: 8.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 16.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'LINKEDIN_CONNECT_CONNECT_LINKED_IN_BTN_O');
                                if (currentUserEmail ==
                                    'admindemo@inspireai.com') {
                                  logFirebaseEvent('Button_firestore_query');
                                  _model.yesss = await queryUsersRecordOnce(
                                    queryBuilder: (usersRecord) =>
                                        usersRecord.where(
                                      'email',
                                      isEqualTo: 'admindemo',
                                    ),
                                    singleRecord: true,
                                  ).then((s) => s.firstOrNull);
                                  logFirebaseEvent('Button_backend_call');

                                  await currentUserReference!.update({
                                    ...createUsersRecordData(
                                      linkedinDetails:
                                          updateLinkedinDetailsAuthStruct(
                                        _model.yesss?.linkedinDetails,
                                        clearUnsetFields: false,
                                      ),
                                      linkedinAccess:
                                          _model.yesss?.linkedinAccess,
                                      linkedinUrn: _model.yesss?.linkedinUrn,
                                      followers: _model.yesss?.followers,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'thought_leadership_areas': _model
                                            .yesss?.thoughtLeadershipAreas,
                                        'broad_domains':
                                            _model.yesss?.broadDomains,
                                        'thought_leadership_areas_mapping':
                                            getThoughtLeadershipAreasMappingListFirestoreData(
                                          _model.yesss
                                              ?.thoughtLeadershipAreasMapping,
                                        ),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Button_navigate_to');

                                  context.goNamed('linkedinAuth');
                                } else {
                                  logFirebaseEvent('Button_launch_u_r_l');
                                  await launchURL(
                                      'https://www.linkedin.com/oauth/v2/authorization?response_type=code&client_id=867aib47yndmjx&redirect_uri=https://us-central1-inspire-ai-40690.cloudfunctions.net/linkedinAuth&scope=r_basicprofile%20w_member_social%20w_member_social_feed%20r_1st_connections_size');
                                }

                                safeSetState(() {});
                              },
                              text: 'Connect LinkedIn',
                              icon: FaIcon(
                                FontAwesomeIcons.linkedinIn,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 60.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 12.0, 0.0),
                                color: const Color(0x00FFFFFF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Montserrat'),
                                    ),
                                elevation: 0.0,
                                borderSide: const BorderSide(
                                  width: 0.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
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
      ),
    );
  }
}
