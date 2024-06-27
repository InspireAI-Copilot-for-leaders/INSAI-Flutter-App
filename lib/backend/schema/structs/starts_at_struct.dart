// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StartsAtStruct extends FFFirebaseStruct {
  StartsAtStruct({
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

  static StartsAtStruct fromMap(Map<String, dynamic> data) => StartsAtStruct(
        day: castToType<int>(data['day']),
        month: castToType<int>(data['month']),
        year: castToType<int>(data['year']),
      );

  static StartsAtStruct? maybeFromMap(dynamic data) =>
      data is Map ? StartsAtStruct.fromMap(data.cast<String, dynamic>()) : null;

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

  static StartsAtStruct fromSerializableMap(Map<String, dynamic> data) =>
      StartsAtStruct(
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

  static StartsAtStruct fromAlgoliaData(Map<String, dynamic> data) =>
      StartsAtStruct(
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
  String toString() => 'StartsAtStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StartsAtStruct &&
        day == other.day &&
        month == other.month &&
        year == other.year;
  }

  @override
  int get hashCode => const ListEquality().hash([day, month, year]);
}

StartsAtStruct createStartsAtStruct({
  int? day,
  int? month,
  int? year,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StartsAtStruct(
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

StartsAtStruct? updateStartsAtStruct(
  StartsAtStruct? startsAt, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    startsAt
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStartsAtStructData(
  Map<String, dynamic> firestoreData,
  StartsAtStruct? startsAt,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (startsAt == null) {
    return;
  }
  if (startsAt.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && startsAt.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final startsAtData = getStartsAtFirestoreData(startsAt, forFieldValue);
  final nestedData = startsAtData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = startsAt.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStartsAtFirestoreData(
  StartsAtStruct? startsAt, [
  bool forFieldValue = false,
]) {
  if (startsAt == null) {
    return {};
  }
  final firestoreData = mapToFirestore(startsAt.toMap());

  // Add any Firestore field values
  startsAt.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStartsAtListFirestoreData(
  List<StartsAtStruct>? startsAts,
) =>
    startsAts?.map((e) => getStartsAtFirestoreData(e, true)).toList() ?? [];
