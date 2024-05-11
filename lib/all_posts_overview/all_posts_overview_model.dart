import '/backend/backend.dart';
import '/components/empty_state_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'all_posts_overview_widget.dart' show AllPostsOverviewWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AllPostsOverviewModel extends FlutterFlowModel<AllPostsOverviewWidget> {
  ///  Local state fields for this page.

  bool createContentDialogVisible = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for postedListView widget.

  PagingController<DocumentSnapshot?, PostedOnLinkedinRecord>?
      postedListViewPagingController;
  Query? postedListViewPagingQuery;
  List<StreamSubscription?> postedListViewStreamSubscriptions = [];

  // State field(s) for scheduledListView widget.

  PagingController<DocumentSnapshot?, ScheduledPostsRecord>?
      scheduledListViewPagingController;
  Query? scheduledListViewPagingQuery;
  List<StreamSubscription?> scheduledListViewStreamSubscriptions = [];

  // Model for emptyState component.
  late EmptyStateModel emptyStateModel;

  @override
  void initState(BuildContext context) {
    emptyStateModel = createModel(context, () => EmptyStateModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    for (var s in postedListViewStreamSubscriptions) {
      s?.cancel();
    }
    postedListViewPagingController?.dispose();

    for (var s in scheduledListViewStreamSubscriptions) {
      s?.cancel();
    }
    scheduledListViewPagingController?.dispose();

    emptyStateModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, PostedOnLinkedinRecord>
      setPostedListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    postedListViewPagingController ??=
        _createPostedListViewController(query, parent);
    if (postedListViewPagingQuery != query) {
      postedListViewPagingQuery = query;
      postedListViewPagingController?.refresh();
    }
    return postedListViewPagingController!;
  }

  PagingController<DocumentSnapshot?, PostedOnLinkedinRecord>
      _createPostedListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, PostedOnLinkedinRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryPostedOnLinkedinRecordPage(
          parent: parent,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: postedListViewStreamSubscriptions,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ScheduledPostsRecord>
      setScheduledListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    scheduledListViewPagingController ??=
        _createScheduledListViewController(query, parent);
    if (scheduledListViewPagingQuery != query) {
      scheduledListViewPagingQuery = query;
      scheduledListViewPagingController?.refresh();
    }
    return scheduledListViewPagingController!;
  }

  PagingController<DocumentSnapshot?, ScheduledPostsRecord>
      _createScheduledListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ScheduledPostsRecord>(
            firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryScheduledPostsRecordPage(
          queryBuilder: (_) => scheduledListViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: scheduledListViewStreamSubscriptions,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
