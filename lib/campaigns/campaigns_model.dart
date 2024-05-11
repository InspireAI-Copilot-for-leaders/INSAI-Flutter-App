import '/components/empty_state_widget.dart';
import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'campaigns_widget.dart' show CampaignsWidget;
import 'package:flutter/material.dart';

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
    for (var name in riveAnimationAnimationsList) {
      riveAnimationControllers.add(FlutterFlowRiveController(
        name,
        shouldLoop: true,
      ));
    }

    emptyStateModel = createModel(context, () => EmptyStateModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emptyStateModel.dispose();
  }
}
