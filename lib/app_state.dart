import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _userPhoneNumber = '';
  String get userPhoneNumber => _userPhoneNumber;
  set userPhoneNumber(String _value) {
    _userPhoneNumber = _value;
  }

  bool _drawer = false;
  bool get drawer => _drawer;
  set drawer(bool _value) {
    _drawer = _value;
  }

  String _whichPage = 'dashboard';
  String get whichPage => _whichPage;
  set whichPage(String _value) {
    _whichPage = _value;
  }

  bool _isNotificationsVisible = false;
  bool get isNotificationsVisible => _isNotificationsVisible;
  set isNotificationsVisible(bool _value) {
    _isNotificationsVisible = _value;
  }

  bool _storyVisible = false;
  bool get storyVisible => _storyVisible;
  set storyVisible(bool _value) {
    _storyVisible = _value;
  }
}
