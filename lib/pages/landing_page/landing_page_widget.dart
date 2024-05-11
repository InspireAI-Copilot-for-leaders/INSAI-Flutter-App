import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'landing_page_model.dart';
export 'landing_page_model.dart';

class LandingPageWidget extends StatefulWidget {
  const LandingPageWidget({super.key});

  @override
  State<LandingPageWidget> createState() => _LandingPageWidgetState();
}

class _LandingPageWidgetState extends State<LandingPageWidget>
    with TickerProviderStateMixin {
  late LandingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LandingPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'LandingPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LANDING_LandingPage_ON_INIT_STATE');
      logFirebaseEvent('LandingPage_widget_animation');
      if (animationsMap['imageOnActionTriggerAnimation'] != null) {
        animationsMap['imageOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
      logFirebaseEvent('LandingPage_widget_animation');
      if (animationsMap['buttonOnActionTriggerAnimation'] != null) {
        animationsMap['buttonOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
      logFirebaseEvent('LandingPage_widget_animation');
      if (animationsMap['pageViewOnActionTriggerAnimation'] != null) {
        await animationsMap['pageViewOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
    });

    animationsMap.addAll({
      'imageOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: const Offset(2.5, 2.5),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: const Offset(-100.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'pageViewOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 600.ms),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 600.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 600.0.ms,
            duration: 200.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 820.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 820.0.ms,
            duration: 420.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 820.0.ms,
            duration: 420.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 820.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 960.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 960.0.ms,
            duration: 420.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 960.0.ms,
            duration: 420.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 960.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1100.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 1100.0.ms,
            duration: 420.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 1100.0.ms,
            duration: 420.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 1100.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1240.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 1240.0.ms,
            duration: 420.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 1240.0.ms,
            duration: 420.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 1240.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1380.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 1380.0.ms,
            duration: 420.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 1380.0.ms,
            duration: 420.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 1380.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 420.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 420.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 340.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 340.0.ms,
            duration: 420.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 340.0.ms,
            duration: 420.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 340.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 480.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 480.0.ms,
            duration: 420.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 480.0.ms,
            duration: 420.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 480.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 620.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 620.0.ms,
            duration: 420.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 620.0.ms,
            duration: 420.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 620.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 760.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 760.0.ms,
            duration: 420.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 760.0.ms,
            duration: 420.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 760.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 420.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 420.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnActionTriggerAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 340.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 340.0.ms,
            duration: 420.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 340.0.ms,
            duration: 420.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 340.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnActionTriggerAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 480.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 480.0.ms,
            duration: 420.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 480.0.ms,
            duration: 420.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 480.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnActionTriggerAnimation9': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 620.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 620.0.ms,
            duration: 420.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 620.0.ms,
            duration: 420.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 620.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnActionTriggerAnimation10': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 760.ms),
          MoveEffect(
            curve: Curves.easeOut,
            delay: 760.0.ms,
            duration: 420.0.ms,
            begin: const Offset(100.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 760.0.ms,
            duration: 420.0.ms,
            begin: const Offset(10.0, 10.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 760.0.ms,
            duration: 420.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: const Offset(2.5, 2.5),
            end: const Offset(1.0, 1.0),
          ),
          FadeEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          BlurEffect(
            curve: Curves.easeOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primary,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 88.0, 24.0, 0.0),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'assets/images/InspireAI_LOGO2_(1).png'
                      : 'assets/images/InspireAI_LOGO2_(1).png',
                  width: 161.0,
                  height: 25.0,
                  fit: BoxFit.contain,
                  alignment: const Alignment(-1.0, 0.0),
                ),
              ).animateOnActionTrigger(
                animationsMap['imageOnActionTriggerAnimation']!,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              child: Container(
                height: 360.0,
                decoration: const BoxDecoration(),
                child: SizedBox(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        onPageChanged: (_) async {
                          logFirebaseEvent(
                              'LANDING_PageView_txb6kkdt_ON_WIDGET_SWIP');
                          if (_model.pageViewCurrentIndex == 1) {
                            logFirebaseEvent('PageView_widget_animation');
                            if (animationsMap[
                                    'textOnActionTriggerAnimation1'] !=
                                null) {
                              animationsMap['textOnActionTriggerAnimation1']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            logFirebaseEvent('PageView_widget_animation');
                            if (animationsMap[
                                    'textOnActionTriggerAnimation2'] !=
                                null) {
                              animationsMap['textOnActionTriggerAnimation2']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            logFirebaseEvent('PageView_widget_animation');
                            if (animationsMap[
                                    'textOnActionTriggerAnimation3'] !=
                                null) {
                              animationsMap['textOnActionTriggerAnimation3']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            logFirebaseEvent('PageView_widget_animation');
                            if (animationsMap[
                                    'textOnActionTriggerAnimation4'] !=
                                null) {
                              animationsMap['textOnActionTriggerAnimation4']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            logFirebaseEvent('PageView_widget_animation');
                            if (animationsMap[
                                    'textOnActionTriggerAnimation5'] !=
                                null) {
                              animationsMap['textOnActionTriggerAnimation5']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                          } else {
                            if (_model.pageViewCurrentIndex == 2) {
                              logFirebaseEvent('PageView_widget_animation');
                              if (animationsMap[
                                      'textOnActionTriggerAnimation6'] !=
                                  null) {
                                animationsMap['textOnActionTriggerAnimation6']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                              logFirebaseEvent('PageView_widget_animation');
                              if (animationsMap[
                                      'textOnActionTriggerAnimation7'] !=
                                  null) {
                                animationsMap['textOnActionTriggerAnimation7']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                              logFirebaseEvent('PageView_widget_animation');
                              if (animationsMap[
                                      'textOnActionTriggerAnimation8'] !=
                                  null) {
                                animationsMap['textOnActionTriggerAnimation8']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                              logFirebaseEvent('PageView_widget_animation');
                              if (animationsMap[
                                      'textOnActionTriggerAnimation9'] !=
                                  null) {
                                animationsMap['textOnActionTriggerAnimation9']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                              logFirebaseEvent('PageView_widget_animation');
                              if (animationsMap[
                                      'textOnActionTriggerAnimation10'] !=
                                  null) {
                                animationsMap['textOnActionTriggerAnimation10']!
                                    .controller
                                    .forward(from: 0.0);
                              }
                            }
                          }
                        },
                        scrollDirection: Axis.horizontal,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 30.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Opacity(
                                    opacity: 0.4,
                                    child: AutoSizeText(
                                      'Inspire with the power of',
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 40.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Montserrat'),
                                          ),
                                      minFontSize: 30.0,
                                    ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation1']!),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: AutoSizeText(
                                      'effortless,',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 40.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Montserrat'),
                                          ),
                                      minFontSize: 30.0,
                                    ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation2']!),
                                  ),
                                  Opacity(
                                    opacity: 0.8,
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: AutoSizeText(
                                        'effective and,',
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .displayLarge
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontSize: 40.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Montserrat'),
                                            ),
                                        minFontSize: 30.0,
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation3']!),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.6,
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: AutoSizeText(
                                        'empowering',
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .displayLarge
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontSize: 40.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Montserrat'),
                                            ),
                                        minFontSize: 30.0,
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation4']!),
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.6,
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: AutoSizeText(
                                        'storytelling.',
                                        textAlign: TextAlign.start,
                                        maxLines: 1,
                                        style: FlutterFlowTheme.of(context)
                                            .displayLarge
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontSize: 40.0,
                                              letterSpacing: 1.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Montserrat'),
                                            ),
                                        minFontSize: 30.0,
                                      ).animateOnPageLoad(animationsMap[
                                          'textOnPageLoadAnimation5']!),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Opacity(
                                  opacity: 0.4,
                                  child: AutoSizeText(
                                    'Transform your ideas into',
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .displayLarge
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 40.0,
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Montserrat'),
                                        ),
                                    minFontSize: 30.0,
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'textOnActionTriggerAnimation1']!,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: AutoSizeText(
                                    'authentic',
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .displayLarge
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 40.0,
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Montserrat'),
                                        ),
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'textOnActionTriggerAnimation2']!,
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.8,
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: AutoSizeText(
                                      'narratives with',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 40.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Montserrat'),
                                          ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'textOnActionTriggerAnimation3']!,
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.6,
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: AutoSizeText(
                                      'cutting-edge',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 40.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Montserrat'),
                                          ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'textOnActionTriggerAnimation4']!,
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.6,
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: AutoSizeText(
                                      'technology.',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 40.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Montserrat'),
                                          ),
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'textOnActionTriggerAnimation5']!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(-1.0, -1.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Opacity(
                                  opacity: 0.4,
                                  child: AutoSizeText(
                                    'Harness the future of',
                                    textAlign: TextAlign.start,
                                    maxLines: 2,
                                    style: FlutterFlowTheme.of(context)
                                        .displayLarge
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 40.0,
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Montserrat'),
                                        ),
                                    minFontSize: 30.0,
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'textOnActionTriggerAnimation6']!,
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(-1.0, 0.0),
                                  child: AutoSizeText(
                                    'content',
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    style: FlutterFlowTheme.of(context)
                                        .displayLarge
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 40.0,
                                          letterSpacing: 1.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Montserrat'),
                                        ),
                                    minFontSize: 30.0,
                                  ).animateOnActionTrigger(
                                    animationsMap[
                                        'textOnActionTriggerAnimation7']!,
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.8,
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: AutoSizeText(
                                      'creation for',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 40.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Montserrat'),
                                          ),
                                      minFontSize: 30.0,
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'textOnActionTriggerAnimation8']!,
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.6,
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: AutoSizeText(
                                      'unmatched',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 40.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Montserrat'),
                                          ),
                                      minFontSize: 30.0,
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'textOnActionTriggerAnimation9']!,
                                    ),
                                  ),
                                ),
                                Opacity(
                                  opacity: 0.6,
                                  child: Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: AutoSizeText(
                                      'engagement.',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .displayLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 40.0,
                                            letterSpacing: 1.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Montserrat'),
                                          ),
                                      minFontSize: 30.0,
                                    ).animateOnActionTrigger(
                                      animationsMap[
                                          'textOnActionTriggerAnimation10']!,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            count: 3,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) async {
                              await _model.pageViewController!.animateToPage(
                                i,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              setState(() {});
                            },
                            effect: smooth_page_indicator.ExpandingDotsEffect(
                              expansionFactor: 3.0,
                              spacing: 8.0,
                              radius: 16.0,
                              dotWidth: 10.0,
                              dotHeight: 10.0,
                              dotColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              activeDotColor:
                                  FlutterFlowTheme.of(context).alternate,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ).animateOnActionTrigger(
                  animationsMap['pageViewOnActionTriggerAnimation']!,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 32.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('LANDING_PAGE_PAGE_GET_STARTED_BTN_ON_TAP');
                logFirebaseEvent('Button_navigate_to');

                context.pushNamed(
                  'auth_signupOrLogin',
                  extra: <String, dynamic>{
                    kTransitionInfoKey: const TransitionInfo(
                      hasTransition: true,
                      transitionType: PageTransitionType.fade,
                      duration: Duration(milliseconds: 500),
                    ),
                  },
                );
              },
              text: 'Get Started',
              options: FFButtonOptions(
                width: double.infinity,
                height: 48.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).alternate,
                textStyle: FlutterFlowTheme.of(context).labelMedium.override(
                      fontFamily:
                          FlutterFlowTheme.of(context).labelMediumFamily,
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).labelMediumFamily),
                    ),
                elevation: 3.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(24.0),
              ),
            ).animateOnActionTrigger(
              animationsMap['buttonOnActionTriggerAnimation']!,
            ),
          ),
        ],
      ),
    );
  }
}
