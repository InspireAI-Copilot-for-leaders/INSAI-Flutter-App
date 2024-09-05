import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/post_content_options_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view_or_edit_campaign_post_model.dart';
export 'view_or_edit_campaign_post_model.dart';

class ViewOrEditCampaignPostWidget extends StatefulWidget {
  const ViewOrEditCampaignPostWidget({
    super.key,
    required this.postRef,
    required this.postTitle,
    this.indexInList,
    this.scheduledTime,
  });

  final DocumentReference? postRef;
  final String? postTitle;
  final int? indexInList;
  final DateTime? scheduledTime;

  @override
  State<ViewOrEditCampaignPostWidget> createState() =>
      _ViewOrEditCampaignPostWidgetState();
}

class _ViewOrEditCampaignPostWidgetState
    extends State<ViewOrEditCampaignPostWidget> with TickerProviderStateMixin {
  late ViewOrEditCampaignPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewOrEditCampaignPostModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'viewOrEditCampaignPost'});
    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 1,
    )..addListener(() => safeSetState(() {}));

    _model.shortPostFocusNode ??= FocusNode();

    _model.mediumPostFocusNode ??= FocusNode();

    _model.longPostFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 500.0),
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

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CampaignRecord>(
      stream: CampaignRecord.getDocument(widget.postRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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

        final viewOrEditCampaignPostCampaignRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 12.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'VIEW_OR_EDIT_CAMPAIGN_POST_Icon_1fy2u6xk');
                                              logFirebaseEvent(
                                                  'Icon_navigate_back');
                                              context.safePop();
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: AuthUserStreamWidget(
                                            builder: (context) => Container(
                                              width: 38.0,
                                              height: 38.0,
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
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                AuthUserStreamWidget(
                                                  builder: (context) => Text(
                                                    valueOrDefault<String>(
                                                      currentUserDocument
                                                          ?.linkedinScrapped
                                                          .firstName,
                                                      'Name',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts:
                                                              GoogleFonts
                                                                      .asMap()
                                                                  .containsKey(
                                                                      'Outfit'),
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
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (_model.isScheduled)
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 12.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 8.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons
                                                      .globeAmericas,
                                                  color: Color(0xFF404040),
                                                  size: 16.0,
                                                ),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  'Posting on ${dateTimeFormat("MMMEd", _model.scheduledDate)} at ${dateTimeFormat("jm", _model.scheduledTime)}.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
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
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 0.0, 0.0),
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
                                                          'VIEW_OR_EDIT_CAMPAIGN_POST_Text_rdn7vrnx');
                                                      logFirebaseEvent(
                                                          'Text_update_page_state');
                                                      _model.datePickerVisbile =
                                                          true;
                                                      safeSetState(() {});
                                                      logFirebaseEvent(
                                                          'Text_wait__delay');
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  100));
                                                      logFirebaseEvent(
                                                          'Text_widget_animation');
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation'] !=
                                                          null) {
                                                        await animationsMap[
                                                                'containerOnActionTriggerAnimation']!
                                                            .controller
                                                            .forward(from: 0.0);
                                                      }
                                                    },
                                                    child: Text(
                                                      'Change.',
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
                                                                    .secondary,
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
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: SizedBox(
                                          width: 1.0,
                                          height: 1.0,
                                          child: custom_widgets
                                              .BackButtonOverrider(
                                            width: 1.0,
                                            height: 1.0,
                                            onBack: () async {
                                              logFirebaseEvent(
                                                  'VIEW_OR_EDIT_CAMPAIGN_POST_Container_gri');
                                              logFirebaseEvent(
                                                  'BackButtonOverrider_navigate_back');
                                              context.safePop();
                                            },
                                          ),
                                        ),
                                      ),
                                      if (!_model.isScheduled)
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 4.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: Icon(
                                                      Icons.person_4,
                                                      color: Color(0xFF404040),
                                                      size: 16.0,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      'Approve for posting?',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
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
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 4.0, 0.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Stack(
                                                      children: [
                                                        if (_model
                                                                .typeOfMediaUploaded ==
                                                            'onlyText')
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'VIEW_OR_EDIT_CAMPAIGN_POST_onlyTextSched');
                                                              logFirebaseEvent(
                                                                  'onlyTextSchedule_backend_call');

                                                              var scheduledPostsRecordReference =
                                                                  ScheduledPostsRecord
                                                                      .collection
                                                                      .doc();
                                                              await scheduledPostsRecordReference
                                                                  .set(
                                                                      createScheduledPostsRecordData(
                                                                userRef:
                                                                    currentUserReference,
                                                                timestamp: functions.combineDateTimeStr(
                                                                    functions.modifiedDateTime(
                                                                        getCurrentTimestamp,
                                                                        0,
                                                                        0,
                                                                        (widget.indexInList!) +
                                                                            1,
                                                                        true)!,
                                                                    '9:47:00'),
                                                                timeOfCreation:
                                                                    getCurrentTimestamp,
                                                                postType: _model
                                                                    .typeOfMediaUploaded,
                                                                personUrn: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.linkedinUrn,
                                                                    ''),
                                                                accessToken:
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.linkedinAccess,
                                                                        ''),
                                                                postText: () {
                                                                  if (_model
                                                                          .tabBarCurrentIndex ==
                                                                      0) {
                                                                    return _model
                                                                        .shortPostTextController
                                                                        .text;
                                                                  } else if (_model
                                                                          .tabBarCurrentIndex ==
                                                                      1) {
                                                                    return _model
                                                                        .mediumPostTextController
                                                                        .text;
                                                                  } else {
                                                                    return _model
                                                                        .longPostTextController
                                                                        .text;
                                                                  }
                                                                }(),
                                                                status:
                                                                    'pending',
                                                                postTitle: widget
                                                                    .postTitle,
                                                              ));
                                                              _model.scheduledDocOnlyText =
                                                                  ScheduledPostsRecord
                                                                      .getDocumentFromData(
                                                                          createScheduledPostsRecordData(
                                                                            userRef:
                                                                                currentUserReference,
                                                                            timestamp:
                                                                                functions.combineDateTimeStr(functions.modifiedDateTime(getCurrentTimestamp, 0, 0, (widget.indexInList!) + 1, true)!, '9:47:00'),
                                                                            timeOfCreation:
                                                                                getCurrentTimestamp,
                                                                            postType:
                                                                                _model.typeOfMediaUploaded,
                                                                            personUrn:
                                                                                valueOrDefault(currentUserDocument?.linkedinUrn, ''),
                                                                            accessToken:
                                                                                valueOrDefault(currentUserDocument?.linkedinAccess, ''),
                                                                            postText:
                                                                                () {
                                                                              if (_model.tabBarCurrentIndex == 0) {
                                                                                return _model.shortPostTextController.text;
                                                                              } else if (_model.tabBarCurrentIndex == 1) {
                                                                                return _model.mediumPostTextController.text;
                                                                              } else {
                                                                                return _model.longPostTextController.text;
                                                                              }
                                                                            }(),
                                                                            status:
                                                                                'pending',
                                                                            postTitle:
                                                                                widget.postTitle,
                                                                          ),
                                                                          scheduledPostsRecordReference);
                                                              logFirebaseEvent(
                                                                  'onlyTextSchedule_backend_call');

                                                              await widget
                                                                  .postRef!
                                                                  .update(
                                                                      createCampaignRecordData(
                                                                status:
                                                                    'scheduled',
                                                                scheduledTime: functions.combineDateTimeStr(
                                                                    functions.modifiedDateTime(
                                                                        getCurrentTimestamp,
                                                                        0,
                                                                        0,
                                                                        (widget.indexInList!) +
                                                                            1,
                                                                        true)!,
                                                                    '9:47:00'),
                                                                scheduledPostRef: _model
                                                                    .scheduledDocOnlyText
                                                                    ?.reference,
                                                              ));
                                                              logFirebaseEvent(
                                                                  'onlyTextSchedule_update_page_state');
                                                              _model.isScheduled =
                                                                  true;
                                                              _model.scheduledTime =
                                                                  functions.combineDateTimeStr(
                                                                      functions.modifiedDateTime(
                                                                          getCurrentTimestamp,
                                                                          0,
                                                                          0,
                                                                          (widget.indexInList!) +
                                                                              1,
                                                                          true)!,
                                                                      '9:47:00');
                                                              _model.scheduledDate =
                                                                  functions.combineDateTimeStr(
                                                                      functions.modifiedDateTime(
                                                                          getCurrentTimestamp,
                                                                          0,
                                                                          0,
                                                                          (widget.indexInList!) +
                                                                              1,
                                                                          true)!,
                                                                      '9:47:00');
                                                              _model.scheduledDocument =
                                                                  _model
                                                                      .scheduledDocOnlyText
                                                                      ?.reference;
                                                              safeSetState(
                                                                  () {});

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text: 'Approve',
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 30.0,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .success,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        if (_model
                                                                .typeOfMediaUploaded ==
                                                            'doc')
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'VIEW_OR_EDIT_CAMPAIGN_POST_docSchedule_O');
                                                              if (_model
                                                                      .typeOfMediaUploaded ==
                                                                  'doc') {
                                                                logFirebaseEvent(
                                                                    'docSchedule_upload_file_to_firebase');
                                                                {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading1 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];
                                                                  var selectedFiles =
                                                                      <SelectedFile>[];
                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    selectedUploadedFiles = _model
                                                                            .uploadedDoc!
                                                                            .bytes!
                                                                            .isNotEmpty
                                                                        ? [
                                                                            _model.uploadedDoc!
                                                                          ]
                                                                        : <FFUploadedFile>[];
                                                                    selectedFiles =
                                                                        selectedFilesFromUploadedFiles(
                                                                      selectedUploadedFiles,
                                                                    );
                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedFiles
                                                                          .map(
                                                                        (f) async => await uploadData(
                                                                            f.storagePath,
                                                                            f.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    _model.isDataUploading1 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedFiles
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedFiles
                                                                              .length) {
                                                                    safeSetState(
                                                                        () {
                                                                      _model.uploadedLocalFile1 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl1 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                  } else {
                                                                    safeSetState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }

                                                                logFirebaseEvent(
                                                                    'docSchedule_backend_call');
                                                                _model.liDocURLScheCopy =
                                                                    await GetDocUploadUrlFromLinkedinCall
                                                                        .call(
                                                                  urn: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.linkedinUrn,
                                                                      ''),
                                                                  accessToken:
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.linkedinAccess,
                                                                          ''),
                                                                );

                                                                if ((_model
                                                                        .liDocURLScheCopy
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  logFirebaseEvent(
                                                                      'docSchedule_backend_call');
                                                                  _model.docUploadedScheCopy =
                                                                      await UploadDocToLinkedinCall
                                                                          .call(
                                                                    accessToken:
                                                                        valueOrDefault(
                                                                            currentUserDocument?.linkedinAccess,
                                                                            ''),
                                                                    uploadUrl:
                                                                        GetDocUploadUrlFromLinkedinCall
                                                                            .uploadURL(
                                                                      (_model.liDocURLScheCopy
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ),
                                                                    docToBeUploaded:
                                                                        _model
                                                                            .uploadedFileUrl1,
                                                                  );

                                                                  if ((_model
                                                                          .docUploadedScheCopy
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    logFirebaseEvent(
                                                                        'docSchedule_backend_call');

                                                                    var scheduledPostsRecordReference =
                                                                        ScheduledPostsRecord
                                                                            .collection
                                                                            .doc();
                                                                    await scheduledPostsRecordReference
                                                                        .set(
                                                                            createScheduledPostsRecordData(
                                                                      userRef:
                                                                          currentUserReference,
                                                                      timestamp: functions.combineDateTimeStr(
                                                                          functions.modifiedDateTime(
                                                                              getCurrentTimestamp,
                                                                              0,
                                                                              0,
                                                                              (widget.indexInList!) + 1,
                                                                              true)!,
                                                                          '9:47:00'),
                                                                      timeOfCreation:
                                                                          getCurrentTimestamp,
                                                                      postType:
                                                                          _model
                                                                              .typeOfMediaUploaded,
                                                                      personUrn: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.linkedinUrn,
                                                                          ''),
                                                                      accessToken: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.linkedinAccess,
                                                                          ''),
                                                                      postText:
                                                                          () {
                                                                        if (_model.tabBarCurrentIndex ==
                                                                            0) {
                                                                          return _model
                                                                              .shortPostTextController
                                                                              .text;
                                                                        } else if (_model.tabBarCurrentIndex ==
                                                                            1) {
                                                                          return _model
                                                                              .mediumPostTextController
                                                                              .text;
                                                                        } else {
                                                                          return _model
                                                                              .longPostTextController
                                                                              .text;
                                                                        }
                                                                      }(),
                                                                      mediaId:
                                                                          GetDocUploadUrlFromLinkedinCall
                                                                              .docURN(
                                                                        (_model.liDocURLScheCopy?.jsonBody ??
                                                                            ''),
                                                                      ),
                                                                      mediaTitle:
                                                                          _model
                                                                              .uploadedDocTitle,
                                                                      status:
                                                                          'pending',
                                                                      docFirebaseUrl:
                                                                          _model
                                                                              .uploadedFileUrl1,
                                                                      postTitle:
                                                                          widget
                                                                              .postTitle,
                                                                    ));
                                                                    _model.scheduledDocDoc =
                                                                        ScheduledPostsRecord.getDocumentFromData(
                                                                            createScheduledPostsRecordData(
                                                                              userRef: currentUserReference,
                                                                              timestamp: functions.combineDateTimeStr(functions.modifiedDateTime(getCurrentTimestamp, 0, 0, (widget.indexInList!) + 1, true)!, '9:47:00'),
                                                                              timeOfCreation: getCurrentTimestamp,
                                                                              postType: _model.typeOfMediaUploaded,
                                                                              personUrn: valueOrDefault(currentUserDocument?.linkedinUrn, ''),
                                                                              accessToken: valueOrDefault(currentUserDocument?.linkedinAccess, ''),
                                                                              postText: () {
                                                                                if (_model.tabBarCurrentIndex == 0) {
                                                                                  return _model.shortPostTextController.text;
                                                                                } else if (_model.tabBarCurrentIndex == 1) {
                                                                                  return _model.mediumPostTextController.text;
                                                                                } else {
                                                                                  return _model.longPostTextController.text;
                                                                                }
                                                                              }(),
                                                                              mediaId: GetDocUploadUrlFromLinkedinCall.docURN(
                                                                                (_model.liDocURLScheCopy?.jsonBody ?? ''),
                                                                              ),
                                                                              mediaTitle: _model.uploadedDocTitle,
                                                                              status: 'pending',
                                                                              docFirebaseUrl: _model.uploadedFileUrl1,
                                                                              postTitle: widget.postTitle,
                                                                            ),
                                                                            scheduledPostsRecordReference);
                                                                    logFirebaseEvent(
                                                                        'docSchedule_backend_call');

                                                                    await widget
                                                                        .postRef!
                                                                        .update(
                                                                            createCampaignRecordData(
                                                                      status:
                                                                          'scheduled',
                                                                      scheduledTime: functions.combineDateTimeStr(
                                                                          functions.modifiedDateTime(
                                                                              getCurrentTimestamp,
                                                                              0,
                                                                              0,
                                                                              (widget.indexInList!) + 1,
                                                                              true)!,
                                                                          '9:47:00'),
                                                                      scheduledPostRef: _model
                                                                          .scheduledDocDoc
                                                                          ?.reference,
                                                                    ));
                                                                    logFirebaseEvent(
                                                                        'docSchedule_update_page_state');
                                                                    _model.isScheduled =
                                                                        true;
                                                                    _model.scheduledTime = functions.combineDateTimeStr(
                                                                        functions.modifiedDateTime(
                                                                            getCurrentTimestamp,
                                                                            0,
                                                                            0,
                                                                            (widget.indexInList!) +
                                                                                1,
                                                                            true)!,
                                                                        '9:47:00');
                                                                    _model.scheduledDate = functions.combineDateTimeStr(
                                                                        functions.modifiedDateTime(
                                                                            getCurrentTimestamp,
                                                                            0,
                                                                            0,
                                                                            (widget.indexInList!) +
                                                                                1,
                                                                            true)!,
                                                                        '9:47:00');
                                                                    _model.scheduledDocument = _model
                                                                        .scheduledDocDoc
                                                                        ?.reference;
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                }
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text: 'Approve',
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 30.0,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .success,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        if ((_model.typeOfMediaUploaded ==
                                                                'singleImage') ||
                                                            (_model.typeOfMediaUploaded ==
                                                                'multiImage'))
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'VIEW_OR_EDIT_CAMPAIGN_POST_ImageSchedule');
                                                              var shouldSetState =
                                                                  false;
                                                              logFirebaseEvent(
                                                                  'ImageSchedule_upload_media_to_firebase');
                                                              {
                                                                safeSetState(() =>
                                                                    _model.isDataUploading2 =
                                                                        true);
                                                                var selectedUploadedFiles =
                                                                    <FFUploadedFile>[];
                                                                var selectedMedia =
                                                                    <SelectedFile>[];
                                                                var downloadUrls =
                                                                    <String>[];
                                                                try {
                                                                  selectedUploadedFiles =
                                                                      _model
                                                                          .uploadedMedia;
                                                                  selectedMedia =
                                                                      selectedFilesFromUploadedFiles(
                                                                    selectedUploadedFiles,
                                                                    isMultiData:
                                                                        true,
                                                                  );
                                                                  downloadUrls = (await Future
                                                                          .wait(
                                                                    selectedMedia
                                                                        .map(
                                                                      (m) async => await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                    ),
                                                                  ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                                } finally {
                                                                  _model.isDataUploading2 =
                                                                      false;
                                                                }
                                                                if (selectedUploadedFiles
                                                                            .length ==
                                                                        selectedMedia
                                                                            .length &&
                                                                    downloadUrls
                                                                            .length ==
                                                                        selectedMedia
                                                                            .length) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.uploadedLocalFiles2 =
                                                                        selectedUploadedFiles;
                                                                    _model.uploadedFileUrls2 =
                                                                        downloadUrls;
                                                                  });
                                                                } else {
                                                                  safeSetState(
                                                                      () {});
                                                                  return;
                                                                }
                                                              }

                                                              while (_model
                                                                      .noOfImagesUploadedToFirebase <
                                                                  _model
                                                                      .numberOfImagesUploaded) {
                                                                logFirebaseEvent(
                                                                    'ImageSchedule_backend_call');
                                                                _model.imageUrlSchCamp =
                                                                    await GetImageUploadUrlFromLinkedinCall
                                                                        .call(
                                                                  urn: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.linkedinUrn,
                                                                      ''),
                                                                  accessToken:
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.linkedinAccess,
                                                                          ''),
                                                                );

                                                                shouldSetState =
                                                                    true;
                                                                if ((_model
                                                                        .imageUrlSchCamp
                                                                        ?.succeeded ??
                                                                    true)) {
                                                                  logFirebaseEvent(
                                                                      'ImageSchedule_backend_call');
                                                                  _model.imageUploadedSchCamp =
                                                                      await UploadImageToLinkedinCall
                                                                          .call(
                                                                    accessToken:
                                                                        valueOrDefault(
                                                                            currentUserDocument?.linkedinAccess,
                                                                            ''),
                                                                    uploadUrl:
                                                                        GetImageUploadUrlFromLinkedinCall
                                                                            .uploadURL(
                                                                      (_model.imageUrlSchCamp
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ),
                                                                    imageToBeUploaded: _model
                                                                            .uploadedFileUrls2[
                                                                        _model
                                                                            .noOfImagesUploadedToFirebase],
                                                                  );

                                                                  shouldSetState =
                                                                      true;
                                                                  if ((_model
                                                                          .imageUploadedSchCamp
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    if (_model
                                                                            .noOfImagesUploadedToFirebase >=
                                                                        1) {
                                                                      logFirebaseEvent(
                                                                          'ImageSchedule_backend_call');

                                                                      await _model
                                                                          .scheduledDocImage!
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'imageUrns':
                                                                                FieldValue.arrayUnion([
                                                                              GetImageUploadUrlFromLinkedinCall.imageURN(
                                                                                (_model.imageUrlSchCamp?.jsonBody ?? ''),
                                                                              )
                                                                            ]),
                                                                            'linkedinImgUrls':
                                                                                FieldValue.arrayUnion([
                                                                              GetImageUploadUrlFromLinkedinCall.uploadURL(
                                                                                (_model.imageUrlSchCamp?.jsonBody ?? ''),
                                                                              )
                                                                            ]),
                                                                            'firebaseImgUrls':
                                                                                FieldValue.arrayUnion([
                                                                              _model.uploadedFileUrls2[_model.noOfImagesUploadedToFirebase]
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                      logFirebaseEvent(
                                                                          'ImageSchedule_update_page_state');
                                                                      _model.noOfImagesUploadedToFirebase =
                                                                          _model.noOfImagesUploadedToFirebase +
                                                                              1;
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'ImageSchedule_backend_call');

                                                                      var scheduledPostsRecordReference = ScheduledPostsRecord
                                                                          .collection
                                                                          .doc();
                                                                      await scheduledPostsRecordReference
                                                                          .set({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'imageUrns':
                                                                                [
                                                                              GetImageUploadUrlFromLinkedinCall.imageURN(
                                                                                (_model.imageUrlSchCamp?.jsonBody ?? ''),
                                                                              )
                                                                            ],
                                                                            'linkedinImgUrls':
                                                                                [
                                                                              GetImageUploadUrlFromLinkedinCall.uploadURL(
                                                                                (_model.imageUrlSchCamp?.jsonBody ?? ''),
                                                                              )
                                                                            ],
                                                                            'firebaseImgUrls':
                                                                                [
                                                                              _model.uploadedFileUrls2[_model.noOfImagesUploadedToFirebase]
                                                                            ],
                                                                          },
                                                                        ),
                                                                      });
                                                                      _model.scheduledDocImage =
                                                                          ScheduledPostsRecord
                                                                              .getDocumentFromData({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'imageUrns':
                                                                                [
                                                                              GetImageUploadUrlFromLinkedinCall.imageURN(
                                                                                (_model.imageUrlSchCamp?.jsonBody ?? ''),
                                                                              )
                                                                            ],
                                                                            'linkedinImgUrls':
                                                                                [
                                                                              GetImageUploadUrlFromLinkedinCall.uploadURL(
                                                                                (_model.imageUrlSchCamp?.jsonBody ?? ''),
                                                                              )
                                                                            ],
                                                                            'firebaseImgUrls':
                                                                                [
                                                                              _model.uploadedFileUrls2[_model.noOfImagesUploadedToFirebase]
                                                                            ],
                                                                          },
                                                                        ),
                                                                      }, scheduledPostsRecordReference);
                                                                      shouldSetState =
                                                                          true;
                                                                      logFirebaseEvent(
                                                                          'ImageSchedule_update_page_state');
                                                                      _model.noOfImagesUploadedToFirebase =
                                                                          _model.noOfImagesUploadedToFirebase +
                                                                              1;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                  } else {
                                                                    logFirebaseEvent(
                                                                        'ImageSchedule_alert_dialog');
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title:
                                                                              const Text('Failed!'),
                                                                          content:
                                                                              const Text('Image upload to linkedin failed.'),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                              child: const Text('Ok'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                    if (shouldSetState) {
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                    return;
                                                                  }
                                                                } else {
                                                                  logFirebaseEvent(
                                                                      'ImageSchedule_alert_dialog');
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: const Text(
                                                                            'Failed!'),
                                                                        content:
                                                                            const Text('Image upload url from linkedin failed.'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                const Text('Ok'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  if (shouldSetState) {
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                  return;
                                                                }
                                                              }
                                                              if (_model
                                                                      .numberOfImagesUploaded >
                                                                  1) {
                                                                logFirebaseEvent(
                                                                    'ImageSchedule_backend_call');

                                                                await widget
                                                                    .postRef!
                                                                    .update(
                                                                        createCampaignRecordData(
                                                                  status:
                                                                      'scheduled',
                                                                  scheduledTime: functions.combineDateTimeStr(
                                                                      functions.modifiedDateTime(
                                                                          getCurrentTimestamp,
                                                                          0,
                                                                          0,
                                                                          (widget.indexInList!) +
                                                                              1,
                                                                          true)!,
                                                                      '9:47:00'),
                                                                  scheduledPostRef: _model
                                                                      .scheduledDocImage
                                                                      ?.reference,
                                                                ));
                                                                logFirebaseEvent(
                                                                    'ImageSchedule_backend_call');

                                                                await _model
                                                                    .scheduledDocImage!
                                                                    .reference
                                                                    .update(
                                                                        createScheduledPostsRecordData(
                                                                  userRef:
                                                                      currentUserReference,
                                                                  timestamp: functions.combineDateTimeStr(
                                                                      functions.modifiedDateTime(
                                                                          getCurrentTimestamp,
                                                                          0,
                                                                          0,
                                                                          (widget.indexInList!) +
                                                                              1,
                                                                          true)!,
                                                                      '9:47:00'),
                                                                  timeOfCreation:
                                                                      getCurrentTimestamp,
                                                                  postType: _model
                                                                      .typeOfMediaUploaded,
                                                                  personUrn: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.linkedinUrn,
                                                                      ''),
                                                                  accessToken:
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.linkedinAccess,
                                                                          ''),
                                                                  postText: () {
                                                                    if (_model
                                                                            .tabBarCurrentIndex ==
                                                                        0) {
                                                                      return _model
                                                                          .shortPostTextController
                                                                          .text;
                                                                    } else if (_model
                                                                            .tabBarCurrentIndex ==
                                                                        1) {
                                                                      return _model
                                                                          .mediumPostTextController
                                                                          .text;
                                                                    } else {
                                                                      return _model
                                                                          .longPostTextController
                                                                          .text;
                                                                    }
                                                                  }(),
                                                                  imagesJson: functions
                                                                      .valueToJsonMapList(
                                                                          _model
                                                                              .scheduledDocImage!
                                                                              .imageUrns
                                                                              .toList(),
                                                                          'id')
                                                                      .toString(),
                                                                  mediaTitle:
                                                                      widget
                                                                          .postTitle,
                                                                  status:
                                                                      'pending',
                                                                  postTitle: widget
                                                                      .postTitle,
                                                                ));
                                                                logFirebaseEvent(
                                                                    'ImageSchedule_update_page_state');
                                                                _model.isScheduled =
                                                                    true;
                                                                _model.scheduledTime = functions.combineDateTimeStr(
                                                                    functions.modifiedDateTime(
                                                                        getCurrentTimestamp,
                                                                        0,
                                                                        0,
                                                                        (widget.indexInList!) +
                                                                            1,
                                                                        true)!,
                                                                    '9:47:00');
                                                                _model.scheduledDate = functions.combineDateTimeStr(
                                                                    functions.modifiedDateTime(
                                                                        getCurrentTimestamp,
                                                                        0,
                                                                        0,
                                                                        (widget.indexInList!) +
                                                                            1,
                                                                        true)!,
                                                                    '9:47:00');
                                                                _model.scheduledDocument = _model
                                                                    .scheduledDocImage
                                                                    ?.reference;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'ImageSchedule_backend_call');

                                                                await widget
                                                                    .postRef!
                                                                    .update(
                                                                        createCampaignRecordData(
                                                                  status:
                                                                      'scheduled',
                                                                  scheduledTime: functions.combineDateTimeStr(
                                                                      functions.modifiedDateTime(
                                                                          getCurrentTimestamp,
                                                                          0,
                                                                          0,
                                                                          (widget.indexInList!) +
                                                                              1,
                                                                          true)!,
                                                                      '9:47:00'),
                                                                  scheduledPostRef: _model
                                                                      .scheduledDocImage
                                                                      ?.reference,
                                                                ));
                                                                logFirebaseEvent(
                                                                    'ImageSchedule_backend_call');

                                                                await _model
                                                                    .scheduledDocImage!
                                                                    .reference
                                                                    .update(
                                                                        createScheduledPostsRecordData(
                                                                  userRef:
                                                                      currentUserReference,
                                                                  timestamp: functions.combineDateTimeStr(
                                                                      functions.modifiedDateTime(
                                                                          getCurrentTimestamp,
                                                                          0,
                                                                          0,
                                                                          (widget.indexInList!) +
                                                                              1,
                                                                          true)!,
                                                                      '9:47:00'),
                                                                  timeOfCreation:
                                                                      getCurrentTimestamp,
                                                                  postType: _model
                                                                      .typeOfMediaUploaded,
                                                                  personUrn: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.linkedinUrn,
                                                                      ''),
                                                                  accessToken:
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.linkedinAccess,
                                                                          ''),
                                                                  postText: () {
                                                                    if (_model
                                                                            .tabBarCurrentIndex ==
                                                                        0) {
                                                                      return _model
                                                                          .shortPostTextController
                                                                          .text;
                                                                    } else if (_model
                                                                            .tabBarCurrentIndex ==
                                                                        1) {
                                                                      return _model
                                                                          .mediumPostTextController
                                                                          .text;
                                                                    } else {
                                                                      return _model
                                                                          .longPostTextController
                                                                          .text;
                                                                    }
                                                                  }(),
                                                                  mediaTitle:
                                                                      widget
                                                                          .postTitle,
                                                                  status:
                                                                      'pending',
                                                                  mediaId:
                                                                      GetImageUploadUrlFromLinkedinCall
                                                                          .imageURN(
                                                                    (_model.imageUrlSchCamp
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ),
                                                                  imagesJson:
                                                                      widget
                                                                          .postTitle,
                                                                ));
                                                                logFirebaseEvent(
                                                                    'ImageSchedule_update_page_state');
                                                                _model.isScheduled =
                                                                    true;
                                                                _model.scheduledTime = functions.combineDateTimeStr(
                                                                    functions.modifiedDateTime(
                                                                        getCurrentTimestamp,
                                                                        0,
                                                                        0,
                                                                        (widget.indexInList!) +
                                                                            1,
                                                                        true)!,
                                                                    '9:47:00');
                                                                _model.scheduledDate = functions.combineDateTimeStr(
                                                                    functions.modifiedDateTime(
                                                                        getCurrentTimestamp,
                                                                        0,
                                                                        0,
                                                                        (widget.indexInList!) +
                                                                            1,
                                                                        true)!,
                                                                    '9:47:00');
                                                                _model.scheduledDocument = _model
                                                                    .scheduledDocImage
                                                                    ?.reference;
                                                                safeSetState(
                                                                    () {});
                                                              }

                                                              if (shouldSetState) {
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            text: 'Approve',
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 30.0,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .success,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        if (_model
                                                                .typeOfMediaUploaded ==
                                                            'poll')
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  'VIEW_OR_EDIT_CAMPAIGN_POST_pollSchedule_');
                                                              await Future
                                                                  .wait([
                                                                Future(
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'pollSchedule_update_page_state');
                                                                  _model.addToPollOptionsList(
                                                                      _model
                                                                          .pollOption1!);
                                                                  safeSetState(
                                                                      () {});
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'pollSchedule_update_page_state');
                                                                  _model.addToPollOptionsList(
                                                                      _model
                                                                          .pollOption2!);
                                                                  safeSetState(
                                                                      () {});
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  if (_model.pollOption3 !=
                                                                          null &&
                                                                      _model.pollOption3 !=
                                                                          '') {
                                                                    logFirebaseEvent(
                                                                        'pollSchedule_update_page_state');
                                                                    _model.addToPollOptionsList(
                                                                        _model
                                                                            .pollOption3!);
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                }),
                                                                Future(
                                                                    () async {
                                                                  if (_model.pollOption4 !=
                                                                          null &&
                                                                      _model.pollOption4 !=
                                                                          '') {
                                                                    logFirebaseEvent(
                                                                        'pollSchedule_update_page_state');
                                                                    _model.addToPollOptionsList(
                                                                        _model
                                                                            .pollOption4!);
                                                                    safeSetState(
                                                                        () {});
                                                                  }
                                                                }),
                                                              ]);
                                                              logFirebaseEvent(
                                                                  'pollSchedule_backend_call');

                                                              var scheduledPostsRecordReference =
                                                                  ScheduledPostsRecord
                                                                      .collection
                                                                      .doc();
                                                              await scheduledPostsRecordReference
                                                                  .set(
                                                                      createScheduledPostsRecordData(
                                                                userRef:
                                                                    currentUserReference,
                                                                timestamp: functions.combineDateTimeStr(
                                                                    functions.modifiedDateTime(
                                                                        getCurrentTimestamp,
                                                                        0,
                                                                        0,
                                                                        (widget.indexInList!) +
                                                                            1,
                                                                        true)!,
                                                                    '9:47:00'),
                                                                timeOfCreation:
                                                                    getCurrentTimestamp,
                                                                postType: _model
                                                                    .typeOfMediaUploaded,
                                                                personUrn: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.linkedinUrn,
                                                                    ''),
                                                                accessToken:
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.linkedinAccess,
                                                                        ''),
                                                                postText: () {
                                                                  if (_model
                                                                          .tabBarCurrentIndex ==
                                                                      0) {
                                                                    return _model
                                                                        .shortPostTextController
                                                                        .text;
                                                                  } else if (_model
                                                                          .tabBarCurrentIndex ==
                                                                      1) {
                                                                    return _model
                                                                        .mediumPostTextController
                                                                        .text;
                                                                  } else {
                                                                    return _model
                                                                        .longPostTextController
                                                                        .text;
                                                                  }
                                                                }(),
                                                                question: _model
                                                                    .pollQuestion,
                                                                optionsJson: functions
                                                                    .valueToJsonMapList(
                                                                        _model
                                                                            .pollOptionsList
                                                                            .toList(),
                                                                        'text')
                                                                    .toString(),
                                                                duration: _model
                                                                    .pollDuration,
                                                                status:
                                                                    'pending',
                                                                postTitle: widget
                                                                    .postTitle,
                                                              ));
                                                              _model.scheduledDocOnlyPoll =
                                                                  ScheduledPostsRecord
                                                                      .getDocumentFromData(
                                                                          createScheduledPostsRecordData(
                                                                            userRef:
                                                                                currentUserReference,
                                                                            timestamp:
                                                                                functions.combineDateTimeStr(functions.modifiedDateTime(getCurrentTimestamp, 0, 0, (widget.indexInList!) + 1, true)!, '9:47:00'),
                                                                            timeOfCreation:
                                                                                getCurrentTimestamp,
                                                                            postType:
                                                                                _model.typeOfMediaUploaded,
                                                                            personUrn:
                                                                                valueOrDefault(currentUserDocument?.linkedinUrn, ''),
                                                                            accessToken:
                                                                                valueOrDefault(currentUserDocument?.linkedinAccess, ''),
                                                                            postText:
                                                                                () {
                                                                              if (_model.tabBarCurrentIndex == 0) {
                                                                                return _model.shortPostTextController.text;
                                                                              } else if (_model.tabBarCurrentIndex == 1) {
                                                                                return _model.mediumPostTextController.text;
                                                                              } else {
                                                                                return _model.longPostTextController.text;
                                                                              }
                                                                            }(),
                                                                            question:
                                                                                _model.pollQuestion,
                                                                            optionsJson:
                                                                                functions.valueToJsonMapList(_model.pollOptionsList.toList(), 'text').toString(),
                                                                            duration:
                                                                                _model.pollDuration,
                                                                            status:
                                                                                'pending',
                                                                            postTitle:
                                                                                widget.postTitle,
                                                                          ),
                                                                          scheduledPostsRecordReference);
                                                              logFirebaseEvent(
                                                                  'pollSchedule_backend_call');

                                                              await widget
                                                                  .postRef!
                                                                  .update(
                                                                      createCampaignRecordData(
                                                                status:
                                                                    'scheduled',
                                                                scheduledTime: functions.combineDateTimeStr(
                                                                    functions.modifiedDateTime(
                                                                        getCurrentTimestamp,
                                                                        0,
                                                                        0,
                                                                        (widget.indexInList!) +
                                                                            1,
                                                                        true)!,
                                                                    '9:47:00'),
                                                                scheduledPostRef: _model
                                                                    .scheduledDocOnlyPoll
                                                                    ?.reference,
                                                              ));
                                                              logFirebaseEvent(
                                                                  'pollSchedule_update_page_state');
                                                              _model.isScheduled =
                                                                  true;
                                                              _model.scheduledTime =
                                                                  functions.combineDateTimeStr(
                                                                      functions.modifiedDateTime(
                                                                          getCurrentTimestamp,
                                                                          0,
                                                                          0,
                                                                          (widget.indexInList!) +
                                                                              1,
                                                                          true)!,
                                                                      '9:47:00');
                                                              _model.scheduledDate =
                                                                  functions.combineDateTimeStr(
                                                                      functions.modifiedDateTime(
                                                                          getCurrentTimestamp,
                                                                          0,
                                                                          0,
                                                                          (widget.indexInList!) +
                                                                              1,
                                                                          true)!,
                                                                      '9:47:00');
                                                              _model.scheduledDocument =
                                                                  _model
                                                                      .scheduledDocOnlyPoll
                                                                      ?.reference;
                                                              safeSetState(
                                                                  () {});

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text: 'Approve',
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 30.0,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .success,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  const BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        if (!valueOrDefault<
                                                                bool>(
                                                            currentUserDocument
                                                                ?.linkedinConnected,
                                                            false))
                                                          AuthUserStreamWidget(
                                                            builder: (context) =>
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'VIEW_OR_EDIT_CAMPAIGN_POST_linkedinConne');
                                                                logFirebaseEvent(
                                                                    'linkedinConnec_alert_dialog');
                                                                var confirmDialogResponse =
                                                                    await showDialog<
                                                                            bool>(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: const Text('Linkedin Not Connected!'),
                                                                              content: const Text('To be able to post to Linkedin, you need to connect your account.'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                  child: const Text('Cancel'),
                                                                                ),
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                  child: const Text('Let\'s Connect'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        ) ??
                                                                        false;
                                                                if (confirmDialogResponse) {
                                                                  logFirebaseEvent(
                                                                      'linkedinConnec_navigate_to');

                                                                  context.pushNamed(
                                                                      'linkedinConnect');
                                                                }
                                                              },
                                                              text: 'Approve',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: double
                                                                    .infinity,
                                                                height: 30.0,
                                                                padding: const EdgeInsetsDirectional
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                                elevation: 3.0,
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'VIEW_OR_EDIT_CAMPAIGN_POST_Decline_Butto');
                                                        logFirebaseEvent(
                                                            'Decline_Button_backend_call');

                                                        await widget.postRef!
                                                            .update(
                                                                createCampaignRecordData(
                                                          status: 'declined',
                                                        ));
                                                        logFirebaseEvent(
                                                            'Decline_Button_navigate_to');

                                                        context.pushNamed(
                                                          'postReview',
                                                          queryParameters: {
                                                            'campaignPostRef':
                                                                serializeParam(
                                                              widget.postRef,
                                                              ParamType
                                                                  .DocumentReference,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                const TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .bottomToTop,
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      text: 'Decline',
                                                      options: FFButtonOptions(
                                                        height: 30.0,
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
                                                            Colors.transparent,
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
                                                                      .error,
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
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 12.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: const Alignment(0.0, 0),
                                              child: TabBar(
                                                labelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                unselectedLabelColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                                unselectedLabelStyle:
                                                    const TextStyle(),
                                                indicatorColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                tabs: const [
                                                  Tab(
                                                    text: 'Short Post',
                                                  ),
                                                  Tab(
                                                    text: 'Medium',
                                                  ),
                                                  Tab(
                                                    text: 'Long Post',
                                                  ),
                                                ],
                                                controller:
                                                    _model.tabBarController,
                                                onTap: (i) async {
                                                  [
                                                    () async {},
                                                    () async {},
                                                    () async {}
                                                  ][i]();
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: TabBarView(
                                                controller:
                                                    _model.tabBarController,
                                                children: [
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  40.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                                .shortPostTextController ??=
                                                            TextEditingController(
                                                          text: viewOrEditCampaignPostCampaignRecord
                                                              .posts
                                                              .where((e) =>
                                                                  e.postLength ==
                                                                  'Short-post')
                                                              .toList()
                                                              .first
                                                              .finalPost,
                                                        ),
                                                        focusNode: _model
                                                            .shortPostFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.shortPostTextController',
                                                          const Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .sentences,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'What\'s happening?',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    color: const Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            'Plus Jakarta Sans'),
                                                                  ),
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Plus Jakarta Sans'),
                                                                ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: null,
                                                        cursorColor:
                                                            const Color(0xFF4B39EF),
                                                        validator: _model
                                                            .shortPostTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  40.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                                .mediumPostTextController ??=
                                                            TextEditingController(
                                                          text: viewOrEditCampaignPostCampaignRecord
                                                              .posts
                                                              .where((e) =>
                                                                  e.postLength ==
                                                                  'Medium-post')
                                                              .toList()
                                                              .first
                                                              .finalPost,
                                                        ),
                                                        focusNode: _model
                                                            .mediumPostFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.mediumPostTextController',
                                                          const Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .sentences,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'What\'s happening?',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    color: const Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            'Plus Jakarta Sans'),
                                                                  ),
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Plus Jakarta Sans'),
                                                                ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: null,
                                                        cursorColor:
                                                            const Color(0xFF4B39EF),
                                                        validator: _model
                                                            .mediumPostTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                  KeepAliveWidgetWrapper(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  40.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                                .longPostTextController ??=
                                                            TextEditingController(
                                                          text: viewOrEditCampaignPostCampaignRecord
                                                              .posts
                                                              .where((e) =>
                                                                  e.postLength ==
                                                                  'Long-post')
                                                              .toList()
                                                              .first
                                                              .finalPost,
                                                        ),
                                                        focusNode: _model
                                                            .longPostFocusNode,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.longPostTextController',
                                                          const Duration(
                                                              milliseconds:
                                                                  2000),
                                                          () => safeSetState(
                                                              () {}),
                                                        ),
                                                        autofocus: false,
                                                        textCapitalization:
                                                            TextCapitalization
                                                                .sentences,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'What\'s happening?',
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    color: const Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            'Plus Jakarta Sans'),
                                                                  ),
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          'Plus Jakarta Sans'),
                                                                ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        maxLines: null,
                                                        cursorColor:
                                                            const Color(0xFF4B39EF),
                                                        validator: _model
                                                            .longPostTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if ((_model.typeOfMediaUploaded ==
                                                    'singleImage') ||
                                                (_model.typeOfMediaUploaded ==
                                                    'multiImage'))
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    if (_model
                                                            .numberOfImagesUploaded ==
                                                        1) {
                                                      return Stack(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.memory(
                                                              _model
                                                                      .uploadedMedia
                                                                      .first
                                                                      .bytes ??
                                                                  Uint8List
                                                                      .fromList(
                                                                          []),
                                                              width: double
                                                                  .infinity,
                                                              height: 250.0,
                                                              fit: BoxFit.none,
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
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
                                                                      'VIEW_OR_EDIT_CAMPAIGN_POST_Container_64k');
                                                                  logFirebaseEvent(
                                                                      'Container_update_page_state');
                                                                  _model.typeOfMediaUploaded =
                                                                      'onlyText';
                                                                  _model.numberOfImagesUploaded =
                                                                      0;
                                                                  _model.uploadedMedia =
                                                                      [];
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Container_clear_uploaded_data');
                                                                  safeSetState(
                                                                      () {
                                                                    _model.isDataUploading3 =
                                                                        false;
                                                                    _model.uploadedLocalFiles3 =
                                                                        [];
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 24.0,
                                                                  height: 24.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0xD4080808),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Icon(
                                                                    Icons.close,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    size: 16.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    } else if (_model
                                                            .numberOfImagesUploaded ==
                                                        2) {
                                                      return Stack(
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Flexible(
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            0.0),
                                                                  ),
                                                                  child: Image
                                                                      .memory(
                                                                    _model
                                                                            .uploadedMedia
                                                                            .first
                                                                            .bytes ??
                                                                        Uint8List.fromList(
                                                                            []),
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.5,
                                                                    height:
                                                                        250.0,
                                                                    fit: BoxFit
                                                                        .none,
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            0.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Image
                                                                      .memory(
                                                                    _model
                                                                            .uploadedMedia[
                                                                                1]
                                                                            .bytes ??
                                                                        Uint8List.fromList(
                                                                            []),
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        0.5,
                                                                    height:
                                                                        250.0,
                                                                    fit: BoxFit
                                                                        .none,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
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
                                                                      'VIEW_OR_EDIT_CAMPAIGN_POST_Container_ac6');
                                                                  logFirebaseEvent(
                                                                      'Container_update_page_state');
                                                                  _model.typeOfMediaUploaded =
                                                                      'onlyText';
                                                                  _model.numberOfImagesUploaded =
                                                                      0;
                                                                  _model.uploadedMedia =
                                                                      [];
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Container_clear_uploaded_data');
                                                                  safeSetState(
                                                                      () {
                                                                    _model.isDataUploading3 =
                                                                        false;
                                                                    _model.uploadedLocalFiles3 =
                                                                        [];
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 24.0,
                                                                  height: 24.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0xD4080808),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Icon(
                                                                    Icons.close,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    size: 16.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    } else if (_model
                                                            .numberOfImagesUploaded ==
                                                        3) {
                                                      return Stack(
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          8.0),
                                                                ),
                                                                child: Image
                                                                    .memory(
                                                                  _model
                                                                          .uploadedMedia
                                                                          .first
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  width: double
                                                                      .infinity,
                                                                  height: 150.0,
                                                                  fit: BoxFit
                                                                      .none,
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                      child: Image
                                                                          .memory(
                                                                        _model.uploadedMedia[1].bytes ??
                                                                            Uint8List.fromList([]),
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.5,
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(8.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                      child: Image
                                                                          .memory(
                                                                        _model.uploadedMedia[2].bytes ??
                                                                            Uint8List.fromList([]),
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.5,
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
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
                                                                      'VIEW_OR_EDIT_CAMPAIGN_POST_Container_4lw');
                                                                  logFirebaseEvent(
                                                                      'Container_update_page_state');
                                                                  _model.typeOfMediaUploaded =
                                                                      'onlyText';
                                                                  _model.numberOfImagesUploaded =
                                                                      0;
                                                                  _model.uploadedMedia =
                                                                      [];
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Container_clear_uploaded_data');
                                                                  safeSetState(
                                                                      () {
                                                                    _model.isDataUploading3 =
                                                                        false;
                                                                    _model.uploadedLocalFiles3 =
                                                                        [];
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 24.0,
                                                                  height: 24.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0xD4080808),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Icon(
                                                                    Icons.close,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    size: 16.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    } else if (_model
                                                            .numberOfImagesUploaded ==
                                                        4) {
                                                      return Stack(
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          8.0),
                                                                ),
                                                                child: Image
                                                                    .memory(
                                                                  _model
                                                                          .uploadedMedia
                                                                          .first
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  width: double
                                                                      .infinity,
                                                                  height: 150.0,
                                                                  fit: BoxFit
                                                                      .none,
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                      child: Image
                                                                          .memory(
                                                                        _model.uploadedMedia[1].bytes ??
                                                                            Uint8List.fromList([]),
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                      child: Image
                                                                          .memory(
                                                                        _model.uploadedMedia[2].bytes ??
                                                                            Uint8List.fromList([]),
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(8.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                      child: Image
                                                                          .memory(
                                                                        _model.uploadedMedia[3].bytes ??
                                                                            Uint8List.fromList([]),
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
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
                                                                      'VIEW_OR_EDIT_CAMPAIGN_POST_Container_mr4');
                                                                  logFirebaseEvent(
                                                                      'Container_update_page_state');
                                                                  _model.typeOfMediaUploaded =
                                                                      'onlyText';
                                                                  _model.numberOfImagesUploaded =
                                                                      0;
                                                                  _model.uploadedMedia =
                                                                      [];
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Container_clear_uploaded_data');
                                                                  safeSetState(
                                                                      () {
                                                                    _model.isDataUploading3 =
                                                                        false;
                                                                    _model.uploadedLocalFiles3 =
                                                                        [];
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 24.0,
                                                                  height: 24.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0xD4080808),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Icon(
                                                                    Icons.close,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    size: 16.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    } else if (_model
                                                            .numberOfImagesUploaded ==
                                                        5) {
                                                      return Stack(
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                      child: Image
                                                                          .memory(
                                                                        _model.uploadedMedia.first.bytes ??
                                                                            Uint8List.fromList([]),
                                                                        height:
                                                                            150.0,
                                                                        fit: BoxFit
                                                                            .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                      child: Image
                                                                          .memory(
                                                                        _model.uploadedMedia[1].bytes ??
                                                                            Uint8List.fromList([]),
                                                                        height:
                                                                            150.0,
                                                                        fit: BoxFit
                                                                            .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                      child: Image
                                                                          .memory(
                                                                        _model.uploadedMedia[2].bytes ??
                                                                            Uint8List.fromList([]),
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                      child: Image
                                                                          .memory(
                                                                        _model.uploadedMedia[3].bytes ??
                                                                            Uint8List.fromList([]),
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(8.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                      child: Image
                                                                          .memory(
                                                                        _model.uploadedMedia[4].bytes ??
                                                                            Uint8List.fromList([]),
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
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
                                                                      'VIEW_OR_EDIT_CAMPAIGN_POST_Container_0pm');
                                                                  logFirebaseEvent(
                                                                      'Container_update_page_state');
                                                                  _model.typeOfMediaUploaded =
                                                                      'onlyText';
                                                                  _model.numberOfImagesUploaded =
                                                                      0;
                                                                  _model.uploadedMedia =
                                                                      [];
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Container_clear_uploaded_data');
                                                                  safeSetState(
                                                                      () {
                                                                    _model.isDataUploading3 =
                                                                        false;
                                                                    _model.uploadedLocalFiles3 =
                                                                        [];
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 24.0,
                                                                  height: 24.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0xD4080808),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Icon(
                                                                    Icons.close,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    size: 16.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    } else {
                                                      return Stack(
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                      child: Image
                                                                          .memory(
                                                                        _model.uploadedMedia.first.bytes ??
                                                                            Uint8List.fromList([]),
                                                                        height:
                                                                            150.0,
                                                                        fit: BoxFit
                                                                            .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                      child: Image
                                                                          .memory(
                                                                        _model.uploadedMedia[1].bytes ??
                                                                            Uint8List.fromList([]),
                                                                        height:
                                                                            150.0,
                                                                        fit: BoxFit
                                                                            .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Flexible(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(8.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                      child: Image
                                                                          .memory(
                                                                        _model.uploadedMedia[2].bytes ??
                                                                            Uint8List.fromList([]),
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          const BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(0.0),
                                                                        topRight:
                                                                            Radius.circular(0.0),
                                                                      ),
                                                                      child: Image
                                                                          .memory(
                                                                        _model.uploadedMedia[3].bytes ??
                                                                            Uint8List.fromList([]),
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .none,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(0.0),
                                                                            bottomRight:
                                                                                Radius.circular(8.0),
                                                                            topLeft:
                                                                                Radius.circular(0.0),
                                                                            topRight:
                                                                                Radius.circular(0.0),
                                                                          ),
                                                                          child:
                                                                              Image.memory(
                                                                            _model.uploadedMedia[4].bytes ??
                                                                                Uint8List.fromList([]),
                                                                            height:
                                                                                100.0,
                                                                            fit:
                                                                                BoxFit.none,
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              const BoxDecoration(
                                                                            color:
                                                                                Color(0xC9080808),
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              bottomLeft: Radius.circular(0.0),
                                                                              bottomRight: Radius.circular(8.0),
                                                                              topLeft: Radius.circular(0.0),
                                                                              topRight: Radius.circular(0.0),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              '+${(_model.numberOfImagesUploaded - 5).toString()}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
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
                                                                      'VIEW_OR_EDIT_CAMPAIGN_POST_Container_nb8');
                                                                  logFirebaseEvent(
                                                                      'Container_update_page_state');
                                                                  _model.typeOfMediaUploaded =
                                                                      'onlyText';
                                                                  _model.numberOfImagesUploaded =
                                                                      0;
                                                                  _model.uploadedMedia =
                                                                      [];
                                                                  safeSetState(
                                                                      () {});
                                                                  logFirebaseEvent(
                                                                      'Container_clear_uploaded_data');
                                                                  safeSetState(
                                                                      () {
                                                                    _model.isDataUploading3 =
                                                                        false;
                                                                    _model.uploadedLocalFiles3 =
                                                                        [];
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 24.0,
                                                                  height: 24.0,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0xD4080808),
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Icon(
                                                                    Icons.close,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    size: 16.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    }
                                                  },
                                                ),
                                              ),
                                            if (_model.typeOfMediaUploaded ==
                                                'doc')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: Stack(
                                                  children: [
                                                    FlutterFlowPdfViewer(
                                                      fileBytes: _model
                                                          .uploadedDoc?.bytes,
                                                      height: 300.0,
                                                      horizontalScroll: true,
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xB8080808),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    8.0,
                                                                    8.0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            _model
                                                                .uploadedDocTitle,
                                                            'Title',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
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
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'VIEW_OR_EDIT_CAMPAIGN_POST_Container_mhb');
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            _model.typeOfMediaUploaded =
                                                                'onlyText';
                                                            _model.uploadedDoc =
                                                                null;
                                                            _model.uploadedDocTitle =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: Color(
                                                                  0xD4080808),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              Icons.close,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (_model.typeOfMediaUploaded ==
                                                'poll')
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 16.0),
                                                child: Stack(
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color:
                                                              const Color(0x65979797),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    8.0,
                                                                    8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${_model.pollQuestion}?',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        18.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: _model
                                                                    .pollOption1!,
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 28.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Colors
                                                                      .transparent,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed: () {
                                                                  print(
                                                                      'Button pressed ...');
                                                                },
                                                                text: _model
                                                                    .pollOption2!,
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 28.0,
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                  iconPadding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: Colors
                                                                      .transparent,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    width: 1.5,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              18.0),
                                                                ),
                                                              ),
                                                            ),
                                                            if (_model.pollOption3 !=
                                                                    null &&
                                                                _model.pollOption3 !=
                                                                    '')
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'Button pressed ...');
                                                                  },
                                                                  text: _model
                                                                      .pollOption3!,
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        28.0,
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Colors
                                                                        .transparent,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      width:
                                                                          1.5,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (_model.pollOption4 !=
                                                                    null &&
                                                                _model.pollOption4 !=
                                                                    '')
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'Button pressed ...');
                                                                  },
                                                                  text: _model
                                                                      .pollOption4!,
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        28.0,
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: Colors
                                                                        .transparent,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleSmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      width:
                                                                          1.5,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            18.0),
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'VIEW_OR_EDIT_CAMPAIGN_POST_Container_ltv');
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            _model.typeOfMediaUploaded =
                                                                'onlyText';
                                                            _model.numberOfImagesUploaded =
                                                                0;
                                                            _model.uploadedMedia =
                                                                [];
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: Color(
                                                                  0xD4080808),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              Icons.close,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              size: 16.0,
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 24.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (_model.typeOfMediaUploaded == 'onlyText')
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'VIEW_OR_EDIT_CAMPAIGN_POST_Container_eq0');
                                      logFirebaseEvent(
                                          'Container_store_media_for_upload');
                                      final selectedMedia = await selectMedia(
                                        mediaSource: MediaSource.photoGallery,
                                        multiImage: true,
                                      );
                                      if (selectedMedia != null &&
                                          selectedMedia.every((m) =>
                                              validateFileFormat(
                                                  m.storagePath, context))) {
                                        safeSetState(() =>
                                            _model.isDataUploading3 = true);
                                        var selectedUploadedFiles =
                                            <FFUploadedFile>[];

                                        try {
                                          showUploadMessage(
                                            context,
                                            'Uploading file...',
                                            showLoading: true,
                                          );
                                          selectedUploadedFiles = selectedMedia
                                              .map((m) => FFUploadedFile(
                                                    name: m.storagePath
                                                        .split('/')
                                                        .last,
                                                    bytes: m.bytes,
                                                    height:
                                                        m.dimensions?.height,
                                                    width: m.dimensions?.width,
                                                    blurHash: m.blurHash,
                                                  ))
                                              .toList();
                                        } finally {
                                          ScaffoldMessenger.of(context)
                                              .hideCurrentSnackBar();
                                          _model.isDataUploading3 = false;
                                        }
                                        if (selectedUploadedFiles.length ==
                                            selectedMedia.length) {
                                          safeSetState(() {
                                            _model.uploadedLocalFiles3 =
                                                selectedUploadedFiles;
                                          });
                                          showUploadMessage(
                                              context, 'Success!');
                                        } else {
                                          safeSetState(() {});
                                          showUploadMessage(
                                              context, 'Failed to upload data');
                                          return;
                                        }
                                      }

                                      if (_model
                                          .uploadedLocalFiles3.isNotEmpty) {
                                        logFirebaseEvent(
                                            'Container_update_page_state');
                                        _model.typeOfMediaUploaded =
                                            _model.uploadedLocalFiles3.length >
                                                    1
                                                ? 'multiImage'
                                                : 'singleImage';
                                        _model.numberOfImagesUploaded =
                                            _model.uploadedLocalFiles3.length;
                                        _model.uploadedMedia = _model
                                            .uploadedLocalFiles3
                                            .toList()
                                            .cast<FFUploadedFile>();
                                        safeSetState(() {});
                                      }
                                    },
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.image_outlined,
                                        color: Color(0xFF535252),
                                        size: 28.0,
                                      ),
                                    ),
                                  ),
                                if (_model.typeOfMediaUploaded == 'onlyText')
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'VIEW_OR_EDIT_CAMPAIGN_POST_Container_dm9');
                                      logFirebaseEvent(
                                          'Container_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: SizedBox(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.4,
                                                child: PostContentOptionsWidget(
                                                  mediaAction:
                                                      (uploadedMedia) async {
                                                    if (uploadedMedia != null &&
                                                        (uploadedMedia)
                                                            .isNotEmpty) {
                                                      logFirebaseEvent(
                                                          '_update_page_state');
                                                      _model.typeOfMediaUploaded =
                                                          uploadedMedia
                                                                      .length >
                                                                  1
                                                              ? 'multiImage'
                                                              : 'singleImage';
                                                      _model.numberOfImagesUploaded =
                                                          uploadedMedia.length;
                                                      _model.uploadedMedia =
                                                          uploadedMedia
                                                              .toList()
                                                              .cast<
                                                                  FFUploadedFile>();
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  documentAction:
                                                      (docURL, docTitle) async {
                                                    logFirebaseEvent(
                                                        '_update_page_state');
                                                    _model.typeOfMediaUploaded =
                                                        'doc';
                                                    _model.uploadedDoc = docURL;
                                                    _model.uploadedDocTitle =
                                                        docTitle;
                                                    safeSetState(() {});
                                                  },
                                                  saveAction: () async {
                                                    logFirebaseEvent(
                                                        '_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: const Text('Saved'),
                                                          content: const Text(
                                                              'Draft Saved'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: const Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  deleteAction: () async {
                                                    logFirebaseEvent(
                                                        '_backend_call');
                                                    await widget.postRef!
                                                        .delete();
                                                    logFirebaseEvent(
                                                        '_navigate_back');
                                                    context.safePop();
                                                  },
                                                  pollAction: (question,
                                                      option1,
                                                      option2,
                                                      option3,
                                                      option4,
                                                      duration) async {
                                                    logFirebaseEvent(
                                                        '_update_page_state');
                                                    _model.typeOfMediaUploaded =
                                                        'poll';
                                                    _model.pollQuestion =
                                                        question;
                                                    _model.pollOption1 =
                                                        option1;
                                                    _model.pollOption2 =
                                                        option2;
                                                    _model.pollOption3 =
                                                        option3;
                                                    _model.pollOption4 =
                                                        option4;
                                                    _model.pollDuration =
                                                        duration;
                                                    safeSetState(() {});
                                                  },
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: 50.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.add_rounded,
                                        color: Color(0xFF504E4E),
                                        size: 32.0,
                                      ),
                                    ),
                                  ),
                              ].divide(const SizedBox(width: 10.0)),
                            ),
                          ),
                        ),
                        if (_model.datePickerVisbile)
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 2.0,
                                sigmaY: 2.0,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'VIEW_OR_EDIT_CAMPAIGN_POST_Container_ae9');
                                        logFirebaseEvent(
                                            'Container_widget_animation');
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation']!
                                              .controller
                                              .reverse();
                                        }
                                        logFirebaseEvent(
                                            'Container_update_page_state');
                                        _model.datePickerVisbile = false;
                                        safeSetState(() {});
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: const BoxDecoration(),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 7.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            0.0,
                                            -2.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16.0),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 60.0,
                                                height: 3.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xFFE0E3E7),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 0.0, 0.0),
                                            child: Text(
                                              'Schedule',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .headlineSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 24.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts:
                                                        GoogleFonts.asMap()
                                                            .containsKey(
                                                                'Montserrat'),
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 12.0, 0.0, 4.0),
                                            child: Text(
                                              'Date *',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts:
                                                        GoogleFonts.asMap()
                                                            .containsKey(
                                                                'Montserrat'),
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'VIEW_OR_EDIT_CAMPAIGN_POST_Container_m63');
                                                logFirebaseEvent(
                                                    'Container_date_time_picker');
                                                final datePicked1Date =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate:
                                                      getCurrentTimestamp,
                                                  firstDate:
                                                      getCurrentTimestamp,
                                                  lastDate: DateTime(2050),
                                                  builder: (context, child) {
                                                    return wrapInMaterialDatePickerTheme(
                                                      context,
                                                      child!,
                                                      headerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      headerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      headerTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily,
                                                                fontSize: 32.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineLargeFamily),
                                                              ),
                                                      pickerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      pickerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      selectedDateTimeBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      selectedDateTimeForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      actionButtonForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      iconSize: 24.0,
                                                    );
                                                  },
                                                );

                                                if (datePicked1Date != null) {
                                                  safeSetState(() {
                                                    _model.datePicked1 =
                                                        DateTime(
                                                      datePicked1Date.year,
                                                      datePicked1Date.month,
                                                      datePicked1Date.day,
                                                    );
                                                  });
                                                }
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.scheduledDate =
                                                    _model.datePicked1;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 44.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: const Color(0xFF3D3D3D),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 8.0, 12.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        dateTimeFormat(
                                                            "yMMMd",
                                                            _model
                                                                .scheduledDate),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
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
                                                      ),
                                                      const Icon(
                                                        Icons
                                                            .calendar_month_sharp,
                                                        color:
                                                            Color(0xFF3F3D3D),
                                                        size: 20.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 20.0, 0.0, 4.0),
                                            child: Text(
                                              'Time *',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts:
                                                        GoogleFonts.asMap()
                                                            .containsKey(
                                                                'Montserrat'),
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'VIEW_OR_EDIT_CAMPAIGN_POST_Container_n0h');
                                                logFirebaseEvent(
                                                    'Container_date_time_picker');

                                                final datePicked2Time =
                                                    await showTimePicker(
                                                  context: context,
                                                  initialTime:
                                                      TimeOfDay.fromDateTime(
                                                          getCurrentTimestamp),
                                                  builder: (context, child) {
                                                    return wrapInMaterialTimePickerTheme(
                                                      context,
                                                      child!,
                                                      headerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      headerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      headerTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily,
                                                                fontSize: 32.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineLargeFamily),
                                                              ),
                                                      pickerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      pickerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      selectedDateTimeBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      selectedDateTimeForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      actionButtonForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      iconSize: 24.0,
                                                    );
                                                  },
                                                );
                                                if (datePicked2Time != null) {
                                                  safeSetState(() {
                                                    _model.datePicked2 =
                                                        DateTime(
                                                      getCurrentTimestamp.year,
                                                      getCurrentTimestamp.month,
                                                      getCurrentTimestamp.day,
                                                      datePicked2Time.hour,
                                                      datePicked2Time.minute,
                                                    );
                                                  });
                                                }
                                                logFirebaseEvent(
                                                    'Container_update_page_state');
                                                _model.scheduledTime =
                                                    _model.datePicked2;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 44.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: const Color(0xFF3D3D3D),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 8.0, 12.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        dateTimeFormat(
                                                            "jm",
                                                            _model
                                                                .scheduledTime),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
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
                                                      ),
                                                      const Icon(
                                                        Icons
                                                            .access_time_rounded,
                                                        color:
                                                            Color(0xFF3F3D3D),
                                                        size: 20.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 0.0),
                                            child: Text(
                                              '(UTC+05:30) Chennai, Kolkata, Mumbai, New Delhi',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
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
                                            ),
                                          ),
                                          if (!_model.isScheduled)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 44.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'VIEW_OR_EDIT_CAMPAIGN_POST_NEXT_BTN_ON_T');
                                                  logFirebaseEvent(
                                                      'Button_widget_animation');
                                                  if (animationsMap[
                                                          'containerOnActionTriggerAnimation'] !=
                                                      null) {
                                                    await animationsMap[
                                                            'containerOnActionTriggerAnimation']!
                                                        .controller
                                                        .reverse();
                                                  }
                                                  logFirebaseEvent(
                                                      'Button_update_page_state');
                                                  _model.isScheduled = true;
                                                  _model.datePickerVisbile =
                                                      false;
                                                  safeSetState(() {});
                                                },
                                                text: 'Next',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 32.0,
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.white,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Montserrat'),
                                                      ),
                                                  borderSide: const BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                              ),
                                            ),
                                          if (_model.isScheduled)
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 44.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'VIEW_OR_EDIT_CAMPAIGN_POST_CANCEL_SCHEDU');
                                                        logFirebaseEvent(
                                                            'Button_widget_animation');
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation'] !=
                                                            null) {
                                                          animationsMap[
                                                                  'containerOnActionTriggerAnimation']!
                                                              .controller
                                                              .reverse();
                                                        }
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model.scheduledTime =
                                                            null;
                                                        _model.scheduledDate =
                                                            null;
                                                        _model.isScheduled =
                                                            false;
                                                        _model.datePickerVisbile =
                                                            false;
                                                        safeSetState(() {});
                                                        logFirebaseEvent(
                                                            'Button_backend_call');
                                                        await _model
                                                            .scheduledDocument!
                                                            .delete();
                                                      },
                                                      text: 'Cancel Schedule',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 32.0,
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
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            Colors.transparent,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
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
                                                                          'Montserrat'),
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'VIEW_OR_EDIT_CAMPAIGN_POST_NEXT_BTN_ON_T');
                                                        logFirebaseEvent(
                                                            'Button_backend_call');

                                                        await _model
                                                            .scheduledDocument!
                                                            .update(
                                                                createScheduledPostsRecordData(
                                                          timestamp: functions
                                                              .combineDateTime(
                                                                  _model
                                                                      .scheduledDate!,
                                                                  _model
                                                                      .scheduledTime!),
                                                        ));
                                                        logFirebaseEvent(
                                                            'Button_widget_animation');
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation'] !=
                                                            null) {
                                                          await animationsMap[
                                                                  'containerOnActionTriggerAnimation']!
                                                              .controller
                                                              .reverse();
                                                        }
                                                        logFirebaseEvent(
                                                            'Button_update_page_state');
                                                        _model.datePickerVisbile =
                                                            false;
                                                        safeSetState(() {});
                                                      },
                                                      text: 'Next',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 32.0,
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
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .white,
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
                                                                          'Montserrat'),
                                                                ),
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24.0),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 16.0)),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).animateOnActionTrigger(
                            animationsMap['containerOnActionTriggerAnimation']!,
                          ),
                      ],
                    ),
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
