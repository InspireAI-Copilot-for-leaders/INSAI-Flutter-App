import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'profile_loading_screen_model.dart';
export 'profile_loading_screen_model.dart';

class ProfileLoadingScreenWidget extends StatefulWidget {
  const ProfileLoadingScreenWidget({
    super.key,
    String? loadingText,
  }) : this.loadingText =
            loadingText ?? 'This usually takes a minute. Hang tight...';

  final String loadingText;

  @override
  State<ProfileLoadingScreenWidget> createState() =>
      _ProfileLoadingScreenWidgetState();
}

class _ProfileLoadingScreenWidgetState
    extends State<ProfileLoadingScreenWidget> {
  late ProfileLoadingScreenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileLoadingScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
            child: Lottie.asset(
              'assets/lottie_animations/Animation_-_1706647796241.json',
              width: 180.0,
              height: 180.0,
              fit: BoxFit.cover,
              animate: true,
            ),
          ),
          Opacity(
            opacity: 0.6,
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 36.0, 30.0),
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
