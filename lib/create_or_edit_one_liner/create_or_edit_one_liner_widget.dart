import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/one_liner_expandable_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_or_edit_one_liner_model.dart';
export 'create_or_edit_one_liner_model.dart';

class CreateOrEditOneLinerWidget extends StatefulWidget {
  const CreateOrEditOneLinerWidget({
    super.key,
    required this.postText,
    required this.postRef,
    required this.postTitle,
  });

  final List<String>? postText;
  final DocumentReference? postRef;
  final String? postTitle;

  @override
  State<CreateOrEditOneLinerWidget> createState() =>
      _CreateOrEditOneLinerWidgetState();
}

class _CreateOrEditOneLinerWidgetState extends State<CreateOrEditOneLinerWidget>
    with TickerProviderStateMixin {
  late CreateOrEditOneLinerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        RotateEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        TintEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: Color(0xFF9532EC),
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateOrEditOneLinerModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'createOrEditOneLiner'});

    _model.textFieldFocusNode ??= FocusNode();

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional(1.0, 1.0),
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 12.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'CREATE_OR_EDIT_ONE_LINER_Icon_sqe684t2_O');
                                          logFirebaseEvent(
                                              'Icon_navigate_back');
                                          context.pop();
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Container(
                                            width: 40.0,
                                            height: 40.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              (currentUserDocument
                                                          ?.profilePictureLinks
                                                          ?.toList() ??
                                                      [])
                                                  .first,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                              '${currentUserDocument?.linkedinDetails?.localizedFirstName}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 22.0,
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
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'CREATE_OR_EDIT_ONE_LINER_POST_BTN_ON_TAP');
                                    if (_model.oneLinerText != null &&
                                        _model.oneLinerText != '') {
                                      logFirebaseEvent('Button_backend_call');
                                      _model.linkedinPost =
                                          await LinkedinPostGroup.postTextCall
                                              .call(
                                        personUrn: valueOrDefault(
                                            currentUserDocument?.linkedinUrn,
                                            ''),
                                        postText: functions.formatStringForJson(
                                            _model.oneLinerText),
                                        accessToken: valueOrDefault(
                                            currentUserDocument?.linkedinAccess,
                                            ''),
                                      );
                                      if ((_model.linkedinPost?.succeeded ??
                                          true)) {
                                        logFirebaseEvent('Button_alert_dialog');
                                        unawaited(
                                          () async {
                                            await showDialog(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Success'),
                                                  content: Text(
                                                      'Your post has been successfully posted!'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }(),
                                        );
                                        logFirebaseEvent('Button_backend_call');

                                        await widget.postRef!.update(
                                            createCreatedPostsRecordData(
                                          status: 'Posted',
                                        ));
                                        logFirebaseEvent('Button_backend_call');

                                        await PostedOnLinkedinRecord.createDoc(
                                                currentUserReference!)
                                            .set(
                                                createPostedOnLinkedinRecordData(
                                          postURN: (_model.linkedinPost
                                                  ?.getHeader(
                                                      'x-linkedin-id') ??
                                              ''),
                                          postedOn: getCurrentTimestamp,
                                          postText: _model.oneLinerText,
                                          postTitle: _model.textController.text,
                                          reactionRefreshQuota: 2,
                                        ));
                                        logFirebaseEvent('Button_navigate_to');

                                        context.goNamed('home');
                                      } else {
                                        logFirebaseEvent('Button_alert_dialog');
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Failed'),
                                              content: Text(
                                                  'Posting action failed!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    } else {
                                      logFirebaseEvent('Button_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Select an option to post!',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .warning,
                                        ),
                                      );
                                    }

                                    setState(() {});
                                  },
                                  text: 'Post',
                                  options: FFButtonOptions(
                                    width: 70.0,
                                    height: 36.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Plus Jakarta Sans'),
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: StreamBuilder<CreatedPostsRecord>(
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
                                  decoration: BoxDecoration(),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 0.0, 12.0),
                                          child: TextFormField(
                                            controller:
                                                _model.textController ??=
                                                    TextEditingController(
                                              text: containerCreatedPostsRecord
                                                  .topic,
                                            ),
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController',
                                              Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            textCapitalization:
                                                TextCapitalization.sentences,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  'Title for Reference (will not be posted)',
                                              hintText:
                                                  'Add a Title to the post so you can refrence it later...',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'Plus Jakarta Sans'),
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF4B39EF),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFF5963),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFF5963),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 8.0, 16.0,
                                                          12.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.normal,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          'Plus Jakarta Sans'),
                                                ),
                                            textAlign: TextAlign.start,
                                            maxLines: null,
                                            cursorColor: Color(0xFF4B39EF),
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 24.0),
                                          child: Text(
                                            'Select any one to edit or post...',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 18.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                        Builder(
                                          builder: (context) {
                                            final oneLiners =
                                                widget.postText!.toList();
                                            return ListView.separated(
                                              padding: EdgeInsets.fromLTRB(
                                                0,
                                                0,
                                                0,
                                                70.0,
                                              ),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: oneLiners.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(height: 12.0),
                                              itemBuilder:
                                                  (context, oneLinersIndex) {
                                                final oneLinersItem =
                                                    oneLiners[oneLinersIndex];
                                                return OneLinerExpandableWidget(
                                                  key: Key(
                                                      'Keyqtf_${oneLinersIndex}_of_${oneLiners.length}'),
                                                  headerText:
                                                      _model.whichIndexExpanded ==
                                                              oneLinersIndex
                                                          ? 'Edit or Post...'
                                                          : oneLinersItem,
                                                  expandedText: oneLinersItem,
                                                  lineItemIndex: oneLinersIndex,
                                                  whichIndexExpanded:
                                                      _model.whichIndexExpanded,
                                                  textFieldUpdateAction:
                                                      (textFieldvalue) async {
                                                    logFirebaseEvent(
                                                        'CREATE_OR_EDIT_ONE_LINER_Container_qtfvi');
                                                    logFirebaseEvent(
                                                        'oneLinerExpandable_update_page_state');
                                                    _model.oneLinerText =
                                                        textFieldvalue!;
                                                  },
                                                  onTapAction: () async {
                                                    logFirebaseEvent(
                                                        'CREATE_OR_EDIT_ONE_LINER_Container_qtfvi');
                                                    logFirebaseEvent(
                                                        'oneLinerExpandable_update_page_state');
                                                    setState(() {
                                                      _model.whichIndexExpanded =
                                                          oneLinersIndex;
                                                      _model.oneLinerText =
                                                          oneLinersItem;
                                                    });
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 50.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'CREATE_OR_EDIT_ONE_LINER_Icon_uqaud17t_O');
                                logFirebaseEvent('Icon_backend_call');
                                unawaited(
                                  () async {
                                    await widget.postRef!
                                        .update(createCreatedPostsRecordData(
                                      contentReview: 'Liked',
                                    ));
                                  }(),
                                );
                                logFirebaseEvent('Icon_widget_animation');
                                if (animationsMap[
                                        'iconOnActionTriggerAnimation'] !=
                                    null) {
                                  await animationsMap[
                                          'iconOnActionTriggerAnimation']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                              },
                              child: Icon(
                                Icons.thumb_up_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ).animateOnActionTrigger(
                              animationsMap['iconOnActionTriggerAnimation']!,
                            ),
                          ),
                          Container(
                            width: 1.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(25.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(25.0),
                              ),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'CREATE_OR_EDIT_ONE_LINER_Icon_mz3zzmyf_O');
                                logFirebaseEvent('Icon_navigate_to');

                                context.pushNamed(
                                  'postReview',
                                  queryParameters: {
                                    'postRef': serializeParam(
                                      widget.postRef,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.bottomToTop,
                                    ),
                                  },
                                );
                              },
                              child: Icon(
                                Icons.thumb_down_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CREATE_OR_EDIT_ONE_LINER_Text_xa1fycwg_O');
                            logFirebaseEvent('Text_alert_dialog');
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Delete?'),
                                      content: Text(
                                          'This action will permanatly delete this draft. Continue?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              logFirebaseEvent('Text_backend_call');
                              await widget.postRef!.delete();
                            } else {
                              logFirebaseEvent(
                                  'Text_close_dialog,_drawer,_etc');
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            '- Delete draft',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).error,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
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
    );
  }
}
