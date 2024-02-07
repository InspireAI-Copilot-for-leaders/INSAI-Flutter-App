import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/leader_display_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'other_leaders_model.dart';
export 'other_leaders_model.dart';

class OtherLeadersWidget extends StatefulWidget {
  const OtherLeadersWidget({super.key});

  @override
  State<OtherLeadersWidget> createState() => _OtherLeadersWidgetState();
}

class _OtherLeadersWidgetState extends State<OtherLeadersWidget> {
  late OtherLeadersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtherLeadersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final firestoreBatch = FirebaseFirestore.instance.batch();
      try {
        _model.profilePicture =
            await LinkedInDataGroup.linkedinProfilePictureCall.call(
          authToken: valueOrDefault(currentUserDocument?.linkedinAccess, ''),
        );
        if ((_model.profilePicture?.succeeded ?? true)) {
          firestoreBatch.update(currentUserReference!, {
            ...createUsersRecordData(
              linkedinUrn:
                  'urn:li:person:${currentUserDocument?.linkedinDetails.id}',
            ),
            ...mapToFirestore(
              {
                'profilePictureLinks': LinkedInDataGroup
                    .linkedinProfilePictureCall
                    .profilePictureList(
                  (_model.profilePicture?.jsonBody ?? ''),
                ),
              },
            ),
          });
        }
        _model.firstConnectionSize =
            await LinkedInDataGroup.firstDegreeConnectionsSizeCall.call(
          authToken: valueOrDefault(currentUserDocument?.linkedinAccess, ''),
          personUrn: valueOrDefault(currentUserDocument?.linkedinUrn, ''),
        );
        if ((_model.firstConnectionSize?.succeeded ?? true)) {
          firestoreBatch.update(
              currentUserReference!,
              createUsersRecordData(
                firstDegreeConnectionsSize: getJsonField(
                  (_model.firstConnectionSize?.jsonBody ?? ''),
                  r'''$.firstDegreeSize''',
                ),
              ));
        }
      } finally {
        await firestoreBatch.commit();
      }
    });

    _model.contentURL2Controller ??= TextEditingController();
    _model.contentURL2FocusNode ??= FocusNode();

    _model.contentURL3Controller ??= TextEditingController();
    _model.contentURL3FocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: SizedBox(
              width: double.infinity,
              child: Stack(
                alignment: const AlignmentDirectional(-1.0, 0.0),
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pop();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 4.0, 0.0, 4.0),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 22.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              4.0, 4.0, 0.0, 4.0),
                          child: Text(
                            'Back ',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineMediumFamily,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineMediumFamily),
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Text(
                      'Similar Leaders',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 0.0),
                    child: Icon(
                      Icons.contact_support_outlined,
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 0.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 4.0),
                            child: AutoSizeText(
                              'Your Peers',
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context)
                                  .displayMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .displayMediumFamily,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .displayMediumFamily),
                                  ),
                              minFontSize: 24.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Text(
                              'Select 3 or more thought leaders in your field whose content you find insightful. We will take inspiration from them to improve your content.',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelLargeFamily,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .labelLargeFamily),
                                  ),
                            ),
                          ),
                          if (_model.contentUrlFields == '2')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.contentURL2Controller,
                                focusNode: _model.contentURL2FocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText:
                                      'We\'ll automatically detect your voice',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        fontSize: 12.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x7A080808),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                validator: _model.contentURL2ControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          if (_model.contentUrlFields == '3')
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: TextFormField(
                                controller: _model.contentURL3Controller,
                                focusNode: _model.contentURL3FocusNode,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText:
                                      'We\'ll automatically detect your voice',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelMediumFamily,
                                        fontSize: 12.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x7A080808),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                validator: _model.contentURL3ControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          Flexible(
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: AuthUserStreamWidget(
                                builder: (context) =>
                                    StreamBuilder<List<ThoughtLeadersRecord>>(
                                  stream: queryThoughtLeadersRecord(
                                    queryBuilder: (thoughtLeadersRecord) =>
                                        thoughtLeadersRecord.whereIn(
                                            'broad_domain',
                                            (currentUserDocument?.broadDomains
                                                    .toList() ??
                                                [])),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 200.0, 0.0, 100.0),
                                          child: SizedBox(
                                            width: 70.0,
                                            height: 70.0,
                                            child: SpinKitRipple(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 70.0,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ThoughtLeadersRecord>
                                        staggeredViewThoughtLeadersRecordList =
                                        snapshot.data!;
                                    return MasonryGridView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                      ),
                                      crossAxisSpacing: 8.0,
                                      mainAxisSpacing: 8.0,
                                      itemCount:
                                          staggeredViewThoughtLeadersRecordList
                                              .length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (context, staggeredViewIndex) {
                                        final staggeredViewThoughtLeadersRecord =
                                            staggeredViewThoughtLeadersRecordList[
                                                staggeredViewIndex];
                                        return LeaderDisplayCardWidget(
                                          key: Key(
                                              'Keytun_${staggeredViewIndex}_of_${staggeredViewThoughtLeadersRecordList.length}'),
                                          nameOfLeader:
                                              staggeredViewThoughtLeadersRecord
                                                  .name,
                                          designation:
                                              staggeredViewThoughtLeadersRecord
                                                  .designation,
                                          speaksAbout:
                                              staggeredViewThoughtLeadersRecord
                                                  .speaksAbout,
                                          leaderImage:
                                              staggeredViewThoughtLeadersRecord
                                                  .imageLink,
                                          addToPageStateAction: () async {
                                            if (_model.leadersSelected.contains(
                                                staggeredViewThoughtLeadersRecord
                                                    .reference)) {
                                              setState(() {
                                                _model.removeFromLeadersSelected(
                                                    staggeredViewThoughtLeadersRecord
                                                        .reference);
                                              });
                                            } else {
                                              setState(() {
                                                _model.addToLeadersSelected(
                                                    staggeredViewThoughtLeadersRecord
                                                        .reference);
                                              });
                                            }
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
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
                      const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 24.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await currentUserReference!.update({
                        ...createUsersRecordData(
                          isProfileCompleted: true,
                        ),
                        ...mapToFirestore(
                          {
                            'other_selected_leaders': _model.leadersSelected,
                          },
                        ),
                      });

                      context.goNamed('home');
                    },
                    text: 'Continue',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 48.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primaryText,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleMedium
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleMediumFamily,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleMediumFamily),
                          ),
                      elevation: 4.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                      hoverColor: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
