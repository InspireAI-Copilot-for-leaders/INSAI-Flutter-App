import '/flutter_flow/flutter_flow_util.dart';
import 'campaign_loading_widget.dart' show CampaignLoadingWidget;
import 'package:flutter/material.dart';

class CampaignLoadingModel extends FlutterFlowModel<CampaignLoadingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
