import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/post_content_options_widget.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'view_or_edit_post_copy_model.dart';
export 'view_or_edit_post_copy_model.dart';

class ViewOrEditPostCopyWidget extends StatefulWidget {
  const ViewOrEditPostCopyWidget({
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
  State<ViewOrEditPostCopyWidget> createState() =>
      _ViewOrEditPostCopyWidgetState();
}

class _ViewOrEditPostCopyWidgetState extends State<ViewOrEditPostCopyWidget> {
  late ViewOrEditPostCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ViewOrEditPostCopyModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'viewOrEditPostCopy'});

    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldFocusNode2 ??= FocusNode();

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
              Flexible(
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
                                              'VIEW_OR_EDIT_POST_COPY_Icon_gr9oprw7_ON_');
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
                                      padding: EdgeInsets.all(2.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 30.0,
                                          height: 30.0,
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
                                    Icon(
                                      Icons.access_time_rounded,
                                      color: Color(0xFF6F6E6E),
                                      size: 24.0,
                                    ),
                                    Stack(
                                      children: [
                                        if (_model.typeOfMediaUploaded ==
                                                null ||
                                            _model.typeOfMediaUploaded == '')
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'VIEW_OR_EDIT_POST_COPY_onlyTextButton_ON');
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
                                                        _model.textController2
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
                                                              Text('Success'),
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
                                                  postURN: (_model.linkedinPost
                                                          ?.getHeader(
                                                              'x-linkedin-id') ??
                                                      ''),
                                                  postedOn: getCurrentTimestamp,
                                                  postText: _model
                                                      .textController2.text,
                                                  postTitle: _model
                                                      .textController1.text,
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

                                              setState(() {});
                                            },
                                            text: 'Post',
                                            options: FFButtonOptions(
                                              width: 60.0,
                                              height: 32.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
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
                                              borderSide: BorderSide(
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
                                                  'VIEW_OR_EDIT_POST_COPY_docButton_ON_TAP');
                                              if (_model.typeOfMediaUploaded ==
                                                  'doc') {
                                                logFirebaseEvent(
                                                    'docButton_upload_file_to_firebase');
                                                {
                                                  setState(() => _model
                                                      .isDataUploading1 = true);
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
                                                if ((_model
                                                        .liDocURL?.succeeded ??
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
                                                    docToBeUploaded:
                                                        _model.uploadedFileUrl1,
                                                  );
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
                                                      postText: _model
                                                          .textController2.text,
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
                                                                title: Text(
                                                                    'Success'),
                                                                content: Text(
                                                                    'Your post has been successfully posted!'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
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

                                                      await widget.postRef!.update(
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
                                                            .textController2
                                                            .text,
                                                        postTitle: _model
                                                            .textController1
                                                            .text,
                                                        reactionRefreshQuota: 2,
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
                                                        typeOfPost:
                                                            'testWithDoc',
                                                      ));
                                                      logFirebaseEvent(
                                                          'docButton_navigate_to');

                                                      context.goNamed(
                                                          'allPostsOverview');
                                                    }
                                                  }
                                                }
                                              }

                                              setState(() {});
                                            },
                                            text: 'Post',
                                            options: FFButtonOptions(
                                              width: 60.0,
                                              height: 32.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
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
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                        if (_model.typeOfMediaUploaded ==
                                            'image')
                                          FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'VIEW_OR_EDIT_POST_COPY_imageButton_ON_TA');
                                              if (_model.typeOfMediaUploaded ==
                                                  'image') {
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
                                                    (_model.numberOfImagesUploaded -
                                                        1)) {
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
                                                        setState(() {
                                                          _model.noOfImagesUploadedToFirebase =
                                                              _model.noOfImagesUploadedToFirebase +
                                                                  1;
                                                        });
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
                                                        logFirebaseEvent(
                                                            'imageButton_update_page_state');
                                                        setState(() {
                                                          _model.noOfImagesUploadedToFirebase =
                                                              _model.noOfImagesUploadedToFirebase +
                                                                  1;
                                                        });
                                                      }
                                                    }
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
                                                    postText: _model
                                                        .textController2.text,
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
                                                              title: Text(
                                                                  'Success'),
                                                              content: Text(
                                                                  'Your post has been successfully posted!'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
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
                                                          .textController2.text,
                                                      postTitle: _model
                                                          .textController1.text,
                                                      typeOfPost: 'singleImage',
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
                                                    postText: _model
                                                        .textController2.text,
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
                                                              title: Text(
                                                                  'Success'),
                                                              content: Text(
                                                                  'Your post has been successfully posted!'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
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
                                                          .textController2.text,
                                                      postTitle: _model
                                                          .textController1.text,
                                                      typeOfPost: 'singleImage',
                                                      reactionRefreshQuota: 2,
                                                    ));
                                                    logFirebaseEvent(
                                                        'imageButton_navigate_to');

                                                    context.goNamed(
                                                        'allPostsOverview');
                                                  }
                                                }
                                              }

                                              setState(() {});
                                            },
                                            text: 'Post',
                                            options: FFButtonOptions(
                                              width: 60.0,
                                              height: 32.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
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
                                              borderSide: BorderSide(
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
                                                  'VIEW_OR_EDIT_POST_COPY_pollButton_ON_TAP');
                                              await Future.wait([
                                                Future(() async {
                                                  logFirebaseEvent(
                                                      'pollButton_update_page_state');
                                                  setState(() {
                                                    _model.addToPollOptionsList(
                                                        _model.pollOption1!);
                                                  });
                                                }),
                                                Future(() async {
                                                  logFirebaseEvent(
                                                      'pollButton_update_page_state');
                                                  setState(() {
                                                    _model.addToPollOptionsList(
                                                        _model.pollOption2!);
                                                  });
                                                }),
                                                Future(() async {
                                                  if (_model.pollOption3 !=
                                                          null &&
                                                      _model.pollOption3 !=
                                                          '') {
                                                    logFirebaseEvent(
                                                        'pollButton_update_page_state');
                                                    setState(() {
                                                      _model
                                                          .addToPollOptionsList(
                                                              _model
                                                                  .pollOption3!);
                                                    });
                                                  }
                                                }),
                                                Future(() async {
                                                  if (_model.pollOption4 !=
                                                          null &&
                                                      _model.pollOption4 !=
                                                          '') {
                                                    logFirebaseEvent(
                                                        'pollButton_update_page_state');
                                                    setState(() {
                                                      _model
                                                          .addToPollOptionsList(
                                                              _model
                                                                  .pollOption4!);
                                                    });
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
                                                postText:
                                                    _model.textController2.text,
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
                                                              Text('Success'),
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
                                                        .textController2.text,
                                                    postTitle: _model
                                                        .textController1.text,
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

                                              setState(() {});
                                            },
                                            text: 'Post',
                                            options: FFButtonOptions(
                                              width: 60.0,
                                              height: 32.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
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
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ].divide(SizedBox(width: 8.0)),
                                ),
                              ],
                            ),
                          ),
                          StreamBuilder<CreatedPostsRecord>(
                            stream:
                                CreatedPostsRecord.getDocument(widget.postRef!),
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
                                      24.0, 0.0, 24.0, 24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 12.0),
                                        child: TextFormField(
                                          controller: _model.textController1 ??=
                                              TextEditingController(
                                            text: containerCreatedPostsRecord
                                                .topic,
                                          ),
                                          focusNode: _model.textFieldFocusNode1,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController1',
                                            Duration(milliseconds: 2000),
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
                                                      color: Color(0xFF57636C),
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
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
                                                topRight: Radius.circular(4.0),
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
                                                topRight: Radius.circular(4.0),
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
                                                topRight: Radius.circular(4.0),
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
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 12.0),
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
                                          cursorColor: Color(0xFF4B39EF),
                                          validator: _model
                                              .textController1Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 40.0),
                                        child: TextFormField(
                                          controller: _model.textController2 ??=
                                              TextEditingController(
                                            text: containerCreatedPostsRecord
                                                .content[valueOrDefault<int>(
                                              widget.oneLinerIndex != null
                                                  ? widget.oneLinerIndex
                                                  : 0,
                                              0,
                                            )],
                                          ),
                                          focusNode: _model.textFieldFocusNode2,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController2',
                                            Duration(milliseconds: 2000),
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
                                                      color: Color(0xFF57636C),
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
                                          cursorColor: Color(0xFF4B39EF),
                                          validator: _model
                                              .textController2Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                      if (_model.typeOfMediaUploaded == 'image')
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                        fit: BoxFit.fitHeight,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
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
                                                                'VIEW_OR_EDIT_POST_COPY_Container_v934ugd');
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            setState(() {
                                                              _model.typeOfMediaUploaded =
                                                                  null;
                                                              _model.numberOfImagesUploaded =
                                                                  0;
                                                              _model.uploadedMedia =
                                                                  [];
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            decoration:
                                                                BoxDecoration(
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
                                                                BorderRadius
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
                                                              fit: BoxFit
                                                                  .fitHeight,
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
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
                                                              fit: BoxFit
                                                                  .fitHeight,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
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
                                                                'VIEW_OR_EDIT_POST_COPY_Container_slssatj');
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            setState(() {
                                                              _model.typeOfMediaUploaded =
                                                                  null;
                                                              _model.numberOfImagesUploaded =
                                                                  0;
                                                              _model.uploadedMedia =
                                                                  [];
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            decoration:
                                                                BoxDecoration(
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
                                                              BorderRadius.only(
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
                                                            fit: BoxFit.cover,
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
                                                                    BorderRadius
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
                                                                      .fitHeight,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
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
                                                                      .fitHeight,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
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
                                                                'VIEW_OR_EDIT_POST_COPY_Container_wkc6dtp');
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            setState(() {
                                                              _model.typeOfMediaUploaded =
                                                                  null;
                                                              _model.numberOfImagesUploaded =
                                                                  0;
                                                              _model.uploadedMedia =
                                                                  [];
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            decoration:
                                                                BoxDecoration(
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
                                                              BorderRadius.only(
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
                                                            fit: BoxFit.cover,
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
                                                                    BorderRadius
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
                                                                      .fitHeight,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
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
                                                                      .fitHeight,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
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
                                                                      .fitHeight,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
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
                                                                'VIEW_OR_EDIT_POST_COPY_Container_ck0y627');
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            setState(() {
                                                              _model.typeOfMediaUploaded =
                                                                  null;
                                                              _model.numberOfImagesUploaded =
                                                                  0;
                                                              _model.uploadedMedia =
                                                                  [];
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            decoration:
                                                                BoxDecoration(
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
                                                                    BorderRadius
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
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
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
                                                                      .cover,
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
                                                                    BorderRadius
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
                                                                      .fitHeight,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
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
                                                                      .fitHeight,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
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
                                                                      .fitHeight,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
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
                                                                'VIEW_OR_EDIT_POST_COPY_Container_acr90kd');
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            setState(() {
                                                              _model.typeOfMediaUploaded =
                                                                  null;
                                                              _model.numberOfImagesUploaded =
                                                                  0;
                                                              _model.uploadedMedia =
                                                                  [];
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            decoration:
                                                                BoxDecoration(
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
                                                                    BorderRadius
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
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
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
                                                                      .cover,
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
                                                                    BorderRadius
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
                                                                      .fitHeight,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
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
                                                                      .fitHeight,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius
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
                                                                          .fitHeight,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        100.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xA2080808),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
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
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
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
                                                                'VIEW_OR_EDIT_POST_COPY_Container_67l3jnn');
                                                            logFirebaseEvent(
                                                                'Container_update_page_state');
                                                            setState(() {
                                                              _model.typeOfMediaUploaded =
                                                                  null;
                                                              _model.numberOfImagesUploaded =
                                                                  0;
                                                              _model.uploadedMedia =
                                                                  [];
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            decoration:
                                                                BoxDecoration(
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
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                decoration: BoxDecoration(
                                                  color: Color(0xB8080808),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
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
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
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
                                                          'VIEW_OR_EDIT_POST_COPY_Container_vjgs4iq');
                                                      logFirebaseEvent(
                                                          'Container_update_page_state');
                                                      setState(() {
                                                        _model.typeOfMediaUploaded =
                                                            null;
                                                        _model.numberOfImagesUploaded =
                                                            0;
                                                        _model.uploadedMedia =
                                                            [];
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 24.0,
                                                      height: 24.0,
                                                      decoration: BoxDecoration(
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
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                    color: Color(0x65979797),
                                                    width: 2.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
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
                                                            EdgeInsetsDirectional
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
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
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
                                                            EdgeInsetsDirectional
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
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
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
                                                              EdgeInsetsDirectional
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
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
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
                                                              EdgeInsetsDirectional
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
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
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
                                                alignment: AlignmentDirectional(
                                                    1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
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
                                                          'VIEW_OR_EDIT_POST_COPY_Container_534orpl');
                                                      logFirebaseEvent(
                                                          'Container_update_page_state');
                                                      setState(() {
                                                        _model.typeOfMediaUploaded =
                                                            null;
                                                        _model.numberOfImagesUploaded =
                                                            0;
                                                        _model.uploadedMedia =
                                                            [];
                                                      });
                                                    },
                                                    child: Container(
                                                      width: 24.0,
                                                      height: 24.0,
                                                      decoration: BoxDecoration(
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (_model.typeOfMediaUploaded == null ||
                              _model.typeOfMediaUploaded == '')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'VIEW_OR_EDIT_POST_COPY_Container_60pueuy');
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
                                      () => _model.isDataUploading3 = true);
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
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
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
                                    setState(() {
                                      _model.uploadedLocalFiles3 =
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

                                logFirebaseEvent('Container_update_page_state');
                                setState(() {
                                  _model.typeOfMediaUploaded = 'image';
                                  _model.numberOfImagesUploaded =
                                      _model.uploadedLocalFiles3.length;
                                  _model.uploadedMedia = _model
                                      .uploadedLocalFiles3
                                      .toList()
                                      .cast<FFUploadedFile>();
                                });
                              },
                              child: Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.image_outlined,
                                  color: Color(0xFF535252),
                                  size: 28.0,
                                ),
                              ),
                            ),
                          if (_model.typeOfMediaUploaded == null ||
                              _model.typeOfMediaUploaded == '')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'VIEW_OR_EDIT_POST_COPY_Container_a2sakqw');
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
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.4,
                                          child: PostContentOptionsWidget(
                                            mediaAction: (uploadedMedia) async {
                                              logFirebaseEvent(
                                                  '_update_page_state');
                                              setState(() {
                                                _model.typeOfMediaUploaded =
                                                    'image';
                                                _model.numberOfImagesUploaded =
                                                    uploadedMedia!.length;
                                                _model.uploadedMedia =
                                                    uploadedMedia!
                                                        .toList()
                                                        .cast<FFUploadedFile>();
                                              });
                                            },
                                            documentAction:
                                                (docURL, docTitle) async {
                                              logFirebaseEvent(
                                                  '_update_page_state');
                                              setState(() {
                                                _model.typeOfMediaUploaded =
                                                    'doc';
                                                _model.uploadedDoc = docURL;
                                                _model.uploadedDocTitle =
                                                    docTitle;
                                              });
                                            },
                                            saveAction: () async {
                                              logFirebaseEvent('_backend_call');

                                              await widget.postRef!.update({
                                                ...mapToFirestore(
                                                  {
                                                    'content':
                                                        FieldValue.delete(),
                                                  },
                                                ),
                                              });
                                              logFirebaseEvent('_backend_call');

                                              await widget.postRef!.update({
                                                ...createCreatedPostsRecordData(
                                                  topic: _model
                                                      .textController1.text,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'content':
                                                        FieldValue.arrayUnion([
                                                      _model
                                                          .textController2.text
                                                    ]),
                                                  },
                                                ),
                                              });
                                              logFirebaseEvent('_alert_dialog');
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Saved'),
                                                    content:
                                                        Text('Draft Saved'),
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
                                            },
                                            deleteAction: () async {
                                              logFirebaseEvent('_backend_call');
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
                                              setState(() {
                                                _model.typeOfMediaUploaded =
                                                    'poll';
                                                _model.pollQuestion = question;
                                                _model.pollOption1 = option1;
                                                _model.pollOption2 = option2;
                                                _model.pollOption3 = option3;
                                                _model.pollOption4 = option4;
                                                _model.pollDuration = duration;
                                              });
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
                                child: Icon(
                                  Icons.add_rounded,
                                  color: Color(0xFF504E4E),
                                  size: 32.0,
                                ),
                              ),
                            ),
                        ].divide(SizedBox(width: 10.0)),
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
