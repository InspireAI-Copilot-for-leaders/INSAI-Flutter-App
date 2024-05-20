import '/components/empty_state_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'discover_page_widget.dart' show DiscoverPageWidget;
import 'package:flutter/material.dart';

class DiscoverPageModel extends FlutterFlowModel<DiscoverPageWidget> {
  ///  Local state fields for this page.

  String filteredTabView = 'For You';

  bool createContentDialogVisible = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - isOverrideCacheAction] action in discoverPage widget.
  bool? isCacheOverride;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for emptyState component.
  late EmptyStateModel emptyStateModel;

  @override
  void initState(BuildContext context) {
    emptyStateModel = createModel(context, () => EmptyStateModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emptyStateModel.dispose();
  }
}
