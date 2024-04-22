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
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String? formatStringForJson(String input) {
  var output = input
      .replaceAll('\\', '\\\\') // Escape backslashes first
      .replaceAll('\n', '\\n')
      .replaceAll('\r', '\\r')
      .replaceAll('\t', '\\t')
      .replaceAll('\b', '\\b')
      .replaceAll('\f', '\\f')
      .replaceAll('"', '\\"')
      .replaceAll('(', '\\(')
      .replaceAll(')', '\\)');
  ;
  return output;
}

DateTime modifiedDateTime(
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

String timeDifference(
  String date1,
  String date2,
) {
  // Date format used for parsing input date strings
  DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  // Parse input date strings into DateTime objects
  DateTime dateTime1 = dateFormat.parse(date1);
  DateTime dateTime2 = dateFormat.parse(date2);

  // Calculate the duration between two dates
  Duration duration = dateTime1.difference(dateTime2).abs();

  // Calculate the components of the duration
  int years = duration.inDays ~/ 365;
  int months = (duration.inDays % 365) ~/ 30;
  int days = (duration.inDays % 365) % 30;
  int hours = duration.inHours % 24;
  int minutes = duration.inMinutes % 60;

  // Format the duration into a string
  String result =
      '$years years, $months months, $days days, $hours hours, $minutes minutes';

  return result;
}
