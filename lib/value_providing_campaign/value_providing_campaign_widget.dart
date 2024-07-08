import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/empty_state_widget.dart';
import '/components/loading_screen_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'value_providing_campaign_model.dart';
export 'value_providing_campaign_model.dart';

class ValueProvidingCampaignWidget extends StatefulWidget {
  const ValueProvidingCampaignWidget({super.key});

  @override
  State<ValueProvidingCampaignWidget> createState() =>
      _ValueProvidingCampaignWidgetState();
}

class _ValueProvidingCampaignWidgetState
    extends State<ValueProvidingCampaignWidget> {
  late ValueProvidingCampaignModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ValueProvidingCampaignModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'valueProvidingCampaign'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('VALUE_PROVIDING_CAMPAIGN_valueProvidingC');
      logFirebaseEvent('valueProvidingCampaign_update_page_state');
      _model.expertiseForContent =
          (currentUserDocument?.thoughtLeadershipAreas.toList() ?? [])
              .toList()
              .cast<String>();
      _model.selectedAreas =
          (currentUserDocument?.thoughtLeadershipAreas.toList() ?? [])
              .take(2)
              .toList()
              .toList()
              .cast<String>();
      setState(() {});
    });

    _model.textController1 ??= TextEditingController(text: 'My Campaign');
    _model.textFieldFocusNode ??= FocusNode();

    _model.contentURL1TextController ??= TextEditingController();
    _model.contentURL1FocusNode ??= FocusNode();

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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.close_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('VALUE_PROVIDING_CAMPAIGN_close_rounded_I');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
          title: Text(
            'Create Campaign',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 16.0, 0.0, 16.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Domain thought leadership',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 4.0, 0.0, 12.0),
                                    child: Text(
                                      'Insights, trends, and expert opinions specific to your industry to establish authority and influence within that domain.',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily),
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller:
                                                    _model.textController1,
                                                focusNode:
                                                    _model.textFieldFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  labelText: 'Campaign Title',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                                  hintText:
                                                      'Enter a title for this campaign...',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: GoogleFonts
                                                                    .asMap()
                                                                .containsKey(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumFamily),
                                                          ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  errorBorder: InputBorder.none,
                                                  focusedErrorBorder:
                                                      InputBorder.none,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 18.0,
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
                                                maxLines: null,
                                                maxLength: 120,
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement
                                                        .enforced,
                                                buildCounter: (context,
                                                        {required currentLength,
                                                        required isFocused,
                                                        maxLength}) =>
                                                    null,
                                                validator: _model
                                                    .textController1Validator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 1.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 12.0, 0.0),
                                              child: Text(
                                                'Areas to create content',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 14.0,
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
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 12.0, 12.0, 8.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final expertiseAreaList =
                                                        _model
                                                            .expertiseForContent
                                                            .toList();
                                                    return Wrap(
                                                      spacing: 4.0,
                                                      runSpacing: 4.0,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: List.generate(
                                                          expertiseAreaList
                                                              .length,
                                                          (expertiseAreaListIndex) {
                                                        final expertiseAreaListItem =
                                                            expertiseAreaList[
                                                                expertiseAreaListIndex];
                                                        return InkWell(
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
                                                                'VALUE_PROVIDING_CAMPAIGN_Container_h1n0y');
                                                            if (!_model
                                                                .selectedAreas
                                                                .contains(
                                                                    expertiseAreaListItem)) {
                                                              logFirebaseEvent(
                                                                  'Container_update_page_state');
                                                              _model
                                                                  .updateSelectedAreasAtIndex(
                                                                _model
                                                                    .indexToRemoveAt,
                                                                (_) =>
                                                                    expertiseAreaListItem,
                                                              );
                                                              setState(() {});
                                                              if (_model
                                                                      .indexToRemoveAt ==
                                                                  0) {
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                _model.indexToRemoveAt =
                                                                    1;
                                                                setState(() {});
                                                              } else {
                                                                logFirebaseEvent(
                                                                    'Container_update_page_state');
                                                                _model.indexToRemoveAt =
                                                                    0;
                                                                setState(() {});
                                                              }
                                                            }
                                                          },
                                                          child: Container(
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _model
                                                                      .selectedAreas
                                                                      .contains(
                                                                          expertiseAreaListItem)
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                  : const Color(
                                                                      0x00000000),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          48.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                width: 2.0,
                                                              ),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          4.0,
                                                                          8.0,
                                                                          4.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child: Text(
                                                                      expertiseAreaListItem,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color: _model.selectedAreas.contains(expertiseAreaListItem)
                                                                                ? FlutterFlowTheme.of(context).alternate
                                                                                : FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                10.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 1.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 12.0),
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
                                                        'VALUE_PROVIDING_CAMPAIGN_Text_gk6j8z1y_O');
                                                    logFirebaseEvent(
                                                        'Text_update_page_state');
                                                    _model.addExpertiseArea =
                                                        true;
                                                    setState(() {});
                                                  },
                                                  child: Text(
                                                    '+ Add More',
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
                                                          fontSize: 12.0,
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 6.0, 12.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            FlutterFlowDropDown<int>(
                                              controller: _model
                                                      .dropDownValueController1 ??=
                                                  FormFieldController<int>(
                                                      null),
                                              options:
                                                  List<int>.from([1, 2, 3, 4]),
                                              optionLabels: const [
                                                '1 week',
                                                '2 weeks',
                                                '3 weeks',
                                                '4 weeks'
                                              ],
                                              onChanged: (val) => setState(() =>
                                                  _model.dropDownValue1 = val),
                                              width: 286.0,
                                              height: 50.0,
                                              textStyle:
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
                                              hintText:
                                                  'Duration of the campaign',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 4.0),
                                              hidesUnderline: true,
                                              isOverButton: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 6.0, 12.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            FlutterFlowDropDown<int>(
                                              controller: _model
                                                      .dropDownValueController2 ??=
                                                  FormFieldController<int>(
                                                      null),
                                              options:
                                                  List<int>.from([1, 2, 3, 5]),
                                              optionLabels: const [
                                                'Once per week',
                                                'Twice per week',
                                                '3 times a week',
                                                '5 times a week'
                                              ],
                                              onChanged: (val) => setState(() =>
                                                  _model.dropDownValue2 = val),
                                              width: 286.0,
                                              height: 50.0,
                                              textStyle:
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
                                              hintText: 'Frequency of posting',
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 24.0,
                                              ),
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 4.0),
                                              hidesUnderline: true,
                                              isOverButton: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'VALUE_PROVIDING_CAMPAIGN_DO_THE_INSPIRE_');
                          if ((_model.dropDownValue1 == null) ||
                              (_model.dropDownValue2 == null)) {
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'One or more of the required fields is empty!',
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
                          } else {
                            logFirebaseEvent('Button_backend_call');
                            _model.apiResult7vv =
                                await DomainThoughtLeaderhipCampaignCall.call(
                              uid: currentUserUid,
                              expertiseareasList: _model.selectedAreas,
                              noOfPosts: (_model.dropDownValue1!) *
                                  (_model.dropDownValue2!),
                              campaignId:
                                  '${dateTimeFormat('d/M/y', getCurrentTimestamp)}-${_model.dropDownValue1?.toString()}-${dateTimeFormat('Hm', getCurrentTimestamp)}',
                            );

                            if ((_model.apiResult7vv?.succeeded ?? true)) {
                              logFirebaseEvent('Button_backend_call');

                              var campaignsDetailsRecordReference =
                                  CampaignsDetailsRecord.createDoc(
                                      currentUserReference!);
                              await campaignsDetailsRecordReference
                                  .set(createCampaignsDetailsRecordData(
                                campaignId:
                                    '${dateTimeFormat('d/M/y', getCurrentTimestamp)}-${_model.dropDownValue1?.toString()}-${dateTimeFormat('Hm', getCurrentTimestamp)}',
                                createdOn: getCurrentTimestamp,
                                campaignTitle: _model.textController1.text,
                              ));
                              _model.apiResult7 =
                                  CampaignsDetailsRecord.getDocumentFromData(
                                      createCampaignsDetailsRecordData(
                                        campaignId:
                                            '${dateTimeFormat('d/M/y', getCurrentTimestamp)}-${_model.dropDownValue1?.toString()}-${dateTimeFormat('Hm', getCurrentTimestamp)}',
                                        createdOn: getCurrentTimestamp,
                                        campaignTitle:
                                            _model.textController1.text,
                                      ),
                                      campaignsDetailsRecordReference);
                              logFirebaseEvent('Button_update_page_state');
                              _model.isLoading = true;
                              setState(() {});
                              logFirebaseEvent('Button_wait__delay');
                              await Future.delayed(
                                  const Duration(milliseconds: 4000));
                              logFirebaseEvent('Button_navigate_to');

                              context.goNamed('campaigns');
                            } else {
                              logFirebaseEvent('Button_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Request Failed!'),
                                    content: const Text(
                                        'Campaign creation request failed.'),
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
                          }

                          setState(() {});
                        },
                        text: 'Do the InspireAI magic',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primaryText,
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleSmallFamily,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                fontSize: 14.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleSmallFamily),
                              ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (_model.isLoading == true)
                wrapWithModel(
                  model: _model.loadingScreenModel,
                  updateCallback: () => setState(() {}),
                  child: LoadingScreenWidget(
                    loadingText:
                        'Configuring your campaign. Will take around 2-3 minutes. You can leave this page...',
                    callToActionVisible: true,
                    buttonText: 'Go to Campaigns',
                    callToAction: () async {
                      logFirebaseEvent(
                          'VALUE_PROVIDING_CAMPAIGN_Container_yc1rq');
                      logFirebaseEvent('LoadingScreen_navigate_to');

                      context.goNamed('campaigns');
                    },
                  ),
                ),
              if (_model.addExpertiseArea)
                Stack(
                  children: [
                    Opacity(
                      opacity: 0.6,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 600.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add Expertise Areas',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 16.0),
                                child: TextFormField(
                                  controller: _model.contentURL1TextController,
                                  focusNode: _model.contentURL1FocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.contentURL1TextController',
                                    const Duration(milliseconds: 2000),
                                    () async {
                                      logFirebaseEvent(
                                          'VALUE_PROVIDING_CAMPAIGN_contentURL1_ON_');
                                      if (_model.contentURL1TextController
                                                  .text !=
                                              '') {
                                        logFirebaseEvent(
                                            'contentURL1_algolia_search');
                                        safeSetState(() =>
                                            _model.algoliaSearchResults = null);
                                        await ExpertiseAreasCollectionRecord
                                                .search(
                                          term: _model
                                              .contentURL1TextController.text,
                                        )
                                            .then((r) =>
                                                _model.algoliaSearchResults = r)
                                            .onError((_, __) => _model
                                                .algoliaSearchResults = [])
                                            .whenComplete(
                                                () => setState(() {}));

                                        if (_model.algoliaSearchResults !=
                                                null &&
                                            (_model.algoliaSearchResults)!
                                                .isNotEmpty) {
                                          logFirebaseEvent(
                                              'contentURL1_update_page_state');
                                          _model.emptySearch = false;
                                          setState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'contentURL1_wait__delay');
                                          await Future.delayed(const Duration(
                                              milliseconds: 1000));
                                          logFirebaseEvent(
                                              'contentURL1_update_page_state');
                                          _model.emptySearch = true;
                                          setState(() {});
                                        }
                                      } else {
                                        logFirebaseEvent(
                                            'contentURL1_update_page_state');
                                        _model.emptySearch = false;
                                        setState(() {});
                                      }
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: 'Start typing to search...',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFFB2B4B8),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xFF5A5D5D),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                    suffixIcon: const Icon(
                                      Icons.search_rounded,
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  validator: _model
                                      .contentURL1TextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Stack(
                                        children: [
                                          if ((_model.emptySearch == null) ||
                                              !_model.emptySearch)
                                            Builder(
                                              builder: (context) {
                                                if (_model.contentURL1TextController
                                                            .text ==
                                                        '') {
                                                  return Container(
                                                    decoration: const BoxDecoration(),
                                                    child: StreamBuilder<
                                                        List<
                                                            BroadDomainRecord>>(
                                                      stream:
                                                          queryBroadDomainRecord(),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              child:
                                                                  SpinKitRipple(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 100.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<BroadDomainRecord>
                                                            listViewBroadDomainRecordList =
                                                            snapshot.data!;
                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewBroadDomainRecordList
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              const SizedBox(
                                                                  height: 4.0),
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewBroadDomainRecord =
                                                                listViewBroadDomainRecordList[
                                                                    listViewIndex];
                                                            return StreamBuilder<
                                                                List<
                                                                    ExpertiseAreasRecord>>(
                                                              stream:
                                                                  queryExpertiseAreasRecord(
                                                                parent:
                                                                    listViewBroadDomainRecord
                                                                        .reference,
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      child:
                                                                          SpinKitRipple(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        size:
                                                                            100.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<ExpertiseAreasRecord>
                                                                    containerExpertiseAreasRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                return Material(
                                                                  color: Colors
                                                                      .transparent,
                                                                  elevation:
                                                                      1.0,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            12.0),
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      color: Colors
                                                                          .transparent,
                                                                      child:
                                                                          ExpandableNotifier(
                                                                        initialExpanded:
                                                                            true,
                                                                        child:
                                                                            ExpandablePanel(
                                                                          header:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                8.0,
                                                                                0.0,
                                                                                8.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Stack(
                                                                                  children: [
                                                                                    if (Theme.of(context).brightness == Brightness.light)
                                                                                      ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          listViewBroadDomainRecord.iconUrl,
                                                                                          width: 36.0,
                                                                                          height: 36.0,
                                                                                          fit: BoxFit.cover,
                                                                                          errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                            'assets/images/error_image.png',
                                                                                            width: 36.0,
                                                                                            height: 36.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if (Theme.of(context).brightness == Brightness.dark)
                                                                                      ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          listViewBroadDomainRecord.iconUrlDarkMode,
                                                                                          width: 36.0,
                                                                                          height: 36.0,
                                                                                          fit: BoxFit.cover,
                                                                                          errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                            'assets/images/error_image.png',
                                                                                            width: 36.0,
                                                                                            height: 36.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                                Flexible(
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      listViewBroadDomainRecord.broadDomain,
                                                                                      style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          collapsed:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                          ),
                                                                          expanded:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(-1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 12.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final expertiseAreaNoSearch = containerExpertiseAreasRecordList.toList();
                                                                                  return Wrap(
                                                                                    spacing: 4.0,
                                                                                    runSpacing: 4.0,
                                                                                    alignment: WrapAlignment.start,
                                                                                    crossAxisAlignment: WrapCrossAlignment.start,
                                                                                    direction: Axis.horizontal,
                                                                                    runAlignment: WrapAlignment.start,
                                                                                    verticalDirection: VerticalDirection.down,
                                                                                    clipBehavior: Clip.none,
                                                                                    children: List.generate(expertiseAreaNoSearch.length, (expertiseAreaNoSearchIndex) {
                                                                                      final expertiseAreaNoSearchItem = expertiseAreaNoSearch[expertiseAreaNoSearchIndex];
                                                                                      return InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          logFirebaseEvent('VALUE_PROVIDING_CAMPAIGN_Container_8jk35');
                                                                                          if (_model.expertiseForContent.contains(expertiseAreaNoSearchItem.expertiseArea)) {
                                                                                            logFirebaseEvent('Container_update_page_state');
                                                                                            _model.removeFromExpertiseForContent(expertiseAreaNoSearchItem.expertiseArea);
                                                                                            setState(() {});
                                                                                          } else {
                                                                                            logFirebaseEvent('Container_update_page_state');
                                                                                            _model.addToExpertiseForContent(expertiseAreaNoSearchItem.expertiseArea);
                                                                                            setState(() {});
                                                                                          }
                                                                                        },
                                                                                        child: Container(
                                                                                          height: 30.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: _model.expertiseForContent.contains(expertiseAreaNoSearchItem.expertiseArea) ? FlutterFlowTheme.of(context).secondary : const Color(0x00000000),
                                                                                            borderRadius: BorderRadius.circular(48.0),
                                                                                            border: Border.all(
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              width: 2.0,
                                                                                            ),
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              if (_model.expertiseForContent.contains(expertiseAreaNoSearchItem.expertiseArea))
                                                                                                Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 20.0,
                                                                                                    height: 20.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      shape: BoxShape.circle,
                                                                                                    ),
                                                                                                    child: Icon(
                                                                                                      Icons.close,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      size: 12.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              Padding(
                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 8.0, 4.0),
                                                                                                child: Container(
                                                                                                  decoration: const BoxDecoration(),
                                                                                                  child: Text(
                                                                                                    expertiseAreaNoSearchItem.expertiseArea,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          theme:
                                                                              ExpandableThemeData(
                                                                            tapHeaderToExpand:
                                                                                true,
                                                                            tapBodyToExpand:
                                                                                false,
                                                                            tapBodyToCollapse:
                                                                                false,
                                                                            headerAlignment:
                                                                                ExpandablePanelHeaderAlignment.center,
                                                                            hasIcon:
                                                                                true,
                                                                            iconColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  );
                                                } else {
                                                  return Container(
                                                    decoration: const BoxDecoration(),
                                                    child: StreamBuilder<
                                                        List<
                                                            BroadDomainRecord>>(
                                                      stream:
                                                          queryBroadDomainRecord(
                                                        queryBuilder: (broadDomainRecord) =>
                                                            broadDomainRecord.whereIn(
                                                                'broad_domain',
                                                                _model
                                                                    .algoliaSearchResults
                                                                    ?.map((e) => e
                                                                        .broadDomain
                                                                        ?.id)
                                                                    .withoutNulls
                                                                    .toList()),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 100.0,
                                                              height: 100.0,
                                                              child:
                                                                  SpinKitRipple(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                size: 100.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<BroadDomainRecord>
                                                            listViewBroadDomainRecordList =
                                                            snapshot.data!;
                                                        if (listViewBroadDomainRecordList
                                                            .isEmpty) {
                                                          return const EmptyStateWidget();
                                                        }
                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewBroadDomainRecordList
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              const SizedBox(
                                                                  height: 4.0),
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewBroadDomainRecord =
                                                                listViewBroadDomainRecordList[
                                                                    listViewIndex];
                                                            return Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 1.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                              ),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  color: Colors
                                                                      .transparent,
                                                                  child:
                                                                      ExpandableNotifier(
                                                                    initialExpanded:
                                                                        true,
                                                                    child:
                                                                        ExpandablePanel(
                                                                      header:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            8.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                if (Theme.of(context).brightness == Brightness.dark)
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      listViewBroadDomainRecord.iconUrlDarkMode,
                                                                                      width: 36.0,
                                                                                      height: 36.0,
                                                                                      fit: BoxFit.cover,
                                                                                      errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                        'assets/images/error_image.png',
                                                                                        width: 36.0,
                                                                                        height: 36.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (Theme.of(context).brightness == Brightness.light)
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      listViewBroadDomainRecord.iconUrl,
                                                                                      width: 36.0,
                                                                                      height: 36.0,
                                                                                      fit: BoxFit.cover,
                                                                                      errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                        'assets/images/error_image.png',
                                                                                        width: 36.0,
                                                                                        height: 36.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            Flexible(
                                                                              child: Padding(
                                                                                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                child: Text(
                                                                                  listViewBroadDomainRecord.broadDomain,
                                                                                  style: FlutterFlowTheme.of(context).displaySmall.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).displaySmallFamily,
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                        fontSize: 14.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      collapsed:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                      expanded:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              4.0,
                                                                              12.0,
                                                                              12.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              if (_model.algoliaSearchResults?.where((e) => e.broadDomain == listViewBroadDomainRecord.reference).toList() == null) {
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
                                                                              final expertiseAreaSearch = _model.algoliaSearchResults?.where((e) => e.broadDomain == listViewBroadDomainRecord.reference).toList().toList() ?? [];
                                                                              return Wrap(
                                                                                spacing: 4.0,
                                                                                runSpacing: 4.0,
                                                                                alignment: WrapAlignment.start,
                                                                                crossAxisAlignment: WrapCrossAlignment.start,
                                                                                direction: Axis.horizontal,
                                                                                runAlignment: WrapAlignment.start,
                                                                                verticalDirection: VerticalDirection.down,
                                                                                clipBehavior: Clip.none,
                                                                                children: List.generate(expertiseAreaSearch.length, (expertiseAreaSearchIndex) {
                                                                                  final expertiseAreaSearchItem = expertiseAreaSearch[expertiseAreaSearchIndex];
                                                                                  return InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      logFirebaseEvent('VALUE_PROVIDING_CAMPAIGN_Container_kuwx1');
                                                                                      if (_model.expertiseForContent.contains(expertiseAreaSearchItem.expertiseArea)) {
                                                                                        logFirebaseEvent('Container_update_page_state');
                                                                                        _model.removeFromExpertiseForContent(expertiseAreaSearchItem.expertiseArea);
                                                                                        setState(() {});
                                                                                      } else {
                                                                                        logFirebaseEvent('Container_update_page_state');
                                                                                        _model.addToExpertiseForContent(expertiseAreaSearchItem.expertiseArea);
                                                                                        setState(() {});
                                                                                      }
                                                                                    },
                                                                                    child: Container(
                                                                                      height: 30.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: _model.expertiseForContent.contains(expertiseAreaSearchItem.expertiseArea) ? FlutterFlowTheme.of(context).secondary : const Color(0x00000000),
                                                                                        borderRadius: BorderRadius.circular(48.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).secondary,
                                                                                          width: 2.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          if (_model.expertiseForContent.contains(expertiseAreaSearchItem.expertiseArea))
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                              child: Container(
                                                                                                width: 20.0,
                                                                                                height: 20.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: Icon(
                                                                                                  Icons.close,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 12.0,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          Padding(
                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 8.0, 4.0),
                                                                                            child: Container(
                                                                                              decoration: const BoxDecoration(),
                                                                                              child: Text(
                                                                                                expertiseAreaSearchItem.expertiseArea,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      theme:
                                                                          ExpandableThemeData(
                                                                        tapHeaderToExpand:
                                                                            true,
                                                                        tapBodyToExpand:
                                                                            false,
                                                                        tapBodyToCollapse:
                                                                            false,
                                                                        headerAlignment:
                                                                            ExpandablePanelHeaderAlignment.center,
                                                                        hasIcon:
                                                                            true,
                                                                        iconColor:
                                                                            FlutterFlowTheme.of(context).primaryText,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          if (_model.emptySearch)
                                            Stack(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 1.0),
                                              children: [
                                                wrapWithModel(
                                                  model: _model.emptyStateModel,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: const EmptyStateWidget(
                                                    loadingText:
                                                        'Cant find what you\'re looking for?',
                                                  ),
                                                ),
                                              ],
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'VALUE_PROVIDING_CAMPAIGN_DONE_BTN_ON_TAP');
                                  logFirebaseEvent('Button_update_page_state');
                                  _model.addExpertiseArea = false;
                                  setState(() {});
                                },
                                text: 'Done',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 36.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 14.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ],
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
    );
  }
}
