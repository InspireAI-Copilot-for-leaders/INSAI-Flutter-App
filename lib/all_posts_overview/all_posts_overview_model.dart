import '/components/empty_state_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'all_posts_overview_widget.dart' show AllPostsOverviewWidget;
import 'package:flutter/material.dart';

class AllPostsOverviewModel extends FlutterFlowModel<AllPostsOverviewWidget> {
  ///  Local state fields for this page.

  bool createContentDialogVisible = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for emptyState component.
  late EmptyStateModel emptyStateModel;

  @override
  void initState(BuildContext context) {
    emptyStateModel = createModel(context, () => EmptyStateModel());
  }

  @override
  void dispose() {
    emptyStateModel.dispose();
  }
}
