import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'exit_dialog_model.dart';
export 'exit_dialog_model.dart';

class ExitDialogWidget extends StatefulWidget {
  const ExitDialogWidget({
    super.key,
    required this.saveAction,
    required this.discardAction,
  });

  final Future Function()? saveAction;
  final Future Function()? discardAction;

  @override
  State<ExitDialogWidget> createState() => _ExitDialogWidgetState();
}

class _ExitDialogWidgetState extends State<ExitDialogWidget> {
  late ExitDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExitDialogModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
        child: Container(
          width: double.infinity,
          height: 180.0,
          constraints: const BoxConstraints(
            maxWidth: 530.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 3.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  1.0,
                ),
              )
            ],
            borderRadius: BorderRadius.circular(24.0),
            border: Border.all(
              color: const Color(0xFFF5FBFB),
              width: 1.0,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 24.0, 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Save Changes?',
                      textAlign: TextAlign.start,
                      style: FlutterFlowTheme.of(context)
                          .headlineMedium
                          .override(
                            fontFamily: 'Montserrat',
                            color: const Color(0xFF101518),
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            useGoogleFonts:
                                GoogleFonts.asMap().containsKey('Montserrat'),
                          ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Text(
                        'You made some changes to the text. Do you want to save them? Any uploaded media will not be saved.',
                        style: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'Montserrat',
                              color: const Color(0xFF57636C),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              useGoogleFonts:
                                  GoogleFonts.asMap().containsKey('Montserrat'),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'EXIT_DIALOG_COMP_GO_BACK_BTN_ON_TAP');
                          logFirebaseEvent('Button_dismiss_dialog');
                          Navigator.pop(context);
                        },
                        text: 'Go Back',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Montserrat',
                                    color: const Color(0xFF101518),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Montserrat'),
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'EXIT_DIALOG_COMP_DISCARD_BTN_ON_TAP');
                              logFirebaseEvent('Button_execute_callback');
                              await widget.discardAction?.call();
                            },
                            text: 'Discard',
                            options: FFButtonOptions(
                              height: 32.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 12.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Colors.white,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context).error,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Montserrat'),
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'EXIT_DIALOG_COMP_SAVE_DRAFT_BTN_ON_TAP');
                              logFirebaseEvent('Button_execute_callback');
                              await widget.saveAction?.call();
                            },
                            text: 'Save Draft',
                            options: FFButtonOptions(
                              height: 32.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Montserrat'),
                                  ),
                              elevation: 0.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
