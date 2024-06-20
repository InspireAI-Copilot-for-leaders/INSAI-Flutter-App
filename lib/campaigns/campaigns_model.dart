import '/components/empty_state_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'campaigns_widget.dart' show CampaignsWidget;
import 'package:flutter/material.dart';

class CampaignsModel extends FlutterFlowModel<CampaignsWidget> {
  ///  Local state fields for this page.

  bool createContentDialogVisible = false;

  bool createCampaignLoaderVisible = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for emptyState component.
  late EmptyStateModel emptyStateModel1;
  // Model for emptyState component.
  late EmptyStateModel emptyStateModel2;

  @override
  void initState(BuildContext context) {
    emptyStateModel1 = createModel(context, () => EmptyStateModel());
    emptyStateModel2 = createModel(context, () => EmptyStateModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emptyStateModel1.dispose();
    emptyStateModel2.dispose();
  }
}
