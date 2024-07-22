import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/one_liner_expandable_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'view_or_edit_one_liner_model.dart';
export 'view_or_edit_one_liner_model.dart';

class ViewOrEditOneLinerWidget extends StatefulWidget {
  const ViewOrEditOneLinerWidget({
    super.key,
    required this.postText,
    required this.postRef,
    required this.postTitle,
  });

  final List<String>? postText;
  final DocumentReference? postRef;
  final String? postTitle;

  @override
  State<ViewOrEditOneLinerWidget> createState() =>
      _ViewOrEditOneLinerWidgetState();
}

class _ViewOrEditOneLinerWidgetState extends State<ViewOrEditOneLinerWidget> {
  late ViewOrEditOneLinerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewOrEditOneLinerModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'viewOrEditOneLiner'});

    _model.textFieldFocusNode ??= FocusNode();

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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  alignment: const AlignmentDirectional(1.0, 1.0),
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
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
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'VIEW_OR_EDIT_ONE_LINER_Icon_sqe684t2_ON_');
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
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 30.0,
                                          height: 30.0,
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
                                              '${currentUserDocument?.linkedinDetails.localizedFirstName}',
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
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'VIEW_OR_EDIT_ONE_LINER_CONTINUE_BTN_ON_T');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'viewOrEditPost',
                                      queryParameters: {
                                        'postText': serializeParam(
                                          _model.oneLinerText,
                                          ParamType.String,
                                        ),
                                        'postRef': serializeParam(
                                          widget.postRef,
                                          ParamType.DocumentReference,
                                        ),
                                        'oneLinerIndex': serializeParam(
                                          _model.whichIndexExpanded,
                                          ParamType.int,
                                        ),
                                        'postTitle': serializeParam(
                                          widget.postTitle,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: 'Continue',
                                  options: FFButtonOptions(
                                    width: 100.0,
                                    height: 36.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Plus Jakarta Sans'),
                                        ),
                                    elevation: 2.0,
                                    borderSide: const BorderSide(
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
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 8.0, 24.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                              const Duration(milliseconds: 2000),
                                              () => setState(() {}),
                                            ),
                                            autofocus: false,
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
                                                            const Color(0xFF57636C),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                'Plus Jakarta Sans'),
                                                      ),
                                              enabledBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFF4B39EF),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              errorBorder: const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFF5963),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFFF5963),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.only(
                                                  topLeft: Radius.circular(4.0),
                                                  topRight:
                                                      Radius.circular(4.0),
                                                ),
                                              ),
                                              contentPadding:
                                                  const EdgeInsetsDirectional
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
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
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
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Builder(
                                            builder: (context) {
                                              final oneLiners =
                                                  widget.postText!.toList();

                                              return ListView.separated(
                                                padding: const EdgeInsets.fromLTRB(
                                                  0,
                                                  0,
                                                  0,
                                                  70.0,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                itemCount: oneLiners.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 12.0),
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
                                                    lineItemIndex:
                                                        oneLinersIndex,
                                                    whichIndexExpanded: _model
                                                        .whichIndexExpanded,
                                                    textFieldUpdateAction:
                                                        (textFieldvalue) async {
                                                      logFirebaseEvent(
                                                          'VIEW_OR_EDIT_ONE_LINER_Container_qtfvikw');
                                                      logFirebaseEvent(
                                                          'oneLinerExpandable_update_page_state');
                                                      _model.oneLinerText =
                                                          textFieldvalue!;
                                                    },
                                                    onTapAction: () async {
                                                      logFirebaseEvent(
                                                          'VIEW_OR_EDIT_ONE_LINER_Container_qtfvikw');
                                                      logFirebaseEvent(
                                                          'oneLinerExpandable_update_page_state');
                                                      _model.whichIndexExpanded =
                                                          oneLinersIndex;
                                                      _model.oneLinerText =
                                                          oneLinersItem;
                                                      setState(() {});
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          ),
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
