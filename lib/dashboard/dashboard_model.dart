import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/cloud_functions/cloud_functions.dart';
import '/components/allow_notification_popup_widget.dart';
import '/components/empty_state_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  bool createContentDialogVisible = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
