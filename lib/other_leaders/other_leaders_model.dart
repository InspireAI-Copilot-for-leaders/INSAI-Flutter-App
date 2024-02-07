import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'other_leaders_widget.dart' show OtherLeadersWidget;
import 'package:flutter/material.dart';

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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Linkedin Profile Picture)] action in otherLeaders widget.
  ApiCallResponse? profilePicture;
  // Stores action output result for [Backend Call - API (First degree connections size)] action in otherLeaders widget.
  ApiCallResponse? firstConnectionSize;
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
