import '/auth/firebase_auth/auth_util.dart';
import '/components/empty_state_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'campaigns_widget.dart' show CampaignsWidget;
import 'package:badges/badges.dart' as badges;
import 'package:rive/rive.dart' hide LinearGradient;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CampaignsModel extends FlutterFlowModel<CampaignsWidget> {
  ///  Local state fields for this page.

  bool createContentDialogVisible = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList = [
    'GDSC Modules',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers = [];
  // Model for emptyState component.
  late EmptyStateModel emptyStateModel;

  @override
  void initState(BuildContext context) {
    riveAnimationAnimationsList.forEach((name) {
      riveAnimationControllers.add(FlutterFlowRiveController(
        name,
        shouldLoop: true,
      ));
    });

    emptyStateModel = createModel(context, () => EmptyStateModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emptyStateModel.dispose();
  }
}
