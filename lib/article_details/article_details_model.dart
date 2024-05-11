import '/flutter_flow/flutter_flow_util.dart';
import 'article_details_widget.dart' show ArticleDetailsWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ArticleDetailsModel extends FlutterFlowModel<ArticleDetailsWidget> {
  ///  Local state fields for this page.

  bool createContentDialogVisible = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableExpandableController.dispose();
  }
}
