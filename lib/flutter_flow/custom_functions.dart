import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? formatStringForLIJson(String input) {
  var output = input
      .replaceAll('\\', '\\\\') // Escape backslashes first
      .replaceAll('\n', '\\n')
      .replaceAll('\r', '\\r')
      .replaceAll('\t', '\\t')
      .replaceAll('\b', '\\b')
      .replaceAll('\f', '\\f')
      .replaceAll('"', '\\"')
      .replaceAll(')', '\\\\)')
      .replaceAll('(', '\\\\(');
  ;

  // Change hashtag element to {hashtag|#|SingleWord}
  //output = output.replaceAllMapped(
  //    RegExp(r'#(\w+)'), (match) => '{hashtag\|\\#\|${match.group(1)}}');

  return output;
}

DateTime? modifiedDateTime(
  DateTime inputTimestamp,
  int? minutes,
  int? hours,
  int? days,
  bool? isAdding,
) {
  // Set default values if null is passed
  int minutesValue = minutes ?? 0;
  int hoursValue = hours ?? 0;
  int daysValue = days ?? 0;
  bool isAddingValue = isAdding ?? true; // default to adding if null

  Duration duration = Duration(
    minutes: minutesValue,
    hours: hoursValue,
    days: daysValue,
  );

  DateTime newTimestamp = isAddingValue
      ? inputTimestamp.add(duration)
      : inputTimestamp.subtract(duration);

  return newTimestamp;
}

String? formatStringforNormalJson(String input) {
  var output = input
      .replaceAll('\\', '\\\\') // Escape backslashes first
      .replaceAll('\n', '\\n')
      .replaceAll('\r', '\\r')
      .replaceAll('\t', '\\t')
      .replaceAll('\b', '\\b')
      .replaceAll('\f', '\\f')
      .replaceAll('"', '\\"');
  ;
  return output;
}

dynamic valueToJsonMapList(
  List<String> listOfURN,
  String keyName,
) {
  // convert list of strings to list of json key value pairs. the key is id for all
  List<Map<String, dynamic>> maps =
      listOfURN.map((urn) => {keyName: urn}).toList();
  return jsonEncode(maps);
}

DateTime combineDateTime(
  DateTime date,
  DateTime time,
) {
  // Give combined date time timstamp from given date and time
  return DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
    time.second,
    time.millisecond,
    time.microsecond,
  );
}

String? getValueFromJson(
  String jsonStr,
  int index,
) {
  try {
    // Decode the JSON string into a dynamic object (List in this case)
    List<dynamic> data = jsonDecode(jsonStr);

    // Access the map at the specified index and return the value associated with the key 'text'
    return data[index]['text'];
  } on FormatException {
    // Handle cases where the json string is malformed
    return 'Invalid JSON format';
  } catch (e) {
    // Handle other errors, such as index out of bounds
    return 'Error: ${e.toString()}';
  }
}

int getIndexFromList(
  List<String> listOfItems,
  String indexRequiredItem,
) {
  // get the index of a particular item from a list of strings
  return listOfItems.indexOf(indexRequiredItem);
}

DateTime? combineDateTimeStr(
  DateTime date,
  String timeString,
) {
  // Parse the time string using DateFormat
  DateFormat timeFormat = DateFormat("HH:mm:ss");
  DateTime time = timeFormat.parse(timeString);

  // Combine the date and time
  return DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
    time.second,
    time.millisecond,
    time.microsecond,
  );
}

dynamic saveChatHistory(
  dynamic chatHistory,
  dynamic newChat,
) {
  // If chatHistory isn't a list, make it a list and then add newChat
  if (chatHistory is List) {
    chatHistory.add(newChat);
    return chatHistory;
  } else {
    return [newChat];
  }
}

dynamic convertToJSON(String prompt) {
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.decode('{"role": "user", "content": "$prompt"}');
}
