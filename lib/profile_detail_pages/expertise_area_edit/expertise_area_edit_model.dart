import '/backend/backend.dart';
import '/components/empty_state_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'expertise_area_edit_widget.dart' show ExpertiseAreaEditWidget;
import 'package:flutter/material.dart';

class ExpertiseAreaEditModel extends FlutterFlowModel<ExpertiseAreaEditWidget> {
  ///  Local state fields for this page.

  bool addNewArea = false;

  List<ThoughtLeadershipAreasMappingStruct> leadershipAreasMapping = [];
  void addToLeadershipAreasMapping(ThoughtLeadershipAreasMappingStruct item) =>
      leadershipAreasMapping.add(item);
  void removeFromLeadershipAreasMapping(
          ThoughtLeadershipAreasMappingStruct item) =>
      leadershipAreasMapping.remove(item);
  void removeAtIndexFromLeadershipAreasMapping(int index) =>
      leadershipAreasMapping.removeAt(index);
  void insertAtIndexInLeadershipAreasMapping(
          int index, ThoughtLeadershipAreasMappingStruct item) =>
      leadershipAreasMapping.insert(index, item);
  void updateLeadershipAreasMappingAtIndex(
          int index, Function(ThoughtLeadershipAreasMappingStruct) updateFn) =>
      leadershipAreasMapping[index] = updateFn(leadershipAreasMapping[index]);

  List<String> addExpertiseAreaList = [];
  void addToAddExpertiseAreaList(String item) => addExpertiseAreaList.add(item);
  void removeFromAddExpertiseAreaList(String item) =>
      addExpertiseAreaList.remove(item);
  void removeAtIndexFromAddExpertiseAreaList(int index) =>
      addExpertiseAreaList.removeAt(index);
  void insertAtIndexInAddExpertiseAreaList(int index, String item) =>
      addExpertiseAreaList.insert(index, item);
  void updateAddExpertiseAreaListAtIndex(
          int index, Function(String) updateFn) =>
      addExpertiseAreaList[index] = updateFn(addExpertiseAreaList[index]);

  bool emptySearch = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for contentURL1 widget.
  FocusNode? contentURL1FocusNode;
  TextEditingController? contentURL1TextController;
  String? Function(BuildContext, String?)? contentURL1TextControllerValidator;
  // Algolia Search Results from action on contentURL1
  List<ExpertiseAreasCollectionRecord>? algoliaSearchResults = [];
  // Model for emptyState component.
  late EmptyStateModel emptyStateModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    emptyStateModel = createModel(context, () => EmptyStateModel());
  }

  @override
  void dispose() {
    contentURL1FocusNode?.dispose();
    contentURL1TextController?.dispose();

    emptyStateModel.dispose();
    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
