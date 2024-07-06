import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'camapign_details_model.dart';
export 'camapign_details_model.dart';

class CamapignDetailsWidget extends StatefulWidget {
  const CamapignDetailsWidget({
    super.key,
    required this.campaignID,
    this.campaignTitle,
  });

  final String? campaignID;
  final String? campaignTitle;

  @override
  State<CamapignDetailsWidget> createState() => _CamapignDetailsWidgetState();
}

class _CamapignDetailsWidgetState extends State<CamapignDetailsWidget>
    with TickerProviderStateMixin {
  late CamapignDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CamapignDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'camapignDetails'});
    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 30.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 40.0),
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
    return StreamBuilder<List<CampaignRecord>>(
      stream: queryCampaignRecord(
        parent: currentUserReference,
        queryBuilder: (campaignRecord) => campaignRecord.where(
          'campaign_id',
          isEqualTo: widget.campaignID,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        List<CampaignRecord> camapignDetailsCampaignRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('CAMAPIGN_DETAILS_arrow_back_rounded_ICN_');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              actions: const [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 4.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.campaignTitle,
                              'Campaign',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineMediumFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 12.0),
                          child: Builder(
                            builder: (context) {
                              final camapignDetailsVar =
                                  camapignDetailsCampaignRecordList.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: camapignDetailsVar.length,
                                itemBuilder:
                                    (context, camapignDetailsVarIndex) {
                                  final camapignDetailsVarItem =
                                      camapignDetailsVar[
                                          camapignDetailsVarIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'CAMAPIGN_DETAILS_Container_ocxohmtc_ON_T');
                                        if (camapignDetailsVarItem.status !=
                                            'Pending') {
                                          if (camapignDetailsVarItem.status ==
                                              'scheduled') {
                                            logFirebaseEvent(
                                                'Container_backend_call');
                                            _model.scheduleddoc =
                                                await ScheduledPostsRecord
                                                    .getDocumentOnce(
                                                        camapignDetailsVarItem
                                                            .scheduledPostRef!);
                                            logFirebaseEvent(
                                                'Container_navigate_to');

                                            context.pushNamed(
                                              'viewScheduledPost',
                                              queryParameters: {
                                                'postDocument': serializeParam(
                                                  _model.scheduleddoc,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'postDocument':
                                                    _model.scheduleddoc,
                                              },
                                            );
                                          } else {
                                            logFirebaseEvent(
                                                'Container_navigate_to');

                                            context.pushNamed(
                                              'viewOrEditCampaignPost',
                                              queryParameters: {
                                                'postRef': serializeParam(
                                                  camapignDetailsVarItem
                                                      .reference,
                                                  ParamType.DocumentReference,
                                                ),
                                                'postTitle': serializeParam(
                                                  widget.campaignTitle,
                                                  ParamType.String,
                                                ),
                                                'indexInList': serializeParam(
                                                  camapignDetailsVarIndex,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        }

                                        setState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: const Color(0xFFE0E3E7),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      () {
                                                        if (camapignDetailsVarItem
                                                                .type ==
                                                            'domain_thought_leadership') {
                                                          return camapignDetailsVarItem
                                                              .expertiseArea;
                                                        } else if (camapignDetailsVarItem
                                                                .type ==
                                                            'trends_commentry') {
                                                          return camapignDetailsVarItem
                                                              .domain;
                                                        } else {
                                                          return camapignDetailsVarItem
                                                              .companyName;
                                                        }
                                                      }(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .accent2,
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
                                                  Container(
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        2.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .local_fire_department_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .accent2,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            () {
                                                              if (camapignDetailsVarItem
                                                                      .type ==
                                                                  'domain_thought_leadership') {
                                                                return 'Domain Related';
                                                              } else if (camapignDetailsVarItem
                                                                      .type ==
                                                                  'trends_commentry') {
                                                                return 'Trending Event';
                                                              } else {
                                                                return 'Company Related';
                                                              }
                                                            }(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      12.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              if (camapignDetailsVarItem
                                                      .status !=
                                                  'Pending')
                                                Text(
                                                  camapignDetailsVarItem
                                                      .posts.first.topic,
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            const Color(0xFF0F1113),
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Outfit'),
                                                      ),
                                                ),
                                              if (camapignDetailsVarItem
                                                      .status ==
                                                  'Pending')
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Writing your post...',
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color: const Color(
                                                                  0xFF15161E),
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Outfit'),
                                                            ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 40.0,
                                                        height: 40.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Lottie.asset(
                                                          'assets/lottie_animations/Animation_-_1705682770212_(1).json',
                                                          width: 150.0,
                                                          height: 130.0,
                                                          fit: BoxFit.cover,
                                                          animate: true,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              const Divider(
                                                height: 24.0,
                                                thickness: 1.0,
                                                color: Color(0xFFE0E3E7),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  if (camapignDetailsVarItem
                                                          .status ==
                                                      'scheduled')
                                                    Text(
                                                      'Due',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: const Color(
                                                                0xFF0F1113),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            useGoogleFonts:
                                                                GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Plus Jakarta Sans'),
                                                          ),
                                                    ),
                                                  if (camapignDetailsVarItem
                                                          .status ==
                                                      'scheduled')
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          dateTimeFormat(
                                                              'MMMEd',
                                                              camapignDetailsVarItem
                                                                  .scheduledTime!),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: const Color(
                                                                    0xFF827AE1),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        'Plus Jakarta Sans'),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  Flexible(
                                                    child: Container(
                                                      height: 32.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            const Color(0xFF81E1D7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(32.0),
                                                      ),
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Text(
                                                        camapignDetailsVarItem
                                                                    .status ==
                                                                'scheduled'
                                                            ? 'Scheduled'
                                                            : 'To be Approved',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Plus Jakarta Sans',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              useGoogleFonts: GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Plus Jakarta Sans'),
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation1']!),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  StreamBuilder<List<CampaignRecord>>(
                    stream: queryCampaignRecord(
                      parent: currentUserReference,
                      queryBuilder: (campaignRecord) => campaignRecord
                          .where(
                            'campaign_id',
                            isEqualTo: widget.campaignID,
                          )
                          .where(
                            'status',
                            isEqualTo: 'Pending',
                          ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
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
                      List<CampaignRecord> containerCampaignRecordList =
                          snapshot.data!;
                      return Container(
                        decoration: const BoxDecoration(),
                        child: Visibility(
                          visible: containerCampaignRecordList.isNotEmpty,
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 4.0,
                              sigmaY: 4.0,
                            ),
                            child: Stack(
                              children: [
                                Opacity(
                                  opacity: 0.6,
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 50.0, 0.0, 0.0),
                                        child: Lottie.asset(
                                          'assets/lottie_animations/Animation_-_1719495373419.json',
                                          width: 300.0,
                                          height: 300.0,
                                          fit: BoxFit.contain,
                                          animate: true,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      child: Text(
                                        'Creating your campaign...\nTakes about 2-3 min',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
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
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
