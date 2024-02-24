import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/leader_display_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'other_leaders_widget.dart' show OtherLeadersWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OtherLeadersModel extends FlutterFlowModel<OtherLeadersWidget> {
  ///  Local state fields for this page.

  String contentUrlFields = '1';

  List<DocumentReference> leadersSelected = [];
  void addToLeadersSelected(DocumentReference item) =>
      leadersSelected.add(item);
  void removeFromLeadersSelected(DocumentReference item) =>
      leadersSelected.remove(item);
  void removeAtIndexFromLeadersSelected(int index) =>
      leadersSelected.removeAt(index);
  void insertAtIndexInLeadersSelected(int index, DocumentReference item) =>
      leadersSelected.insert(index, item);
  void updateLeadersSelectedAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      leadersSelected[index] = updateFn(leadersSelected[index]);

  int? areaIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in otherLeaders widget.
  List<ExpertiseAreasRecord>? actionQuery;
  // State field(s) for contentURL2 widget.
  FocusNode? contentURL2FocusNode;
  TextEditingController? contentURL2Controller;
  String? Function(BuildContext, String?)? contentURL2ControllerValidator;
  // State field(s) for contentURL3 widget.
  FocusNode? contentURL3FocusNode;
  TextEditingController? contentURL3Controller;
  String? Function(BuildContext, String?)? contentURL3ControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    contentURL2FocusNode?.dispose();
    contentURL2Controller?.dispose();

    contentURL3FocusNode?.dispose();
    contentURL3Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
