// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EndsAtStruct extends FFFirebaseStruct {
  EndsAtStruct({
    int? day,
    int? month,
    int? year,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _day = day,
        _month = month,
        _year = year,
        super(firestoreUtilData);

  // "day" field.
  int? _day;
  int get day => _day ?? 0;
  set day(int? val) => _day = val;

  void incrementDay(int amount) => day = day + amount;

  bool hasDay() => _day != null;

  // "month" field.
  int? _month;
  int get month => _month ?? 0;
  set month(int? val) => _month = val;

  void incrementMonth(int amount) => month = month + amount;

  bool hasMonth() => _month != null;

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  set year(int? val) => _year = val;

  void incrementYear(int amount) => year = year + amount;

  bool hasYear() => _year != null;

  static EndsAtStruct fromMap(Map<String, dynamic> data) => EndsAtStruct(
        day: castToType<int>(data['day']),
        month: castToType<int>(data['month']),
        year: castToType<int>(data['year']),
      );

  static EndsAtStruct? maybeFromMap(dynamic data) =>
      data is Map ? EndsAtStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'day': _day,
        'month': _month,
        'year': _year,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'day': serializeParam(
          _day,
          ParamType.int,
        ),
        'month': serializeParam(
          _month,
          ParamType.int,
        ),
        'year': serializeParam(
          _year,
          ParamType.int,
        ),
      }.withoutNulls;

  static EndsAtStruct fromSerializableMap(Map<String, dynamic> data) =>
      EndsAtStruct(
        day: deserializeParam(
          data['day'],
          ParamType.int,
          false,
        ),
        month: deserializeParam(
          data['month'],
          ParamType.int,
          false,
        ),
        year: deserializeParam(
          data['year'],
          ParamType.int,
          false,
        ),
      );

  static EndsAtStruct fromAlgoliaData(Map<String, dynamic> data) =>
      EndsAtStruct(
        day: convertAlgoliaParam(
          data['day'],
          ParamType.int,
          false,
        ),
        month: convertAlgoliaParam(
          data['month'],
          ParamType.int,
          false,
        ),
        year: convertAlgoliaParam(
          data['year'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'EndsAtStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EndsAtStruct &&
        day == other.day &&
        month == other.month &&
        year == other.year;
  }

  @override
  int get hashCode => const ListEquality().hash([day, month, year]);
}

EndsAtStruct createEndsAtStruct({
  int? day,
  int? month,
  int? year,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EndsAtStruct(
      day: day,
      month: month,
      year: year,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EndsAtStruct? updateEndsAtStruct(
  EndsAtStruct? endsAt, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    endsAt
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEndsAtStructData(
  Map<String, dynamic> firestoreData,
  EndsAtStruct? endsAt,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (endsAt == null) {
    return;
  }
  if (endsAt.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && endsAt.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final endsAtData = getEndsAtFirestoreData(endsAt, forFieldValue);
  final nestedData = endsAtData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = endsAt.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEndsAtFirestoreData(
  EndsAtStruct? endsAt, [
  bool forFieldValue = false,
]) {
  if (endsAt == null) {
    return {};
  }
  final firestoreData = mapToFirestore(endsAt.toMap());

  // Add any Firestore field values
  endsAt.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEndsAtListFirestoreData(
  List<EndsAtStruct>? endsAts,
) =>
    endsAts?.map((e) => getEndsAtFirestoreData(e, true)).toList() ?? [];
