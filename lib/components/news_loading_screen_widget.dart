import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'news_loading_screen_model.dart';
export 'news_loading_screen_model.dart';

class NewsLoadingScreenWidget extends StatefulWidget {
  const NewsLoadingScreenWidget({
    super.key,
    String? loadingText,
  }) : loadingText =
            loadingText ?? 'This usually takes a minute. Hang tight...';

  final String loadingText;

  @override
  State<NewsLoadingScreenWidget> createState() =>
      _NewsLoadingScreenWidgetState();
}

class _NewsLoadingScreenWidgetState extends State<NewsLoadingScreenWidget> {
  late NewsLoadingScreenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsLoadingScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
            child: Lottie.asset(
              'assets/lottie_animations/newsLoading.json',
              width: 180.0,
              height: 180.0,
              fit: BoxFit.cover,
              animate: true,
            ),
          ),
          Opacity(
            opacity: 0.6,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 36.0, 30.0),
              child: Text(
                widget.loadingText,
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      useGoogleFonts: GoogleFonts.asMap().containsKey(
                          FlutterFlowTheme.of(context).bodyMediumFamily),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
