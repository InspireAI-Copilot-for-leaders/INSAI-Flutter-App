import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_state_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'all_posts_overview_widget.dart' show AllPostsOverviewWidget;
import 'package:badges/badges.dart' as badges;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

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
    postedListViewStreamSubscriptions.forEach((s) => s?.cancel());
    postedListViewPagingController?.dispose();

    scheduledListViewStreamSubscriptions.forEach((s) => s?.cancel());
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
