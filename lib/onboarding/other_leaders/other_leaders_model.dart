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

  int? areaIndex = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for contentURL2 widget.
  FocusNode? contentURL2FocusNode;
  TextEditingController? contentURL2TextController;
  String? Function(BuildContext, String?)? contentURL2TextControllerValidator;
  // State field(s) for contentURL3 widget.
  FocusNode? contentURL3FocusNode;
  TextEditingController? contentURL3TextController;
  String? Function(BuildContext, String?)? contentURL3TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    contentURL2FocusNode?.dispose();
    contentURL2TextController?.dispose();

    contentURL3FocusNode?.dispose();
    contentURL3TextController?.dispose();
  }
}
