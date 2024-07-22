import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/exit_dialog_widget.dart';
import '/components/post_content_options_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view_or_edit_post_model.dart';
export 'view_or_edit_post_model.dart';

class ViewOrEditPostWidget extends StatefulWidget {
  const ViewOrEditPostWidget({
    super.key,
    required this.postText,
    required this.postRef,
    required this.postTitle,
    this.oneLinerIndex,
  });

  final String? postText;
  final DocumentReference? postRef;
  final String? postTitle;
  final int? oneLinerIndex;

  @override
  State<ViewOrEditPostWidget> createState() => _ViewOrEditPostWidgetState();
}

class _ViewOrEditPostWidgetState extends State<ViewOrEditPostWidget>
    with TickerProviderStateMixin {
  late ViewOrEditPostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewOrEditPostModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'viewOrEditPost'});

    _model.textFieldFocusNode ??= FocusNode();

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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

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
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 12.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) => Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'VIEW_OR_EDIT_POST_Icon_gr9oprw7_ON_TAP');
                                            if (_model.textController.text !=
                                                widget.postText) {
                                              logFirebaseEvent(
                                                  'Icon_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        const AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: ExitDialogWidget(
                                                        saveAction: () async {
                                                          logFirebaseEvent(
                                                              '_backend_call');

                                                          await widget.postRef!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'content':
                                                                    FieldValue
                                                                        .delete(),
                                                              },
                                                            ),
                                                          });
                                                          logFirebaseEvent(
                                                              '_backend_call');

                                                          await widget.postRef!
                                                              .update({
                                                            ...createCreatedPostsRecordData(
                                                              topic: widget
                                                                  .postTitle,
                                                            ),
                                                            ...mapToFirestore(
                                                              {
                                                                'content':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  _model
                                                                      .textController
                                                                      .text
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                          logFirebaseEvent(
                                                              '_navigate_to');

                                                          context.goNamed(
                                                              'allPostsOverview');
                                                        },
                                                        discardAction:
                                                            () async {
                                                          logFirebaseEvent(
                                                              '_navigate_to');

                                                          context.goNamed(
                                                              'allPostsOverview');
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            } else {
                                              logFirebaseEvent(
                                                  'Icon_navigate_back');
                                              context.safePop();
                                            }
                                          },
                                          child: Icon(
                                            Icons.close,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
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
                                                  ? valueOrDefault<String>(
                                                      (currentUserDocument
                                                                  ?.profilePictureLinks
                                                                  .toList() ??
                                                              [])
                                                          .first,
                                                      'https://media.licdn.com/dms/image/D4D03AQF_8fEtGdSJTQ/profile-displayphoto-shrink_100_100/0/1683101018648?e=1720656000&v=beta&t=4iLxpsgMzhXGvsc9qJB__5w1KkW1oRunUf_TkVD18Ao',
                                                    )
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
                                              '${currentUserDocument?.linkedinScrapped.firstName}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    useGoogleFonts:
                                                        GoogleFonts.asMap()
                                                            .containsKey(
                                                                'Outfit'),
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'VIEW_OR_EDIT_POST_Icon_ryam30mi_ON_TAP');
                                        if (valueOrDefault<bool>(
                                            currentUserDocument
                                                ?.linkedinConnected,
                                            false)) {
                                          if (_model.isScheduled) {
                                            logFirebaseEvent(
                                                'Icon_update_page_state');
                                            _model.datePickerVisbile = true;
                                            setState(() {});
                                            logFirebaseEvent(
                                                'Icon_wait__delay');
                                            await Future.delayed(const Duration(
                                                milliseconds: 100));
                                            logFirebaseEvent(
                                                'Icon_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation'] !=
                                                null) {
                                              await animationsMap[
                                                      'containerOnActionTriggerAnimation']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                          } else {
                                            logFirebaseEvent(
                                                'Icon_update_page_state');
                                            _model.scheduledTime =
                                                getCurrentTimestamp;
                                            _model.scheduledDate =
                                                getCurrentTimestamp;
                                            _model.datePickerVisbile = true;
                                            setState(() {});
                                            logFirebaseEvent(
                                                'Icon_wait__delay');
                                            await Future.delayed(const Duration(
                                                milliseconds: 100));
                                            logFirebaseEvent(
                                                'Icon_widget_animation');
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation'] !=
                                                null) {
                                              await animationsMap[
                                                      'containerOnActionTriggerAnimation']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
                                          }
                                        } else {
                                          logFirebaseEvent('Icon_alert_dialog');
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Linkedin Not Connected!'),
                                                        content: const Text(
                                                            'To be able to post to Linkedin, you need to connect your account.'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    false),
                                                            child:
                                                                const Text('Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext,
                                                                    true),
                                                            child: const Text(
                                                                'Let\'s Connect'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            logFirebaseEvent(
                                                'Icon_navigate_to');

                                            context
                                                .pushNamed('linkedinConnect');
                                          }
                                        }
                                      },
                                      child: const Icon(
                                        Icons.access_time_rounded,
                                        color: Color(0xFF6F6E6E),
                                        size: 24.0,
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        if (_model.typeOfMediaUploaded ==
                                            'onlyText')
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'VIEW_OR_EDIT_POST_onlyTextButton_ON_TAP');
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.linkedinConnected,
                                                  false)) {
                                                logFirebaseEvent(
                                                    'onlyTextButton_backend_call');
                                                _model.linkedinPost =
                                                    await LinkedinPostGroup
                                                        .postOnlyTextCall
                                                        .call(
                                                  personUrn: valueOrDefault(
                                                      currentUserDocument
                                                          ?.linkedinUrn,
                                                      ''),
                                                  postText: functions
                                                      .formatStringForLIJson(
                                                          _model.textController
                                                              .text),
                                                  accessToken: valueOrDefault(
                                                      currentUserDocument
                                                          ?.linkedinAccess,
                                                      ''),
                                                );

                                                if ((_model.linkedinPost
                                                        ?.succeeded ??
                                                    true)) {
                                                  logFirebaseEvent(
                                                      'onlyTextButton_alert_dialog');
                                                  unawaited(
                                                    () async {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Success'),
                                                            content: const Text(
                                                                'Your post has been successfully posted!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }(),
                                                  );
                                                  logFirebaseEvent(
                                                      'onlyTextButton_backend_call');

                                                  await widget.postRef!.update(
                                                      createCreatedPostsRecordData(
                                                    status: 'Posted',
                                                  ));
                                                  logFirebaseEvent(
                                                      'onlyTextButton_backend_call');

                                                  await PostedOnLinkedinRecord
                                                          .createDoc(
                                                              currentUserReference!)
                                                      .set(
                                                          createPostedOnLinkedinRecordData(
                                                    postURN: (_model
                                                            .linkedinPost
                                                            ?.getHeader(
                                                                'x-linkedin-id') ??
                                                        ''),
                                                    postedOn:
                                                        getCurrentTimestamp,
                                                    postText: _model
                                                        .textController.text,
                                                    postTitle:
                                                        widget.postTitle,
                                                    reactionRefreshQuota: 2,
                                                    typeOfPost: 'onlyText',
                                                  ));
                                                  logFirebaseEvent(
                                                      'onlyTextButton_navigate_to');

                                                  context.goNamed(
                                                      'allPostsOverview');
                                                } else {
                                                  logFirebaseEvent(
                                                      'onlyTextButton_alert_dialog');
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: const Text('Failed'),
                                                        content: const Text(
                                                            'Posting action failed!'),
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
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'onlyTextButton_alert_dialog');
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Linkedin Not Connected!'),
                                                              content: const Text(
                                                                  'To be able to post to Linkedin, you need to connect your account.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: const Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: const Text(
                                                                      'Let\'s Connect'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  logFirebaseEvent(
                                                      'onlyTextButton_navigate_to');

                                                  context.pushNamed(
                                                      'linkedinConnect');
                                                }
                                              }

                                              setState(() {});
                                            },
                                            text: 'Post',
                                            options: FFButtonOptions(
                                              width: 60.0,
                                              height: 32.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'Plus Jakarta Sans'),
                                                      ),
                                              elevation: 2.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        if (_model.typeOfMediaUploaded == 'doc')
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'VIEW_OR_EDIT_POST_PAGE_docButton_ON_TAP');
                                              var shouldSetState = false;
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.linkedinConnected,
                                                  false)) {
                                                if (_model
                                                        .typeOfMediaUploaded ==
                                                    'doc') {
                                                  logFirebaseEvent(
                                                      'docButton_upload_file_to_firebase');
                                                  {
                                                    setState(() => _model
                                                            .isDataUploading1 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];
                                                    var selectedFiles =
                                                        <SelectedFile>[];
                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      selectedUploadedFiles =
                                                          _model
                                                                  .uploadedDoc!
                                                                  .bytes!
                                                                  .isNotEmpty
                                                              ? [
                                                                  _model
                                                                      .uploadedDoc!
                                                                ]
                                                              : <FFUploadedFile>[];
                                                      selectedFiles =
                                                          selectedFilesFromUploadedFiles(
                                                        selectedUploadedFiles,
                                                      );
                                                      downloadUrls =
                                                          (await Future.wait(
                                                        selectedFiles.map(
                                                          (f) async =>
                                                              await uploadData(
                                                                  f.storagePath,
                                                                  f.bytes),
                                                        ),
                                                      ))
                                                              .where((u) =>
                                                                  u != null)
                                                              .map((u) => u!)
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading1 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedFiles
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedFiles
                                                                .length) {
                                                      setState(() {
                                                        _model.uploadedLocalFile1 =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl1 =
                                                            downloadUrls.first;
                                                      });
                                                    } else {
                                                      setState(() {});
                                                      return;
                                                    }
                                                  }

                                                  logFirebaseEvent(
                                                      'docButton_backend_call');
                                                  _model.liDocURL =
                                                      await GetDocUploadUrlFromLinkedinCall
                                                          .call(
                                                    urn: valueOrDefault(
                                                        currentUserDocument
                                                            ?.linkedinUrn,
                                                        ''),
                                                    accessToken: valueOrDefault(
                                                        currentUserDocument
                                                            ?.linkedinAccess,
                                                        ''),
                                                  );

                                                  shouldSetState = true;
                                                  if ((_model.liDocURL
                                                          ?.succeeded ??
                                                      true)) {
                                                    logFirebaseEvent(
                                                        'docButton_backend_call');
                                                    _model.docUploaded =
                                                        await UploadDocToLinkedinCall
                                                            .call(
                                                      accessToken: valueOrDefault(
                                                          currentUserDocument
                                                              ?.linkedinAccess,
                                                          ''),
                                                      uploadUrl:
                                                          GetDocUploadUrlFromLinkedinCall
                                                              .uploadURL(
                                                        (_model.liDocURL
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      docToBeUploaded: _model
                                                          .uploadedFileUrl1,
                                                    );

                                                    shouldSetState = true;
                                                    if ((_model.docUploaded
                                                            ?.succeeded ??
                                                        true)) {
                                                      logFirebaseEvent(
                                                          'docButton_backend_call');
                                                      _model.apiResult9vv =
                                                          await LinkedinPostGroup
                                                              .postTextWithMediaCall
                                                              .call(
                                                        personUrn: valueOrDefault(
                                                            currentUserDocument
                                                                ?.linkedinUrn,
                                                            ''),
                                                        postText: functions
                                                            .formatStringForLIJson(
                                                                _model
                                                                    .textController
                                                                    .text),
                                                        mediaId:
                                                            GetDocUploadUrlFromLinkedinCall
                                                                .docURN(
                                                          (_model.liDocURL
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ),
                                                        accessToken: valueOrDefault(
                                                            currentUserDocument
                                                                ?.linkedinAccess,
                                                            ''),
                                                      );

                                                      shouldSetState = true;
                                                      if ((_model.apiResult9vv
                                                              ?.succeeded ??
                                                          true)) {
                                                        logFirebaseEvent(
                                                            'docButton_alert_dialog');
                                                        unawaited(
                                                          () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: const Text(
                                                                      'Success'),
                                                                  content: const Text(
                                                                      'Your post has been successfully posted!'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: const Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          }(),
                                                        );
                                                        logFirebaseEvent(
                                                            'docButton_backend_call');

                                                        await widget.postRef!
                                                            .update(
                                                                createCreatedPostsRecordData(
                                                          status: 'Posted',
                                                        ));
                                                        logFirebaseEvent(
                                                            'docButton_backend_call');

                                                        await PostedOnLinkedinRecord
                                                                .createDoc(
                                                                    currentUserReference!)
                                                            .set(
                                                                createPostedOnLinkedinRecordData(
                                                          postURN: (_model
                                                                  .apiResult9vv
                                                                  ?.getHeader(
                                                                      'x-linkedin-id') ??
                                                              ''),
                                                          postedOn:
                                                              getCurrentTimestamp,
                                                          postText: _model
                                                              .textController
                                                              .text,
                                                          postTitle:
                                                              widget.postTitle,
                                                          reactionRefreshQuota:
                                                              2,
                                                          docUrn:
                                                              GetDocUploadUrlFromLinkedinCall
                                                                  .docURN(
                                                            (_model.liDocURL
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          uploadedDocUrl:
                                                              GetDocUploadUrlFromLinkedinCall
                                                                  .uploadURL(
                                                            (_model.liDocURL
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          typeOfPost: 'doc',
                                                        ));
                                                        logFirebaseEvent(
                                                            'docButton_navigate_to');

                                                        context.goNamed(
                                                            'allPostsOverview');
                                                      } else {
                                                        logFirebaseEvent(
                                                            'docButton_alert_dialog');
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Posting Failed!'),
                                                              content: const Text(
                                                                  'Your doc could not be uploaded to linkedin.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }
                                                    } else {
                                                      logFirebaseEvent(
                                                          'docButton_alert_dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                'Upload Failed!'),
                                                            content: const Text(
                                                                'Your doc could not be uploaded to linkedin.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                      return;
                                                    }
                                                  } else {
                                                    logFirebaseEvent(
                                                        'docButton_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'Upload Failed!'),
                                                          content: const Text(
                                                              'Your doc could not be uploaded to linkedin.'),
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
                                                    if (shouldSetState) {
                                                      setState(() {});
                                                    }
                                                    return;
                                                  }
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'docButton_alert_dialog');
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Linkedin Not Connected!'),
                                                              content: const Text(
                                                                  'To be able to post to Linkedin, you need to connect your account.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: const Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: const Text(
                                                                      'Let\'s Connect'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  logFirebaseEvent(
                                                      'docButton_navigate_to');

                                                  context.pushNamed(
                                                      'linkedinConnect');
                                                }
                                              }

                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                            },
                                            text: 'Post',
                                            options: FFButtonOptions(
                                              width: 60.0,
                                              height: 32.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'Plus Jakarta Sans'),
                                                      ),
                                              elevation: 2.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        if ((_model.typeOfMediaUploaded ==
                                                'singleImage') ||
                                            (_model.typeOfMediaUploaded ==
                                                'multiImage'))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'VIEW_OR_EDIT_POST_imageButton_ON_TAP');
                                              var shouldSetState = false;
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.linkedinConnected,
                                                  false)) {
                                                logFirebaseEvent(
                                                    'imageButton_upload_media_to_firebase');
                                                {
                                                  setState(() => _model
                                                      .isDataUploading2 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];
                                                  var selectedMedia =
                                                      <SelectedFile>[];
                                                  var downloadUrls = <String>[];
                                                  try {
                                                    selectedUploadedFiles =
                                                        _model.uploadedMedia;
                                                    selectedMedia =
                                                        selectedFilesFromUploadedFiles(
                                                      selectedUploadedFiles,
                                                      isMultiData: true,
                                                    );
                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedMedia.map(
                                                        (m) async =>
                                                            await uploadData(
                                                                m.storagePath,
                                                                m.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isDataUploading2 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedMedia
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedMedia
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFiles2 =
                                                          selectedUploadedFiles;
                                                      _model.uploadedFileUrls2 =
                                                          downloadUrls;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                while (_model
                                                        .noOfImagesUploadedToFirebase <
                                                    _model
                                                        .numberOfImagesUploaded) {
                                                  logFirebaseEvent(
                                                      'imageButton_backend_call');
                                                  _model.imageUrl =
                                                      await GetImageUploadUrlFromLinkedinCall
                                                          .call(
                                                    urn: valueOrDefault(
                                                        currentUserDocument
                                                            ?.linkedinUrn,
                                                        ''),
                                                    accessToken: valueOrDefault(
                                                        currentUserDocument
                                                            ?.linkedinAccess,
                                                        ''),
                                                  );

                                                  shouldSetState = true;
                                                  if ((_model.imageUrl
                                                          ?.succeeded ??
                                                      true)) {
                                                    logFirebaseEvent(
                                                        'imageButton_backend_call');
                                                    _model.imageUploaded =
                                                        await UploadImageToLinkedinCall
                                                            .call(
                                                      accessToken: valueOrDefault(
                                                          currentUserDocument
                                                              ?.linkedinAccess,
                                                          ''),
                                                      uploadUrl:
                                                          GetImageUploadUrlFromLinkedinCall
                                                              .uploadURL(
                                                        (_model.imageUrl
                                                                ?.jsonBody ??
                                                            ''),
                                                      ),
                                                      imageToBeUploaded: _model
                                                              .uploadedFileUrls2[
                                                          _model
                                                              .noOfImagesUploadedToFirebase],
                                                    );

                                                    shouldSetState = true;
                                                    if ((_model.imageUploaded
                                                            ?.succeeded ??
                                                        true)) {
                                                      if (_model
                                                              .noOfImagesUploadedToFirebase >=
                                                          1) {
                                                        logFirebaseEvent(
                                                            'imageButton_backend_call');

                                                        await _model
                                                            .createdDocRefrence!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'imageUrns':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                GetImageUploadUrlFromLinkedinCall
                                                                    .imageURN(
                                                                  (_model.imageUrl
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )
                                                              ]),
                                                              'uploadedImageUrls':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                GetImageUploadUrlFromLinkedinCall
                                                                    .uploadURL(
                                                                  (_model.imageUrl
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        logFirebaseEvent(
                                                            'imageButton_update_page_state');
                                                        _model.noOfImagesUploadedToFirebase =
                                                            _model.noOfImagesUploadedToFirebase +
                                                                1;
                                                        setState(() {});
                                                      } else {
                                                        logFirebaseEvent(
                                                            'imageButton_backend_call');

                                                        var postedOnLinkedinRecordReference =
                                                            PostedOnLinkedinRecord
                                                                .createDoc(
                                                                    currentUserReference!);
                                                        await postedOnLinkedinRecordReference
                                                            .set({
                                                          ...mapToFirestore(
                                                            {
                                                              'imageUrns': [
                                                                GetImageUploadUrlFromLinkedinCall
                                                                    .imageURN(
                                                                  (_model.imageUrl
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )
                                                              ],
                                                              'uploadedImageUrls':
                                                                  [
                                                                GetImageUploadUrlFromLinkedinCall
                                                                    .uploadURL(
                                                                  (_model.imageUrl
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )
                                                              ],
                                                            },
                                                          ),
                                                        });
                                                        _model.createdDocRefrence =
                                                            PostedOnLinkedinRecord
                                                                .getDocumentFromData({
                                                          ...mapToFirestore(
                                                            {
                                                              'imageUrns': [
                                                                GetImageUploadUrlFromLinkedinCall
                                                                    .imageURN(
                                                                  (_model.imageUrl
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )
                                                              ],
                                                              'uploadedImageUrls':
                                                                  [
                                                                GetImageUploadUrlFromLinkedinCall
                                                                    .uploadURL(
                                                                  (_model.imageUrl
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )
                                                              ],
                                                            },
                                                          ),
                                                        }, postedOnLinkedinRecordReference);
                                                        shouldSetState = true;
                                                        logFirebaseEvent(
                                                            'imageButton_update_page_state');
                                                        _model.noOfImagesUploadedToFirebase =
                                                            _model.noOfImagesUploadedToFirebase +
                                                                1;
                                                        setState(() {});
                                                      }
                                                    } else {
                                                      logFirebaseEvent(
                                                          'imageButton_alert_dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                                'Image upload Failed!'),
                                                            content: const Text(
                                                                'Your images could not be uploaded to linkedin.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                      if (shouldSetState) {
                                                        setState(() {});
                                                      }
                                                      return;
                                                    }
                                                  } else {
                                                    logFirebaseEvent(
                                                        'imageButton_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'Image upload Failed!'),
                                                          content: const Text(
                                                              'Your images could not be uploaded to linkedin.'),
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
                                                    if (shouldSetState) {
                                                      setState(() {});
                                                    }
                                                    return;
                                                  }
                                                }
                                                if (_model
                                                        .numberOfImagesUploaded >
                                                    1) {
                                                  logFirebaseEvent(
                                                      'imageButton_backend_call');
                                                  _model.multiImgPosted =
                                                      await LinkedinPostGroup
                                                          .postTextWithMultipleImagesCall
                                                          .call(
                                                    personUrn: valueOrDefault(
                                                        currentUserDocument
                                                            ?.linkedinUrn,
                                                        ''),
                                                    postText: functions
                                                        .formatStringForLIJson(
                                                            _model
                                                                .textController
                                                                .text),
                                                    imagesJson: functions
                                                        .valueToJsonMapList(
                                                            _model
                                                                .createdDocRefrence!
                                                                .imageUrns
                                                                .toList(),
                                                            'id'),
                                                    accessToken: valueOrDefault(
                                                        currentUserDocument
                                                            ?.linkedinAccess,
                                                        ''),
                                                  );

                                                  shouldSetState = true;
                                                  if ((_model.multiImgPosted
                                                          ?.succeeded ??
                                                      true)) {
                                                    logFirebaseEvent(
                                                        'imageButton_alert_dialog');
                                                    unawaited(
                                                      () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Success'),
                                                              content: const Text(
                                                                  'Your post has been successfully posted!'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }(),
                                                    );
                                                    logFirebaseEvent(
                                                        'imageButton_backend_call');

                                                    await widget.postRef!.update(
                                                        createCreatedPostsRecordData(
                                                      status: 'Posted',
                                                    ));
                                                    logFirebaseEvent(
                                                        'imageButton_backend_call');

                                                    await _model
                                                        .createdDocRefrence!
                                                        .reference
                                                        .update(
                                                            createPostedOnLinkedinRecordData(
                                                      postURN: (_model
                                                              .multiImgPosted
                                                              ?.getHeader(
                                                                  'x-linkedin-id') ??
                                                          ''),
                                                      postedOn:
                                                          getCurrentTimestamp,
                                                      postText: _model
                                                          .textController.text,
                                                      postTitle:
                                                          widget.postTitle,
                                                      typeOfPost: 'multiImage',
                                                      reactionRefreshQuota: 2,
                                                    ));
                                                    logFirebaseEvent(
                                                        'imageButton_navigate_to');

                                                    context.goNamed(
                                                        'allPostsOverview');
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'imageButton_backend_call');
                                                  _model.singleImgPosted =
                                                      await LinkedinPostGroup
                                                          .postTextWithMediaCall
                                                          .call(
                                                    personUrn: valueOrDefault(
                                                        currentUserDocument
                                                            ?.linkedinUrn,
                                                        ''),
                                                    postText: functions
                                                        .formatStringForLIJson(
                                                            _model
                                                                .textController
                                                                .text),
                                                    mediaId:
                                                        GetImageUploadUrlFromLinkedinCall
                                                            .imageURN(
                                                      (_model.imageUrl
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    accessToken: valueOrDefault(
                                                        currentUserDocument
                                                            ?.linkedinAccess,
                                                        ''),
                                                  );

                                                  shouldSetState = true;
                                                  if ((_model.singleImgPosted
                                                          ?.succeeded ??
                                                      true)) {
                                                    logFirebaseEvent(
                                                        'imageButton_alert_dialog');
                                                    unawaited(
                                                      () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Success'),
                                                              content: const Text(
                                                                  'Your post has been successfully posted!'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }(),
                                                    );
                                                    logFirebaseEvent(
                                                        'imageButton_backend_call');

                                                    await widget.postRef!.update(
                                                        createCreatedPostsRecordData(
                                                      status: 'Posted',
                                                    ));
                                                    logFirebaseEvent(
                                                        'imageButton_backend_call');

                                                    await _model
                                                        .createdDocRefrence!
                                                        .reference
                                                        .update(
                                                            createPostedOnLinkedinRecordData(
                                                      postURN: (_model
                                                              .singleImgPosted
                                                              ?.getHeader(
                                                                  'x-linkedin-id') ??
                                                          ''),
                                                      postedOn:
                                                          getCurrentTimestamp,
                                                      postText: _model
                                                          .textController.text,
                                                      postTitle:
                                                          widget.postTitle,
                                                      typeOfPost: 'singleImage',
                                                      reactionRefreshQuota: 2,
                                                    ));
                                                    logFirebaseEvent(
                                                        'imageButton_navigate_to');

                                                    context.goNamed(
                                                        'allPostsOverview');
                                                  }
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'imageButton_alert_dialog');
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Linkedin Not Connected!'),
                                                              content: const Text(
                                                                  'To be able to post to Linkedin, you need to connect your account.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: const Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: const Text(
                                                                      'Let\'s Connect'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  logFirebaseEvent(
                                                      'imageButton_navigate_to');

                                                  context.pushNamed(
                                                      'linkedinConnect');
                                                }
                                              }

                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                            },
                                            text: 'Post',
                                            options: FFButtonOptions(
                                              width: 60.0,
                                              height: 32.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'Plus Jakarta Sans'),
                                                      ),
                                              elevation: 2.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        if (_model.typeOfMediaUploaded ==
                                            'poll')
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'VIEW_OR_EDIT_POST_PAGE_pollButton_ON_TAP');
                                              if (valueOrDefault<bool>(
                                                  currentUserDocument
                                                      ?.linkedinConnected,
                                                  false)) {
                                                await Future.wait([
                                                  Future(() async {
                                                    logFirebaseEvent(
                                                        'pollButton_update_page_state');
                                                    _model.addToPollOptionsList(
                                                        _model.pollOption1!);
                                                    setState(() {});
                                                  }),
                                                  Future(() async {
                                                    logFirebaseEvent(
                                                        'pollButton_update_page_state');
                                                    _model.addToPollOptionsList(
                                                        _model.pollOption2!);
                                                    setState(() {});
                                                  }),
                                                  Future(() async {
                                                    if (_model.pollOption3 !=
                                                            null &&
                                                        _model.pollOption3 !=
                                                            '') {
                                                      logFirebaseEvent(
                                                          'pollButton_update_page_state');
                                                      _model
                                                          .addToPollOptionsList(
                                                              _model
                                                                  .pollOption3!);
                                                      setState(() {});
                                                    }
                                                  }),
                                                  Future(() async {
                                                    if (_model.pollOption4 !=
                                                            null &&
                                                        _model.pollOption4 !=
                                                            '') {
                                                      logFirebaseEvent(
                                                          'pollButton_update_page_state');
                                                      _model
                                                          .addToPollOptionsList(
                                                              _model
                                                                  .pollOption4!);
                                                      setState(() {});
                                                    }
                                                  }),
                                                ]);
                                                logFirebaseEvent(
                                                    'pollButton_backend_call');
                                                _model.linkedinPollPost =
                                                    await LinkedinPostGroup
                                                        .postTextWithPollCall
                                                        .call(
                                                  personUrn: valueOrDefault(
                                                      currentUserDocument
                                                          ?.linkedinUrn,
                                                      ''),
                                                  accessToken: valueOrDefault(
                                                      currentUserDocument
                                                          ?.linkedinAccess,
                                                      ''),
                                                  postText: functions
                                                      .formatStringForLIJson(
                                                          _model.textController
                                                              .text),
                                                  question: _model.pollQuestion,
                                                  duration: _model.pollDuration,
                                                  optionsJson: functions
                                                      .valueToJsonMapList(
                                                          _model.pollOptionsList
                                                              .toList(),
                                                          'text'),
                                                );

                                                if ((_model.linkedinPollPost
                                                        ?.succeeded ??
                                                    true)) {
                                                  logFirebaseEvent(
                                                      'pollButton_alert_dialog');
                                                  unawaited(
                                                    () async {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title:
                                                                const Text('Success'),
                                                            content: const Text(
                                                                'Your post has been successfully posted!'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }(),
                                                  );
                                                  logFirebaseEvent(
                                                      'pollButton_backend_call');

                                                  await widget.postRef!.update(
                                                      createCreatedPostsRecordData(
                                                    status: 'Posted',
                                                  ));
                                                  logFirebaseEvent(
                                                      'pollButton_backend_call');

                                                  await PostedOnLinkedinRecord
                                                          .createDoc(
                                                              currentUserReference!)
                                                      .set({
                                                    ...createPostedOnLinkedinRecordData(
                                                      postURN: (_model
                                                              .linkedinPollPost
                                                              ?.getHeader(
                                                                  'x-linkedin-id') ??
                                                          ''),
                                                      postedOn:
                                                          getCurrentTimestamp,
                                                      postText: _model
                                                          .textController.text,
                                                      postTitle:
                                                          widget.postTitle,
                                                      reactionRefreshQuota: 2,
                                                      typeOfPost: 'poll',
                                                      pollQuestion:
                                                          _model.pollQuestion,
                                                      pollDuration:
                                                          _model.pollDuration,
                                                    ),
                                                    ...mapToFirestore(
                                                      {
                                                        'pollOptions': _model
                                                            .pollOptionsList,
                                                      },
                                                    ),
                                                  });
                                                  logFirebaseEvent(
                                                      'pollButton_navigate_to');

                                                  context.goNamed(
                                                      'allPostsOverview');
                                                } else {
                                                  logFirebaseEvent(
                                                      'pollButton_alert_dialog');
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: const Text('Failed'),
                                                        content: const Text(
                                                            'Posting action failed!'),
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
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'pollButton_alert_dialog');
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'Linkedin Not Connected!'),
                                                              content: const Text(
                                                                  'To be able to post to Linkedin, you need to connect your account.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: const Text(
                                                                      'Cancel'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: const Text(
                                                                      'Let\'s Connect'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  logFirebaseEvent(
                                                      'pollButton_navigate_to');

                                                  context.pushNamed(
                                                      'linkedinConnect');
                                                }
                                              }

                                              setState(() {});
                                            },
                                            text: 'Post',
                                            options: FFButtonOptions(
                                              width: 60.0,
                                              height: 32.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'Plus Jakarta Sans'),
                                                      ),
                                              elevation: 2.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        if (_model.isScheduled &&
                                            (_model.typeOfMediaUploaded ==
                                                'onlyText'))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'VIEW_OR_EDIT_POST_scheduleOnlyText_ON_TA');
                                              logFirebaseEvent(
                                                  'scheduleOnlyText_backend_call');

                                              await ScheduledPostsRecord
                                                  .collection
                                                  .doc()
                                                  .set(
                                                      createScheduledPostsRecordData(
                                                    userRef:
                                                        currentUserReference,
                                                    timestamp: functions
                                                        .combineDateTime(
                                                            _model
                                                                .scheduledDate!,
                                                            _model
                                                                .scheduledTime!),
                                                    timeOfCreation:
                                                        getCurrentTimestamp,
                                                    postType: _model
                                                        .typeOfMediaUploaded,
                                                    personUrn: valueOrDefault(
                                                        currentUserDocument
                                                            ?.linkedinUrn,
                                                        ''),
                                                    accessToken: valueOrDefault(
                                                        currentUserDocument
                                                            ?.linkedinAccess,
                                                        ''),
                                                    postText: _model
                                                        .textController.text,
                                                    status: 'pending',
                                                    postTitle:
                                                        widget.postTitle,
                                                  ));
                                              logFirebaseEvent(
                                                  'scheduleOnlyText_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text('Success'),
                                                    content: const Text(
                                                        'Your post has been successfully scheduled!'),
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
                                              logFirebaseEvent(
                                                  'scheduleOnlyText_backend_call');

                                              await widget.postRef!.update(
                                                  createCreatedPostsRecordData(
                                                status: 'Scheduled',
                                              ));
                                              logFirebaseEvent(
                                                  'scheduleOnlyText_navigate_to');

                                              context
                                                  .goNamed('allPostsOverview');
                                            },
                                            text: 'Schedule',
                                            options: FFButtonOptions(
                                              width: 88.0,
                                              height: 32.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'Plus Jakarta Sans'),
                                                      ),
                                              elevation: 2.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        if (_model.isScheduled &&
                                            (_model.typeOfMediaUploaded ==
                                                'doc'))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'VIEW_OR_EDIT_POST_scheduleDoc_ON_TAP');
                                              if (_model.typeOfMediaUploaded ==
                                                  'doc') {
                                                logFirebaseEvent(
                                                    'scheduleDoc_upload_file_to_firebase');
                                                {
                                                  setState(() => _model
                                                      .isDataUploading3 = true);
                                                  var selectedUploadedFiles =
                                                      <FFUploadedFile>[];
                                                  var selectedFiles =
                                                      <SelectedFile>[];
                                                  var downloadUrls = <String>[];
                                                  try {
                                                    selectedUploadedFiles =
                                                        _model
                                                                .uploadedDoc!
                                                                .bytes!
                                                                .isNotEmpty
                                                            ? [
                                                                _model
                                                                    .uploadedDoc!
                                                              ]
                                                            : <FFUploadedFile>[];
                                                    selectedFiles =
                                                        selectedFilesFromUploadedFiles(
                                                      selectedUploadedFiles,
                                                    );
                                                    downloadUrls = (await Future
                                                            .wait(
                                                      selectedFiles.map(
                                                        (f) async =>
                                                            await uploadData(
                                                                f.storagePath,
                                                                f.bytes),
                                                      ),
                                                    ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                                  } finally {
                                                    _model.isDataUploading3 =
                                                        false;
                                                  }
                                                  if (selectedUploadedFiles
                                                              .length ==
                                                          selectedFiles
                                                              .length &&
                                                      downloadUrls.length ==
                                                          selectedFiles
                                                              .length) {
                                                    setState(() {
                                                      _model.uploadedLocalFile3 =
                                                          selectedUploadedFiles
                                                              .first;
                                                      _model.uploadedFileUrl3 =
                                                          downloadUrls.first;
                                                    });
                                                  } else {
                                                    setState(() {});
                                                    return;
                                                  }
                                                }

                                                logFirebaseEvent(
                                                    'scheduleDoc_backend_call');
                                                _model.liDocURLSche =
                                                    await GetDocUploadUrlFromLinkedinCall
                                                        .call(
                                                  urn: valueOrDefault(
                                                      currentUserDocument
                                                          ?.linkedinUrn,
                                                      ''),
                                                  accessToken: valueOrDefault(
                                                      currentUserDocument
                                                          ?.linkedinAccess,
                                                      ''),
                                                );

                                                if ((_model.liDocURLSche
                                                        ?.succeeded ??
                                                    true)) {
                                                  logFirebaseEvent(
                                                      'scheduleDoc_backend_call');
                                                  _model.docUploadedSche =
                                                      await UploadDocToLinkedinCall
                                                          .call(
                                                    accessToken: valueOrDefault(
                                                        currentUserDocument
                                                            ?.linkedinAccess,
                                                        ''),
                                                    uploadUrl:
                                                        GetDocUploadUrlFromLinkedinCall
                                                            .uploadURL(
                                                      (_model.liDocURLSche
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    docToBeUploaded:
                                                        _model.uploadedFileUrl3,
                                                  );

                                                  if ((_model.docUploadedSche
                                                          ?.succeeded ??
                                                      true)) {
                                                    logFirebaseEvent(
                                                        'scheduleDoc_backend_call');

                                                    await ScheduledPostsRecord
                                                        .collection
                                                        .doc()
                                                        .set(
                                                            createScheduledPostsRecordData(
                                                          userRef:
                                                              currentUserReference,
                                                          timestamp: functions
                                                              .combineDateTime(
                                                                  _model
                                                                      .scheduledDate!,
                                                                  _model
                                                                      .scheduledTime!),
                                                          timeOfCreation:
                                                              getCurrentTimestamp,
                                                          postType: _model
                                                              .typeOfMediaUploaded,
                                                          personUrn: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.linkedinUrn,
                                                              ''),
                                                          accessToken: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.linkedinAccess,
                                                              ''),
                                                          postText: _model
                                                              .textController
                                                              .text,
                                                          mediaId:
                                                              GetDocUploadUrlFromLinkedinCall
                                                                  .docURN(
                                                            (_model.liDocURLSche
                                                                    ?.jsonBody ??
                                                                ''),
                                                          ),
                                                          mediaTitle: _model
                                                              .uploadedDocTitle,
                                                          status: 'pending',
                                                          docFirebaseUrl: _model
                                                              .uploadedFileUrl3,
                                                          postTitle:
                                                              widget.postTitle,
                                                        ));
                                                    logFirebaseEvent(
                                                        'scheduleDoc_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title:
                                                              const Text('Success'),
                                                          content: const Text(
                                                              'Your post has been successfully scheduled!'),
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
                                                    logFirebaseEvent(
                                                        'scheduleDoc_backend_call');

                                                    await widget.postRef!.update(
                                                        createCreatedPostsRecordData(
                                                      status: 'Scheduled',
                                                    ));
                                                    logFirebaseEvent(
                                                        'scheduleDoc_navigate_to');

                                                    context.goNamed(
                                                        'allPostsOverview');
                                                  } else {
                                                    logFirebaseEvent(
                                                        'scheduleDoc_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: const Text(
                                                              'Upload Failed!'),
                                                          content: const Text(
                                                              'Your doc could not be uploaded to linkedin.'),
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
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'scheduleDoc_alert_dialog');
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                            'Upload Failed!'),
                                                        content: const Text(
                                                            'Your doc could not be uploaded to linkedin.'),
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
                                                }
                                              }

                                              setState(() {});
                                            },
                                            text: 'Schedule',
                                            options: FFButtonOptions(
                                              width: 88.0,
                                              height: 32.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'Plus Jakarta Sans'),
                                                      ),
                                              elevation: 2.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        if (_model.isScheduled &&
                                            (_model.typeOfMediaUploaded ==
                                                'poll'))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'VIEW_OR_EDIT_POST_schedulePoll_ON_TAP');
                                              await Future.wait([
                                                Future(() async {
                                                  logFirebaseEvent(
                                                      'schedulePoll_update_page_state');
                                                  _model.addToPollOptionsList(
                                                      _model.pollOption1!);
                                                  setState(() {});
                                                }),
                                                Future(() async {
                                                  logFirebaseEvent(
                                                      'schedulePoll_update_page_state');
                                                  _model.addToPollOptionsList(
                                                      _model.pollOption2!);
                                                  setState(() {});
                                                }),
                                                Future(() async {
                                                  if (_model.pollOption3 !=
                                                          null &&
                                                      _model.pollOption3 !=
                                                          '') {
                                                    logFirebaseEvent(
                                                        'schedulePoll_update_page_state');
                                                    _model.addToPollOptionsList(
                                                        _model.pollOption3!);
                                                    setState(() {});
                                                  }
                                                }),
                                                Future(() async {
                                                  if (_model.pollOption4 !=
                                                          null &&
                                                      _model.pollOption4 !=
                                                          '') {
                                                    logFirebaseEvent(
                                                        'schedulePoll_update_page_state');
                                                    _model.addToPollOptionsList(
                                                        _model.pollOption4!);
                                                    setState(() {});
                                                  }
                                                }),
                                              ]);
                                              logFirebaseEvent(
                                                  'schedulePoll_backend_call');

                                              await ScheduledPostsRecord
                                                  .collection
                                                  .doc()
                                                  .set(
                                                      createScheduledPostsRecordData(
                                                    userRef:
                                                        currentUserReference,
                                                    timestamp: functions
                                                        .combineDateTime(
                                                            _model
                                                                .scheduledDate!,
                                                            _model
                                                                .scheduledTime!),
                                                    timeOfCreation:
                                                        getCurrentTimestamp,
                                                    postType: _model
                                                        .typeOfMediaUploaded,
                                                    personUrn: valueOrDefault(
                                                        currentUserDocument
                                                            ?.linkedinUrn,
                                                        ''),
                                                    accessToken: valueOrDefault(
                                                        currentUserDocument
                                                            ?.linkedinAccess,
                                                        ''),
                                                    postText: _model
                                                        .textController.text,
                                                    question:
                                                        _model.pollQuestion,
                                                    optionsJson: functions
                                                        .valueToJsonMapList(
                                                            _model
                                                                .pollOptionsList
                                                                .toList(),
                                                            'text')
                                                        .toString(),
                                                    duration:
                                                        _model.pollDuration,
                                                    status: 'pending',
                                                    postTitle:
                                                        widget.postTitle,
                                                  ));
                                              logFirebaseEvent(
                                                  'schedulePoll_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: const Text('Success'),
                                                    content: const Text(
                                                        'Your post has been successfully scheduled!'),
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
                                              logFirebaseEvent(
                                                  'schedulePoll_backend_call');

                                              await widget.postRef!.update(
                                                  createCreatedPostsRecordData(
                                                status: 'Scheduled',
                                              ));
                                              logFirebaseEvent(
                                                  'schedulePoll_navigate_to');

                                              context
                                                  .goNamed('allPostsOverview');
                                            },
                                            text: 'Schedule',
                                            options: FFButtonOptions(
                                              width: 88.0,
                                              height: 32.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'Plus Jakarta Sans'),
                                                      ),
                                              elevation: 2.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        if (_model.isScheduled &&
                                            ((_model.typeOfMediaUploaded ==
                                                    'singleImage') ||
                                                (_model.typeOfMediaUploaded ==
                                                    'multiImage')))
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'VIEW_OR_EDIT_POST_scheduleImage_ON_TAP');
                                              var shouldSetState = false;
                                              logFirebaseEvent(
                                                  'scheduleImage_upload_media_to_firebase');
                                              {
                                                setState(() => _model
                                                    .isDataUploading4 = true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];
                                                var selectedMedia =
                                                    <SelectedFile>[];
                                                var downloadUrls = <String>[];
                                                try {
                                                  selectedUploadedFiles =
                                                      _model.uploadedMedia;
                                                  selectedMedia =
                                                      selectedFilesFromUploadedFiles(
                                                    selectedUploadedFiles,
                                                    isMultiData: true,
                                                  );
                                                  downloadUrls =
                                                      (await Future.wait(
                                                    selectedMedia.map(
                                                      (m) async =>
                                                          await uploadData(
                                                              m.storagePath,
                                                              m.bytes),
                                                    ),
                                                  ))
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  _model.isDataUploading4 =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length &&
                                                    downloadUrls.length ==
                                                        selectedMedia.length) {
                                                  setState(() {
                                                    _model.uploadedLocalFiles4 =
                                                        selectedUploadedFiles;
                                                    _model.uploadedFileUrls4 =
                                                        downloadUrls;
                                                  });
                                                } else {
                                                  setState(() {});
                                                  return;
                                                }
                                              }

                                              while (_model
                                                      .noOfImagesUploadedToFirebase <
                                                  _model
                                                      .numberOfImagesUploaded) {
                                                logFirebaseEvent(
                                                    'scheduleImage_backend_call');
                                                _model.imageUrlSch =
                                                    await GetImageUploadUrlFromLinkedinCall
                                                        .call(
                                                  urn: valueOrDefault(
                                                      currentUserDocument
                                                          ?.linkedinUrn,
                                                      ''),
                                                  accessToken: valueOrDefault(
                                                      currentUserDocument
                                                          ?.linkedinAccess,
                                                      ''),
                                                );

                                                shouldSetState = true;
                                                if ((_model.imageUrlSch
                                                        ?.succeeded ??
                                                    true)) {
                                                  logFirebaseEvent(
                                                      'scheduleImage_backend_call');
                                                  _model.imageUploadedSch =
                                                      await UploadImageToLinkedinCall
                                                          .call(
                                                    accessToken: valueOrDefault(
                                                        currentUserDocument
                                                            ?.linkedinAccess,
                                                        ''),
                                                    uploadUrl:
                                                        GetImageUploadUrlFromLinkedinCall
                                                            .uploadURL(
                                                      (_model.imageUrlSch
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    imageToBeUploaded: _model
                                                            .uploadedFileUrls4[
                                                        _model
                                                            .noOfImagesUploadedToFirebase],
                                                  );

                                                  shouldSetState = true;
                                                  if ((_model.imageUploadedSch
                                                          ?.succeeded ??
                                                      true)) {
                                                    if (_model
                                                            .noOfImagesUploadedToFirebase >=
                                                        1) {
                                                      logFirebaseEvent(
                                                          'scheduleImage_backend_call');

                                                      await _model
                                                          .createdDocRefrenceSch!
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'imageUrns':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              GetImageUploadUrlFromLinkedinCall
                                                                  .imageURN(
                                                                (_model.imageUrlSch
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )
                                                            ]),
                                                            'linkedinImgUrls':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              GetImageUploadUrlFromLinkedinCall
                                                                  .uploadURL(
                                                                (_model.imageUrlSch
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )
                                                            ]),
                                                            'firebaseImgUrls':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              _model.uploadedFileUrls4[
                                                                  _model
                                                                      .noOfImagesUploadedToFirebase]
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                      logFirebaseEvent(
                                                          'scheduleImage_update_page_state');
                                                      _model.noOfImagesUploadedToFirebase =
                                                          _model.noOfImagesUploadedToFirebase +
                                                              1;
                                                      setState(() {});
                                                    } else {
                                                      logFirebaseEvent(
                                                          'scheduleImage_backend_call');

                                                      var scheduledPostsRecordReference =
                                                          ScheduledPostsRecord
                                                              .collection
                                                              .doc();
                                                      await scheduledPostsRecordReference
                                                          .set({
                                                        ...mapToFirestore(
                                                          {
                                                            'imageUrns': [
                                                              GetImageUploadUrlFromLinkedinCall
                                                                  .imageURN(
                                                                (_model.imageUrlSch
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )
                                                            ],
                                                            'linkedinImgUrls': [
                                                              GetImageUploadUrlFromLinkedinCall
                                                                  .uploadURL(
                                                                (_model.imageUrlSch
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )
                                                            ],
                                                            'firebaseImgUrls': [
                                                              _model.uploadedFileUrls4[
                                                                  _model
                                                                      .noOfImagesUploadedToFirebase]
                                                            ],
                                                          },
                                                        ),
                                                      });
                                                      _model.createdDocRefrenceSch =
                                                          ScheduledPostsRecord
                                                              .getDocumentFromData({
                                                        ...mapToFirestore(
                                                          {
                                                            'imageUrns': [
                                                              GetImageUploadUrlFromLinkedinCall
                                                                  .imageURN(
                                                                (_model.imageUrlSch
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )
                                                            ],
                                                            'linkedinImgUrls': [
                                                              GetImageUploadUrlFromLinkedinCall
                                                                  .uploadURL(
                                                                (_model.imageUrlSch
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              )
                                                            ],
                                                            'firebaseImgUrls': [
                                                              _model.uploadedFileUrls4[
                                                                  _model
                                                                      .noOfImagesUploadedToFirebase]
                                                            ],
                                                          },
                                                        ),
                                                      }, scheduledPostsRecordReference);
                                                      shouldSetState = true;
                                                      logFirebaseEvent(
                                                          'scheduleImage_update_page_state');
                                                      _model.noOfImagesUploadedToFirebase =
                                                          _model.noOfImagesUploadedToFirebase +
                                                              1;
                                                      setState(() {});
                                                    }
                                                  } else {
                                                    logFirebaseEvent(
                                                        'scheduleImage_alert_dialog');
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title:
                                                              const Text('Failed!'),
                                                          content: const Text(
                                                              'Image upload to linkedin failed.'),
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
                                                    if (shouldSetState) {
                                                      setState(() {});
                                                    }
                                                    return;
                                                  }
                                                } else {
                                                  logFirebaseEvent(
                                                      'scheduleImage_alert_dialog');
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: const Text('Failed!'),
                                                        content: const Text(
                                                            'Image upload url from linkedin failed.'),
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
                                                  if (shouldSetState) {
                                                    setState(() {});
                                                  }
                                                  return;
                                                }
                                              }
                                              if (_model
                                                      .numberOfImagesUploaded >
                                                  1) {
                                                logFirebaseEvent(
                                                    'scheduleImage_backend_call');

                                                await _model
                                                    .createdDocRefrenceSch!
                                                    .reference
                                                    .update(
                                                        createScheduledPostsRecordData(
                                                  userRef: currentUserReference,
                                                  timestamp:
                                                      functions.combineDateTime(
                                                          _model.scheduledDate!,
                                                          _model
                                                              .scheduledTime!),
                                                  timeOfCreation:
                                                      getCurrentTimestamp,
                                                  postType: _model
                                                      .typeOfMediaUploaded,
                                                  personUrn: valueOrDefault(
                                                      currentUserDocument
                                                          ?.linkedinUrn,
                                                      ''),
                                                  accessToken: valueOrDefault(
                                                      currentUserDocument
                                                          ?.linkedinAccess,
                                                      ''),
                                                  postText: _model
                                                      .textController.text,
                                                  imagesJson: functions
                                                      .valueToJsonMapList(
                                                          _model
                                                              .createdDocRefrenceSch!
                                                              .imageUrns
                                                              .toList(),
                                                          'id')
                                                      .toString(),
                                                  mediaTitle: widget.postTitle,
                                                  status: 'pending',
                                                  postTitle: widget.postTitle,
                                                ));
                                                logFirebaseEvent(
                                                    'scheduleImage_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text('Success'),
                                                      content: const Text(
                                                          'Your post has been successfully scheduled!'),
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
                                                logFirebaseEvent(
                                                    'scheduleImage_backend_call');

                                                await widget.postRef!.update(
                                                    createCreatedPostsRecordData(
                                                  status: 'Scheduled',
                                                ));
                                                logFirebaseEvent(
                                                    'scheduleImage_navigate_to');

                                                context.goNamed(
                                                    'allPostsOverview');
                                              } else {
                                                logFirebaseEvent(
                                                    'scheduleImage_backend_call');

                                                await _model
                                                    .createdDocRefrenceSch!
                                                    .reference
                                                    .update(
                                                        createScheduledPostsRecordData(
                                                  userRef: currentUserReference,
                                                  timestamp:
                                                      functions.combineDateTime(
                                                          _model.scheduledDate!,
                                                          _model
                                                              .scheduledTime!),
                                                  timeOfCreation:
                                                      getCurrentTimestamp,
                                                  postType: _model
                                                      .typeOfMediaUploaded,
                                                  personUrn: valueOrDefault(
                                                      currentUserDocument
                                                          ?.linkedinUrn,
                                                      ''),
                                                  accessToken: valueOrDefault(
                                                      currentUserDocument
                                                          ?.linkedinAccess,
                                                      ''),
                                                  postText: _model
                                                      .textController.text,
                                                  mediaTitle: widget.postTitle,
                                                  status: 'pending',
                                                  mediaId:
                                                      GetImageUploadUrlFromLinkedinCall
                                                          .imageURN(
                                                    (_model.imageUrlSch
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  postTitle: widget.postTitle,
                                                ));
                                                logFirebaseEvent(
                                                    'scheduleImage_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text('Success'),
                                                      content: const Text(
                                                          'Your post has been successfully scheduled!'),
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
                                                logFirebaseEvent(
                                                    'scheduleImage_backend_call');

                                                await widget.postRef!.update(
                                                    createCreatedPostsRecordData(
                                                  status: 'Scheduled',
                                                ));
                                                logFirebaseEvent(
                                                    'scheduleImage_navigate_to');

                                                context.goNamed(
                                                    'allPostsOverview');
                                              }

                                              if (shouldSetState) {
                                                setState(() {});
                                              }
                                            },
                                            text: 'Schedule',
                                            options: FFButtonOptions(
                                              width: 88.0,
                                              height: 32.0,
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'Plus Jakarta Sans'),
                                                      ),
                                              elevation: 2.0,
                                              borderSide: const BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ].divide(const SizedBox(width: 8.0)),
                                ),
                              ],
                            ),
                          ),
                          StreamBuilder<CreatedPostsRecord>(
                            stream: CreatedPostsRecord.getDocument(
                                widget.postRef!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 100.0,
                                    height: 100.0,
                                    child: SpinKitRipple(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 100.0,
                                    ),
                                  ),
                                );
                              }

                              final containerCreatedPostsRecord =
                                  snapshot.data!;

                              return Container(
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
                                                  'Posting on ${dateTimeFormat('MMMEd', _model.scheduledDate)} at ${dateTimeFormat('jm', _model.scheduledTime)}.',
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
                                                        'VIEW_OR_EDIT_POST_Text_141qennn_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Text_update_page_state');
                                                    _model.datePickerVisbile =
                                                        true;
                                                    setState(() {});
                                                    logFirebaseEvent(
                                                        'Text_wait__delay');
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds: 100));
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
                                                    ' Edit.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1.0, -1.0),
                                        child: Builder(
                                          builder: (context) => SizedBox(
                                            width: 1.0,
                                            height: 1.0,
                                            child: custom_widgets
                                                .BackButtonOverrider(
                                              width: 1.0,
                                              height: 1.0,
                                              onBack: () async {
                                                logFirebaseEvent(
                                                    'VIEW_OR_EDIT_POST_Container_1cuobz7g_CAL');
                                                if (_model
                                                        .textController.text !=
                                                    widget.postText) {
                                                  logFirebaseEvent(
                                                      'BackButtonOverrider_alert_dialog');
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child: GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child:
                                                              ExitDialogWidget(
                                                            saveAction:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  '_backend_call');

                                                              await widget
                                                                  .postRef!
                                                                  .update({
                                                                ...mapToFirestore(
                                                                  {
                                                                    'content':
                                                                        FieldValue
                                                                            .delete(),
                                                                  },
                                                                ),
                                                              });
                                                              logFirebaseEvent(
                                                                  '_backend_call');

                                                              await widget
                                                                  .postRef!
                                                                  .update({
                                                                ...createCreatedPostsRecordData(
                                                                  topic: widget
                                                                      .postTitle,
                                                                ),
                                                                ...mapToFirestore(
                                                                  {
                                                                    'content':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      _model
                                                                          .textController
                                                                          .text
                                                                    ]),
                                                                  },
                                                                ),
                                                              });
                                                              logFirebaseEvent(
                                                                  '_navigate_to');

                                                              context.goNamed(
                                                                  'allPostsOverview');
                                                            },
                                                            discardAction:
                                                                () async {
                                                              logFirebaseEvent(
                                                                  '_navigate_to');

                                                              context.goNamed(
                                                                  'allPostsOverview');
                                                            },
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                } else {
                                                  logFirebaseEvent(
                                                      'BackButtonOverrider_navigate_back');
                                                  context.safePop();
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 40.0),
                                        child: TextFormField(
                                          controller: _model.textController ??=
                                              TextEditingController(
                                            text: containerCreatedPostsRecord
                                                .content[valueOrDefault<int>(
                                              widget.oneLinerIndex ?? 0,
                                              0,
                                            )],
                                          ),
                                          focusNode: _model.textFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController',
                                            const Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          autofocus: false,
                                          textCapitalization:
                                              TextCapitalization.sentences,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'What\'s happening?',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      color: const Color(0xFF57636C),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              'Plus Jakarta Sans'),
                                                    ),
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        'Plus Jakarta Sans'),
                                              ),
                                          textAlign: TextAlign.start,
                                          maxLines: null,
                                          cursorColor: const Color(0xFF4B39EF),
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      if ((_model.typeOfMediaUploaded ==
                                              'singleImage') ||
                                          (_model.typeOfMediaUploaded ==
                                              'multiImage'))
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.memory(
                                                        _model.uploadedMedia
                                                                .first.bytes ??
                                                            Uint8List.fromList(
                                                                []),
                                                        width: double.infinity,
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'VIEW_OR_EDIT_POST_Container_v934ugdk_ON_');
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            _model.typeOfMediaUploaded =
                                                                'onlyText';
                                                            _model.numberOfImagesUploaded =
                                                                0;
                                                            _model.uploadedMedia =
                                                                [];
                                                            setState(() {});
                                                            logFirebaseEvent(
                                                                'Container_clear_uploaded_data');
                                                            setState(() {
                                                              _model.isDataUploading5 =
                                                                  false;
                                                              _model.uploadedLocalFiles5 =
                                                                  [];
                                                            });
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
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Flexible(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      8.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      8.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
                                                            ),
                                                            child: Image.memory(
                                                              _model
                                                                      .uploadedMedia
                                                                      .first
                                                                      .bytes ??
                                                                  Uint8List
                                                                      .fromList(
                                                                          []),
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.5,
                                                              height: 250.0,
                                                              fit: BoxFit.none,
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          8.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      8.0),
                                                            ),
                                                            child: Image.memory(
                                                              _model
                                                                      .uploadedMedia[
                                                                          1]
                                                                      .bytes ??
                                                                  Uint8List
                                                                      .fromList(
                                                                          []),
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.5,
                                                              height: 250.0,
                                                              fit: BoxFit.none,
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'VIEW_OR_EDIT_POST_Container_slssatjt_ON_');
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            _model.typeOfMediaUploaded =
                                                                'onlyText';
                                                            _model.numberOfImagesUploaded =
                                                                0;
                                                            _model.uploadedMedia =
                                                                [];
                                                            setState(() {});
                                                            logFirebaseEvent(
                                                                'Container_clear_uploaded_data');
                                                            setState(() {
                                                              _model.isDataUploading5 =
                                                                  false;
                                                              _model.uploadedLocalFiles5 =
                                                                  [];
                                                            });
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
                                                          MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                          child: Image.memory(
                                                            _model
                                                                    .uploadedMedia
                                                                    .first
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            width:
                                                                double.infinity,
                                                            height: 150.0,
                                                            fit: BoxFit.none,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                                child: Image
                                                                    .memory(
                                                                  _model
                                                                          .uploadedMedia[
                                                                              1]
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.5,
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .none,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                                child: Image
                                                                    .memory(
                                                                  _model
                                                                          .uploadedMedia[
                                                                              2]
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.5,
                                                                  height: 100.0,
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'VIEW_OR_EDIT_POST_Container_wkc6dtpu_ON_');
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            _model.typeOfMediaUploaded =
                                                                'onlyText';
                                                            _model.numberOfImagesUploaded =
                                                                0;
                                                            _model.uploadedMedia =
                                                                [];
                                                            setState(() {});
                                                            logFirebaseEvent(
                                                                'Container_clear_uploaded_data');
                                                            setState(() {
                                                              _model.isDataUploading5 =
                                                                  false;
                                                              _model.uploadedLocalFiles5 =
                                                                  [];
                                                            });
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
                                                          MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              const BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    8.0),
                                                          ),
                                                          child: Image.memory(
                                                            _model
                                                                    .uploadedMedia
                                                                    .first
                                                                    .bytes ??
                                                                Uint8List
                                                                    .fromList(
                                                                        []),
                                                            width:
                                                                double.infinity,
                                                            height: 150.0,
                                                            fit: BoxFit.none,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                                child: Image
                                                                    .memory(
                                                                  _model
                                                                          .uploadedMedia[
                                                                              1]
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .none,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
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
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                                child: Image
                                                                    .memory(
                                                                  _model
                                                                          .uploadedMedia[
                                                                              2]
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .none,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                                child: Image
                                                                    .memory(
                                                                  _model
                                                                          .uploadedMedia[
                                                                              3]
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  height: 100.0,
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'VIEW_OR_EDIT_POST_Container_ck0y6275_ON_');
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            _model.typeOfMediaUploaded =
                                                                'onlyText';
                                                            _model.numberOfImagesUploaded =
                                                                0;
                                                            _model.uploadedMedia =
                                                                [];
                                                            setState(() {});
                                                            logFirebaseEvent(
                                                                'Container_clear_uploaded_data');
                                                            setState(() {
                                                              _model.isDataUploading5 =
                                                                  false;
                                                              _model.uploadedLocalFiles5 =
                                                                  [];
                                                            });
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
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Flexible(
                                                              child: ClipRRect(
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
                                                                          0.0),
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
                                                                  height: 150.0,
                                                                  fit: BoxFit
                                                                      .none,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
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
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  height: 150.0,
                                                                  fit: BoxFit
                                                                      .none,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                                child: Image
                                                                    .memory(
                                                                  _model
                                                                          .uploadedMedia[
                                                                              2]
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .none,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
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
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                                child: Image
                                                                    .memory(
                                                                  _model
                                                                          .uploadedMedia[
                                                                              3]
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .none,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                                child: Image
                                                                    .memory(
                                                                  _model
                                                                          .uploadedMedia[
                                                                              4]
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  height: 100.0,
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'VIEW_OR_EDIT_POST_Container_acr90kd8_ON_');
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            _model.typeOfMediaUploaded =
                                                                'onlyText';
                                                            _model.numberOfImagesUploaded =
                                                                0;
                                                            _model.uploadedMedia =
                                                                [];
                                                            setState(() {});
                                                            logFirebaseEvent(
                                                                'Container_clear_uploaded_data');
                                                            setState(() {
                                                              _model.isDataUploading5 =
                                                                  false;
                                                              _model.uploadedLocalFiles5 =
                                                                  [];
                                                            });
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
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Flexible(
                                                              child: ClipRRect(
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
                                                                          0.0),
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
                                                                  height: 150.0,
                                                                  fit: BoxFit
                                                                      .none,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
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
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  height: 150.0,
                                                                  fit: BoxFit
                                                                      .none,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                                child: Image
                                                                    .memory(
                                                                  _model
                                                                          .uploadedMedia[
                                                                              2]
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .none,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
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
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                                child: Image
                                                                    .memory(
                                                                  _model
                                                                          .uploadedMedia[
                                                                              3]
                                                                          .bytes ??
                                                                      Uint8List
                                                                          .fromList(
                                                                              []),
                                                                  height: 100.0,
                                                                  fit: BoxFit
                                                                      .none,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Stack(
                                                                children: [
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
                                                                      topRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                    ),
                                                                    child: Image
                                                                        .memory(
                                                                      _model.uploadedMedia[4]
                                                                              .bytes ??
                                                                          Uint8List.fromList([]),
                                                                      height:
                                                                          100.0,
                                                                      fit: BoxFit
                                                                          .none,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      color: Color(
                                                                          0xC9080808),
                                                                      borderRadius:
                                                                          BorderRadius
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
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        '+${(_model.numberOfImagesUploaded - 5).toString()}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
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
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'VIEW_OR_EDIT_POST_Container_67l3jnnx_ON_');
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            _model.typeOfMediaUploaded =
                                                                'onlyText';
                                                            _model.numberOfImagesUploaded =
                                                                0;
                                                            _model.uploadedMedia =
                                                                [];
                                                            setState(() {});
                                                            logFirebaseEvent(
                                                                'Container_clear_uploaded_data');
                                                            setState(() {
                                                              _model.isDataUploading5 =
                                                                  false;
                                                              _model.uploadedLocalFiles5 =
                                                                  [];
                                                            });
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
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      if (_model.typeOfMediaUploaded == 'doc')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Stack(
                                            children: [
                                              FlutterFlowPdfViewer(
                                                fileBytes:
                                                    _model.uploadedDoc?.bytes,
                                                height: 300.0,
                                                horizontalScroll: true,
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: const BoxDecoration(
                                                  color: Color(0xB8080808),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      _model.uploadedDocTitle,
                                                      'Title',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
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
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 8.0, 0.0),
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
                                                          'VIEW_OR_EDIT_POST_Container_vjgs4iqm_ON_');
                                                      logFirebaseEvent(
                                                          'Container_update_page_state');
                                                      _model.typeOfMediaUploaded =
                                                          'onlyText';
                                                      _model.uploadedDoc = null;
                                                      _model.uploadedDocTitle =
                                                          null;
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: 24.0,
                                                      height: 24.0,
                                                      decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xD4080808),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.close,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                      if (_model.typeOfMediaUploaded == 'poll')
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: const Color(0x65979797),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 8.0, 8.0, 8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${_model.pollQuestion}?',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
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
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
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
                                                        child: FFButtonWidget(
                                                          onPressed: () {
                                                            print(
                                                                'Button pressed ...');
                                                          },
                                                          text: _model
                                                              .pollOption1!,
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height: 28.0,
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
                                                            color: Colors
                                                                .transparent,
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
                                                                          .secondary,
                                                                      fontSize:
                                                                          14.0,
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
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                        child: FFButtonWidget(
                                                          onPressed: () {
                                                            print(
                                                                'Button pressed ...');
                                                          },
                                                          text: _model
                                                              .pollOption2!,
                                                          options:
                                                              FFButtonOptions(
                                                            width:
                                                                double.infinity,
                                                            height: 28.0,
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
                                                            color: Colors
                                                                .transparent,
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
                                                                          .secondary,
                                                                      fontSize:
                                                                          14.0,
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
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                          child: FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text: _model
                                                                .pollOption3!,
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 28.0,
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
                                                              color: Colors
                                                                  .transparent,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
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
                                                              elevation: 0.0,
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
                                                          child: FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text: _model
                                                                .pollOption4!,
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 28.0,
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
                                                              color: Colors
                                                                  .transparent,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
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
                                                              elevation: 0.0,
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 8.0, 8.0, 0.0),
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
                                                          'VIEW_OR_EDIT_POST_Container_534orpla_ON_');
                                                      logFirebaseEvent(
                                                          'Container_update_page_state');
                                                      _model.typeOfMediaUploaded =
                                                          'onlyText';
                                                      _model.numberOfImagesUploaded =
                                                          0;
                                                      _model.uploadedMedia = [];
                                                      setState(() {});
                                                    },
                                                    child: Container(
                                                      width: 24.0,
                                                      height: 24.0,
                                                      decoration: const BoxDecoration(
                                                        color:
                                                            Color(0xD4080808),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons.close,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                              );
                            },
                          ),
                        ],
                      ),
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
                                      'VIEW_OR_EDIT_POST_Container_60pueuye_ON_');
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
                                    setState(
                                        () => _model.isDataUploading5 = true);
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
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                              ))
                                          .toList();
                                    } finally {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      _model.isDataUploading5 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                        selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFiles5 =
                                            selectedUploadedFiles;
                                      });
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      setState(() {});
                                      showUploadMessage(
                                          context, 'Failed to upload data');
                                      return;
                                    }
                                  }

                                  if (_model.uploadedLocalFiles5.isNotEmpty) {
                                    logFirebaseEvent(
                                        'Container_update_page_state');
                                    _model.typeOfMediaUploaded =
                                        _model.uploadedLocalFiles5.length > 1
                                            ? 'multiImage'
                                            : 'singleImage';
                                    _model.numberOfImagesUploaded =
                                        _model.uploadedLocalFiles5.length;
                                    _model.uploadedMedia = _model
                                        .uploadedLocalFiles5
                                        .toList()
                                        .cast<FFUploadedFile>();
                                    setState(() {});
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
                                      'VIEW_OR_EDIT_POST_Container_a2sakqwc_ON_');
                                  logFirebaseEvent('Container_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () => _model
                                                .unfocusNode.canRequestFocus
                                            ? FocusScope.of(context)
                                                .requestFocus(
                                                    _model.unfocusNode)
                                            : FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
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
                                                      uploadedMedia.length > 1
                                                          ? 'multiImage'
                                                          : 'singleImage';
                                                  _model.numberOfImagesUploaded =
                                                      uploadedMedia.length;
                                                  _model.uploadedMedia =
                                                      uploadedMedia
                                                          .toList()
                                                          .cast<
                                                              FFUploadedFile>();
                                                  setState(() {});
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
                                                setState(() {});
                                              },
                                              saveAction: () async {
                                                logFirebaseEvent(
                                                    '_backend_call');

                                                await widget.postRef!.update({
                                                  ...mapToFirestore(
                                                    {
                                                      'content':
                                                          FieldValue.delete(),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    '_backend_call');

                                                await widget.postRef!.update({
                                                  ...createCreatedPostsRecordData(
                                                    topic: widget.postTitle,
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'content': FieldValue
                                                          .arrayUnion([
                                                        _model
                                                            .textController.text
                                                      ]),
                                                    },
                                                  ),
                                                });
                                                logFirebaseEvent(
                                                    '_alert_dialog');
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: const Text('Saved'),
                                                      content:
                                                          const Text('Draft Saved'),
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
                                                await widget.postRef!.delete();
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
                                                _model.pollQuestion = question;
                                                _model.pollOption1 = option1;
                                                _model.pollOption2 = option2;
                                                _model.pollOption3 = option3;
                                                _model.pollOption4 = option4;
                                                _model.pollDuration = duration;
                                                setState(() {});
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
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 2.0,
                              sigmaY: 2.0,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'VIEW_OR_EDIT_POST_Container_sltyiu77_ON_');
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
                                      setState(() {});
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
                                                    BorderRadius.circular(4.0),
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
                                            style: FlutterFlowTheme.of(context)
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
                                            style: FlutterFlowTheme.of(context)
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
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'VIEW_OR_EDIT_POST_Container_ybdkcmpo_ON_');
                                              logFirebaseEvent(
                                                  'Container_date_time_picker');
                                              final datePicked1Date =
                                                  await showDatePicker(
                                                context: context,
                                                initialDate:
                                                    getCurrentTimestamp,
                                                firstDate: getCurrentTimestamp,
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
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
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
                                                                      FlutterFlowTheme.of(
                                                                              context)
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
                                                  _model.datePicked1 = DateTime(
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
                                              setState(() {});
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 44.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                                      dateTimeFormat('yMMMd',
                                                          _model.scheduledDate),
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
                                                      color: Color(0xFF3F3D3D),
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
                                            style: FlutterFlowTheme.of(context)
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
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'VIEW_OR_EDIT_POST_Container_nl8hjmga_ON_');
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
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
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
                                                                      FlutterFlowTheme.of(
                                                                              context)
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
                                                  _model.datePicked2 = DateTime(
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
                                              setState(() {});
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 44.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                                      dateTimeFormat('jm',
                                                          _model.scheduledTime),
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
                                                      Icons.access_time_rounded,
                                                      color: Color(0xFF3F3D3D),
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
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
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
                                        if (!_model.isScheduled)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 16.0, 16.0, 44.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'VIEW_OR_EDIT_POST_PAGE_NEXT_BTN_ON_TAP');
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
                                                setState(() {});
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
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Montserrat',
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
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                          ),
                                        if (_model.isScheduled)
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
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
                                                          'VIEW_OR_EDIT_POST_PAGE_CLEAR_BTN_ON_TAP');
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
                                                      setState(() {});
                                                    },
                                                    text: 'Clear',
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
                                                      color: Colors.transparent,
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
                                                                fontSize: 16.0,
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'VIEW_OR_EDIT_POST_PAGE_NEXT_BTN_ON_TAP');
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
                                                      setState(() {});
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
                                                                fontSize: 16.0,
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
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
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
  }
}
