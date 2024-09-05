import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'post_detailed_model.dart';
export 'post_detailed_model.dart';

class PostDetailedWidget extends StatefulWidget {
  const PostDetailedWidget({
    super.key,
    required this.postRef,
    required this.postText,
    required this.postURN,
    required this.postedOn,
  });

  final DocumentReference? postRef;
  final String? postText;
  final String? postURN;
  final DateTime? postedOn;

  @override
  State<PostDetailedWidget> createState() => _PostDetailedWidgetState();
}

class _PostDetailedWidgetState extends State<PostDetailedWidget> {
  late PostDetailedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostDetailedModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'postDetailed'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PostedOnLinkedinRecord>(
      stream: PostedOnLinkedinRecord.getDocument(widget.postRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }

        final postDetailedPostedOnLinkedinRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Color(0xFF101213),
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('POST_DETAILED_arrow_back_rounded_ICN_ON_');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.pop();
                },
              ),
              title: Text(
                'Post Details',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Montserrat',
                      color: const Color(0xFF101213),
                      fontSize: 24.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      useGoogleFonts:
                          GoogleFonts.asMap().containsKey('Montserrat'),
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Likes',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: const Color(0xFF57636C),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey('Plus Jakarta Sans'),
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
                      child: Text(
                        postDetailedPostedOnLinkedinRecord.likesNumber
                            .toString(),
                        style:
                            FlutterFlowTheme.of(context).displayLarge.override(
                                  fontFamily: 'Outfit',
                                  color: const Color(0xFF101213),
                                  fontSize: 64.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  useGoogleFonts:
                                      GoogleFonts.asMap().containsKey('Outfit'),
                                ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 24.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Comments',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: const Color(0xFF57636C),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Plus Jakarta Sans'),
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      postDetailedPostedOnLinkedinRecord
                                          .commentsNumber
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: const Color(0xFF101213),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Outfit'),
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Posted on',
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        color: const Color(0xFF57636C),
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Plus Jakarta Sans'),
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    dateTimeFormat("yMMMd", widget.postedOn),
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: const Color(0xFF101213),
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Outfit'),
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'POST_DETAILED_PAGE_REFRESH_BTN_ON_TAP');
                            if (postDetailedPostedOnLinkedinRecord
                                    .reactionRefreshQuota >
                                0) {
                              logFirebaseEvent('Button_backend_call');
                              _model.likes =
                                  await LinkedinPostGroup.getPostLikesCall.call(
                                postUrn: widget.postURN,
                                accessToken: valueOrDefault(
                                    currentUserDocument?.linkedinAccess, ''),
                              );

                              logFirebaseEvent('Button_backend_call');
                              _model.comments = await LinkedinPostGroup
                                  .getPostCommentsCall
                                  .call(
                                postUrn: widget.postURN,
                                accessToken: valueOrDefault(
                                    currentUserDocument?.linkedinAccess, ''),
                              );

                              logFirebaseEvent('Button_backend_call');

                              await widget.postRef!
                                  .update(createPostedOnLinkedinRecordData(
                                likesNumber: LinkedinPostGroup.getPostLikesCall
                                    .likesCount(
                                  (_model.likes?.jsonBody ?? ''),
                                ),
                                commentsNumber: LinkedinPostGroup
                                    .getPostCommentsCall
                                    .commentsCount(
                                  (_model.comments?.jsonBody ?? ''),
                                ),
                              ));
                              logFirebaseEvent('Button_backend_call');

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'totalLikes': FieldValue.increment(
                                        LinkedinPostGroup.getPostLikesCall
                                            .likesCount(
                                      (_model.likes?.jsonBody ?? ''),
                                    )!),
                                    'totalComments': FieldValue.increment(
                                        LinkedinPostGroup.getPostCommentsCall
                                            .commentsCount(
                                      (_model.comments?.jsonBody ?? ''),
                                    )!),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_update_page_state');
                              _model.infoVisible = true;
                              safeSetState(() {});
                            } else {
                              logFirebaseEvent('Button_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Refresh Quota exceeded for today.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                              logFirebaseEvent('Button_update_page_state');
                              _model.infoVisible = true;
                              safeSetState(() {});
                            }

                            safeSetState(() {});
                          },
                          text: 'Refresh',
                          options: FFButtonOptions(
                            height: 30.0,
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
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .titleSmallFamily),
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    if (_model.infoVisible)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 8.0, 24.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xCB1E1E1E),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: Text(
                                      'Due to data storage requirements, This data will only be saved for 2 days.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, -1.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'POST_DETAILED_PAGE_Icon_ikohtqz1_ON_TAP');
                                      logFirebaseEvent(
                                          'Icon_update_page_state');
                                      _model.infoVisible = false;
                                      safeSetState(() {});
                                    },
                                    child: Icon(
                                      Icons.close_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 0.0),
                      child: Text(
                        'Content',
                        style: FlutterFlowTheme.of(context).labelSmall.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: const Color(0xFF57636C),
                              fontSize: 12.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey('Plus Jakarta Sans'),
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.postText,
                          'null',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: const Color(0xFF101213),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts: GoogleFonts.asMap()
                                  .containsKey('Plus Jakarta Sans'),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
