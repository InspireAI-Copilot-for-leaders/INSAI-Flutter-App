import '/backend/api_requests/api_calls.dart';
import '/components/allow_notification_popup_widget.dart';
import '/components/empty_state_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  bool createContentDialogVisible = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (First degree connections size)] action in Icon widget.
  ApiCallResponse? firstConnectionSize;
  // Model for emptyState component.
  late EmptyStateModel emptyStateModel1;
  // Model for emptyState component.
  late EmptyStateModel emptyStateModel2;
  // Model for Allow_notification_popup component.
  late AllowNotificationPopupModel allowNotificationPopupModel;

  @override
  void initState(BuildContext context) {
    emptyStateModel1 = createModel(context, () => EmptyStateModel());
    emptyStateModel2 = createModel(context, () => EmptyStateModel());
    allowNotificationPopupModel =
        createModel(context, () => AllowNotificationPopupModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emptyStateModel1.dispose();
    emptyStateModel2.dispose();
    allowNotificationPopupModel.dispose();
  }
}
