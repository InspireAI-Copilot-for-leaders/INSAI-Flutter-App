import '/flutter_flow/flutter_flow_util.dart';
import 'social_accounts_widget.dart' show SocialAccountsWidget;
import 'package:flutter/material.dart';

class SocialAccountsModel extends FlutterFlowModel<SocialAccountsWidget> {
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

  bool isExpanded = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
