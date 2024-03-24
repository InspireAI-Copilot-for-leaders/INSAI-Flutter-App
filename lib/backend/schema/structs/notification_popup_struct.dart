// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationPopupStruct extends FFFirebaseStruct {
  NotificationPopupStruct({
    bool? notificationPopupVisible,
    bool? subsToNoti,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _notificationPopupVisible = notificationPopupVisible,
        _subsToNoti = subsToNoti,
        super(firestoreUtilData);

  // "notificationPopupVisible" field.
  bool? _notificationPopupVisible;
  bool get notificationPopupVisible => _notificationPopupVisible ?? true;
  set notificationPopupVisible(bool? val) => _notificationPopupVisible = val;
  bool hasNotificationPopupVisible() => _notificationPopupVisible != null;

  // "subsToNoti" field.
  bool? _subsToNoti;
  bool get subsToNoti => _subsToNoti ?? false;
  set subsToNoti(bool? val) => _subsToNoti = val;
  bool hasSubsToNoti() => _subsToNoti != null;

  static NotificationPopupStruct fromMap(Map<String, dynamic> data) =>
      NotificationPopupStruct(
        notificationPopupVisible: data['notificationPopupVisible'] as bool?,
        subsToNoti: data['subsToNoti'] as bool?,
      );

  static NotificationPopupStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationPopupStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'notificationPopupVisible': _notificationPopupVisible,
        'subsToNoti': _subsToNoti,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'notificationPopupVisible': serializeParam(
          _notificationPopupVisible,
          ParamType.bool,
        ),
        'subsToNoti': serializeParam(
          _subsToNoti,
          ParamType.bool,
        ),
      }.withoutNulls;

  static NotificationPopupStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NotificationPopupStruct(
        notificationPopupVisible: deserializeParam(
          data['notificationPopupVisible'],
          ParamType.bool,
          false,
        ),
        subsToNoti: deserializeParam(
          data['subsToNoti'],
          ParamType.bool,
          false,
        ),
      );

  static NotificationPopupStruct fromAlgoliaData(Map<String, dynamic> data) =>
      NotificationPopupStruct(
        notificationPopupVisible: convertAlgoliaParam(
          data['notificationPopupVisible'],
          ParamType.bool,
          false,
        ),
        subsToNoti: convertAlgoliaParam(
          data['subsToNoti'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'NotificationPopupStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationPopupStruct &&
        notificationPopupVisible == other.notificationPopupVisible &&
        subsToNoti == other.subsToNoti;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([notificationPopupVisible, subsToNoti]);
}

NotificationPopupStruct createNotificationPopupStruct({
  bool? notificationPopupVisible,
  bool? subsToNoti,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationPopupStruct(
      notificationPopupVisible: notificationPopupVisible,
      subsToNoti: subsToNoti,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationPopupStruct? updateNotificationPopupStruct(
  NotificationPopupStruct? notificationPopup, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notificationPopup
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationPopupStructData(
  Map<String, dynamic> firestoreData,
  NotificationPopupStruct? notificationPopup,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notificationPopup == null) {
    return;
  }
  if (notificationPopup.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notificationPopup.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationPopupData =
      getNotificationPopupFirestoreData(notificationPopup, forFieldValue);
  final nestedData =
      notificationPopupData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = notificationPopup.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationPopupFirestoreData(
  NotificationPopupStruct? notificationPopup, [
  bool forFieldValue = false,
]) {
  if (notificationPopup == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notificationPopup.toMap());

  // Add any Firestore field values
  notificationPopup.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationPopupListFirestoreData(
  List<NotificationPopupStruct>? notificationPopups,
) =>
    notificationPopups
        ?.map((e) => getNotificationPopupFirestoreData(e, true))
        .toList() ??
    [];
