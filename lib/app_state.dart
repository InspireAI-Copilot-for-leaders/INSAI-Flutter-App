import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';

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
  set userPhoneNumber(String value) {
    _userPhoneNumber = value;
  }

  final _articlesManager =
      StreamRequestManager<List<ExpertiseAreaKeywordsSubCollectionRecord>>();
  Stream<List<ExpertiseAreaKeywordsSubCollectionRecord>> articles({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ExpertiseAreaKeywordsSubCollectionRecord>> Function()
        requestFn,
  }) =>
      _articlesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearArticlesCache() => _articlesManager.clear();
  void clearArticlesCacheKey(String? uniqueKey) =>
      _articlesManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
