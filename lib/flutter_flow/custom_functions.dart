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
      .replaceAll(
          '"', '\\"'); // Escape double quotes, important for JSON strings
  return output;
}

DateTime? modifiedDateTime(DateTime inputTimestamp) {
  DateTime newTimestamp = inputTimestamp.add(Duration(minutes: 2));
  return newTimestamp;
}
