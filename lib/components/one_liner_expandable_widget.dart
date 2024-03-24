import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'one_liner_expandable_model.dart';
export 'one_liner_expandable_model.dart';

class OneLinerExpandableWidget extends StatefulWidget {
  const OneLinerExpandableWidget({
    super.key,
    required this.headerText,
    required this.expandedText,
    required this.textFieldUpdateAction,
    required this.lineItemIndex,
    required this.onTapAction,
    this.whichIndexExpanded,
  });

  final String? headerText;
  final String? expandedText;
  final Future Function(String? textFieldvalue)? textFieldUpdateAction;
  final int? lineItemIndex;
  final Future Function()? onTapAction;
  final int? whichIndexExpanded;

  @override
  State<OneLinerExpandableWidget> createState() =>
      _OneLinerExpandableWidgetState();
}

class _OneLinerExpandableWidgetState extends State<OneLinerExpandableWidget> {
  late OneLinerExpandableModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OneLinerExpandableModel());

    _model.textController ??= TextEditingController(text: widget.expandedText);
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('ONE_LINER_EXPANDABLE_Container_4ntuftuc_');
        logFirebaseEvent('Container_execute_callback');
        await widget.onTapAction?.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 16.0, 12.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      valueOrDefault<String>(
                        widget.headerText,
                        'null',
                      ),
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).displaySmallFamily,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 14.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .displaySmallFamily),
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                    child: Stack(
                      children: [
                        Icon(
                          Icons.circle_outlined,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 24.0,
                        ),
                        if (valueOrDefault<bool>(
                          widget.lineItemIndex == widget.whichIndexExpanded,
                          false,
                        ))
                          Icon(
                            Icons.circle_rounded,
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 24.0,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (valueOrDefault<bool>(
                widget.lineItemIndex == widget.whichIndexExpanded,
                false,
              ))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.textController',
                      Duration(milliseconds: 2000),
                      () async {
                        logFirebaseEvent(
                            'ONE_LINER_EXPANDABLE_TextField_29d3mwk0_');
                        logFirebaseEvent('TextField_execute_callback');
                        await widget.textFieldUpdateAction?.call(
                          _model.textController.text,
                        );
                      },
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle: FlutterFlowTheme.of(context).labelMedium,
                      hintStyle: FlutterFlowTheme.of(context).labelMedium,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 18.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                    maxLines: null,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
