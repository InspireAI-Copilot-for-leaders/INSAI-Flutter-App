// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:country_picker/country_picker.dart';

class CountryCodePickerWidget extends StatefulWidget {
  const CountryCodePickerWidget({
    Key? key,
    this.width,
    this.height,
    required this.refreshPageUI,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() refreshPageUI;

  @override
  _CountryCodePickerWidgetState createState() =>
      _CountryCodePickerWidgetState();
}

class _CountryCodePickerWidgetState extends State<CountryCodePickerWidget> {
  Country? country = CountryParser.parseCountryCode('IN'); // Default to India
  late String phoneNumber; // Variable to store phone number

  final enabledBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFE0E3E7),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(12),
  );

  final focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF5A5D5D),
      width: 2,
    ),
    borderRadius: BorderRadius.circular(12),
  );

  void showPicker() {
    showCountryPicker(
      context: context,
      favorite: ['IN', 'US', 'CA'],
      exclude: ['CN'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: const Color.fromARGB(255, 250, 246, 240),
        borderRadius: BorderRadius.circular(20),
        inputDecoration: const InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.black),
          hintText: 'Search your country here..',
          border: InputBorder.none,
        ),
      ),
      onSelect: (Country selectedCountry) {
        setState(() {
          country = selectedCountry;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // The main widget content
    return Container(
      width: widget.width,
      height: widget.height,
      color: Color(0xFFF5F5F5), // Set the background color
      child: TextFormField(
        cursorColor: Colors.black,
        onChanged: (input) {
          setState(() {
            phoneNumber =
                '+${country!.phoneCode}$input'; // Concatenate and save the full phone number
          });
          FFAppState().userPhoneNumber = phoneNumber;
          widget.refreshPageUI();
        },
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: false,
          contentPadding: EdgeInsets.zero,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          hintText: 'Enter phone number',
          hintStyle: const TextStyle(color: Colors.black38),
          prefixIcon: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: showPicker,
            child: Container(
              height: 56,
              width: 100,
              alignment: Alignment.center,
              child: Text(
                '${country!.flagEmoji} +${country!.phoneCode}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
