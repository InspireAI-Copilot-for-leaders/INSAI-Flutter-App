import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _onesignalappid =
          await secureStorage.getString('ff_onesignalappid') ?? _onesignalappid;
    });
    await _safeInitAsync(() async {
      _apifytoken =
          await secureStorage.getString('ff_apifytoken') ?? _apifytoken;
    });
    await _safeInitAsync(() async {
      _notificationPopupVisible =
          await secureStorage.getBool('ff_notificationPopupVisible') ??
              _notificationPopupVisible;
    });
    await _safeInitAsync(() async {
      _anthropicKey =
          await secureStorage.getString('ff_anthropicKey') ?? _anthropicKey;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

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

  String _onesignalappid = '81645fb1-17aa-4ebc-908f-5ccc07499ec5';
  String get onesignalappid => _onesignalappid;
  set onesignalappid(String _value) {
    _onesignalappid = _value;
    secureStorage.setString('ff_onesignalappid', _value);
  }

  void deleteOnesignalappid() {
    secureStorage.delete(key: 'ff_onesignalappid');
  }

  String _apifytoken = 'apify_api_yJdWtJercdZZdUUWDXlgDvniyTzSdI0lWKBg';
  String get apifytoken => _apifytoken;
  set apifytoken(String _value) {
    _apifytoken = _value;
    secureStorage.setString('ff_apifytoken', _value);
  }

  void deleteApifytoken() {
    secureStorage.delete(key: 'ff_apifytoken');
  }

  bool _notificationPopupVisible = true;
  bool get notificationPopupVisible => _notificationPopupVisible;
  set notificationPopupVisible(bool _value) {
    _notificationPopupVisible = _value;
    secureStorage.setBool('ff_notificationPopupVisible', _value);
  }

  void deleteNotificationPopupVisible() {
    secureStorage.delete(key: 'ff_notificationPopupVisible');
  }

  String _anthropicKey =
      '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';
  String get anthropicKey => _anthropicKey;
  set anthropicKey(String _value) {
    _anthropicKey = _value;
    secureStorage.setString('ff_anthropicKey', _value);
  }

  void deleteAnthropicKey() {
    secureStorage.delete(key: 'ff_anthropicKey');
  }

  final _discoverManager = StreamRequestManager<List<ArticleRecord>>();
  Stream<List<ArticleRecord>> discover({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ArticleRecord>> Function() requestFn,
  }) =>
      _discoverManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDiscoverCache() => _discoverManager.clear();
  void clearDiscoverCacheKey(String? uniqueKey) =>
      _discoverManager.clearRequest(uniqueKey);
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
