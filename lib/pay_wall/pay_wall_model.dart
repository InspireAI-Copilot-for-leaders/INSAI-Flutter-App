import '/flutter_flow/flutter_flow_util.dart';
import 'pay_wall_widget.dart' show PayWallWidget;
import 'package:flutter/material.dart';

class PayWallModel extends FlutterFlowModel<PayWallWidget> {
  ///  Local state fields for this page.

  bool paymentLoading = false;

  bool isYearly = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? yearlySubs;
  // Stores action output result for [RevenueCat - Purchase] action in Button widget.
  bool? monthlySubs;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
