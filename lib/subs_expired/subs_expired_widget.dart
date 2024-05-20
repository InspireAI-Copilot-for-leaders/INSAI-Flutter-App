import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'subs_expired_model.dart';
export 'subs_expired_model.dart';

class SubsExpiredWidget extends StatefulWidget {
  const SubsExpiredWidget({super.key});

  @override
  State<SubsExpiredWidget> createState() => _SubsExpiredWidgetState();
}

class _SubsExpiredWidgetState extends State<SubsExpiredWidget> {
  late SubsExpiredModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubsExpiredModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'subsExpired'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SUBS_EXPIRED_subsExpired_ON_INIT_STATE');
      if (valueOrDefault(currentUserDocument?.accessType, '') !=
          'paidExpired') {
        logFirebaseEvent('subsExpired_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          accessType: 'paidExpired',
        ));
      }
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderRadius: 30.0,
                    borderWidth: 2.0,
                    buttonSize: 44.0,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 25.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('SUBS_EXPIRED_close_rounded_ICN_ON_TAP');
                      logFirebaseEvent('IconButton_alert_dialog');
                      var confirmDialogResponse = await showDialog<bool>(
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
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: const Text('Yes, Logout'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        logFirebaseEvent('IconButton_auth');
                        GoRouter.of(context).prepareAuthEvent(true);
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();

                        logFirebaseEvent('IconButton_navigate_to');

                        context.goNamedAuth(
                          'LandingPage',
                          context.mounted,
                          ignoreRedirect: true,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: 140.0,
              height: 140.0,
              decoration: BoxDecoration(
                color: const Color(0x2EDC3545),
                shape: BoxShape.circle,
                border: Border.all(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
              ),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Icon(
                  Icons.money_off_csred_rounded,
                  color: FlutterFlowTheme.of(context).error,
                  size: 60.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: Text(
                'Subscription Expired!',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Outfit',
                      color: FlutterFlowTheme.of(context).error,
                      fontSize: 36.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
                    ),
              ),
            ),
            SizedBox(
              width: 1.0,
              height: 1.0,
              child: custom_widgets.BackButtonOverrider(
                width: 1.0,
                height: 1.0,
                onBack: () async {
                  logFirebaseEvent('SUBS_EXPIRED_Container_77sz2g0q_CALLBACK');
                  logFirebaseEvent('BackButtonOverrider_alert_dialog');
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('Logout?'),
                            content: const Text(
                                'This will log you out of InspireAI completely. Are you sure you want to logout?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: const Text('Yes, Logout'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    logFirebaseEvent('BackButtonOverrider_auth');
                    GoRouter.of(context).prepareAuthEvent(true);
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();

                    logFirebaseEvent('BackButtonOverrider_navigate_to');

                    context.goNamedAuth(
                      'LandingPage',
                      context.mounted,
                      ignoreRedirect: true,
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 24.0, 0.0),
              child: Text(
                'Your subscription has expired. Your access to InspireAI has been revoked. Renew your subscription to continue using the power of cutting edge-AI!',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: const Color(0xFF57636C),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      useGoogleFonts:
                          GoogleFonts.asMap().containsKey('Plus Jakarta Sans'),
                    ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 48.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'SUBS_EXPIRED_RECHECK_STATUS_BTN_ON_TAP');
                            logFirebaseEvent('Button_revenue_cat');
                            final isEntitled = await revenue_cat
                                    .isEntitled('premium-full-access') ??
                                false;
                            if (!isEntitled) {
                              await revenue_cat.loadOfferings();
                            }

                            if (isEntitled) {
                              logFirebaseEvent('Button_backend_call');
                              unawaited(
                                () async {
                                  await currentUserReference!
                                      .update(createUsersRecordData(
                                    accessType: 'paidGranted',
                                  ));
                                }(),
                              );
                              logFirebaseEvent('Button_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Subscription Reactivated!'),
                                    content: const Text(
                                        'Your subscription has been renewed. Now you can continue using next gen AI.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Continue'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed('dashboard');
                            } else {
                              logFirebaseEvent('Button_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Subscription Inactive!'),
                                    content: const Text(
                                        'Your subscription has expired. Renew your subscription to continue using the power of cutting edge-AI!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          text: 'Recheck Status',
                          options: FFButtonOptions(
                            width: 300.0,
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.transparent,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyLargeFamily,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyLargeFamily),
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'SUBS_EXPIRED_MANAGE_SUBSRIPTION_BTN_ON_T');
                          logFirebaseEvent('Button_launch_u_r_l');
                          await launchURL(isiOS
                              ? 'https://apps.apple.com/account/subscriptions'
                              : 'https://play.google.com/store/account/subscriptions');
                        },
                        text: 'Manage Subsription',
                        options: FFButtonOptions(
                          width: 300.0,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyLargeFamily,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyLargeFamily),
                              ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(40.0),
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
    );
  }
}
