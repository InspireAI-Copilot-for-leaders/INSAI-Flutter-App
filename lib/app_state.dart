import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

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
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _notificationPopupVisible =
          await secureStorage.getBool('ff_notificationPopupVisible') ??
              _notificationPopupVisible;
    });
    await _safeInitAsync(() async {
      _anthropicKey =
          await secureStorage.getString('ff_anthropicKey') ?? _anthropicKey;
    });
    await _safeInitAsync(() async {
      _shouldOverideDiscoverCache =
          await secureStorage.getBool('ff_shouldOverideDiscoverCache') ??
              _shouldOverideDiscoverCache;
    });
    await _safeInitAsync(() async {
      _lastDiscoverCachedTime =
          await secureStorage.read(key: 'ff_lastDiscoverCachedTime') != null
              ? DateTime.fromMillisecondsSinceEpoch(
                  (await secureStorage.getInt('ff_lastDiscoverCachedTime'))!)
              : _lastDiscoverCachedTime;
    });
    await _safeInitAsync(() async {
      _startTime = await secureStorage.read(key: 'ff_startTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_startTime'))!)
          : _startTime;
    });
    await _safeInitAsync(() async {
      _encodedCreds =
          await secureStorage.getString('ff_encodedCreds') ?? _encodedCreds;
    });
    await _safeInitAsync(() async {
      _vid = await secureStorage.getString('ff_vid') ?? _vid;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _userPhoneNumber = '';
  String get userPhoneNumber => _userPhoneNumber;
  set userPhoneNumber(String value) {
    _userPhoneNumber = value;
  }

  bool _drawer = false;
  bool get drawer => _drawer;
  set drawer(bool value) {
    _drawer = value;
  }

  bool _isNotificationsVisible = false;
  bool get isNotificationsVisible => _isNotificationsVisible;
  set isNotificationsVisible(bool value) {
    _isNotificationsVisible = value;
  }

  bool _storyVisible = false;
  bool get storyVisible => _storyVisible;
  set storyVisible(bool value) {
    _storyVisible = value;
  }

  bool _notificationPopupVisible = true;
  bool get notificationPopupVisible => _notificationPopupVisible;
  set notificationPopupVisible(bool value) {
    _notificationPopupVisible = value;
    secureStorage.setBool('ff_notificationPopupVisible', value);
  }

  void deleteNotificationPopupVisible() {
    secureStorage.delete(key: 'ff_notificationPopupVisible');
  }

  String _anthropicKey =
      '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';
  String get anthropicKey => _anthropicKey;
  set anthropicKey(String value) {
    _anthropicKey = value;
    secureStorage.setString('ff_anthropicKey', value);
  }

  void deleteAnthropicKey() {
    secureStorage.delete(key: 'ff_anthropicKey');
  }

  bool _shouldOverideDiscoverCache = false;
  bool get shouldOverideDiscoverCache => _shouldOverideDiscoverCache;
  set shouldOverideDiscoverCache(bool value) {
    _shouldOverideDiscoverCache = value;
    secureStorage.setBool('ff_shouldOverideDiscoverCache', value);
  }

  void deleteShouldOverideDiscoverCache() {
    secureStorage.delete(key: 'ff_shouldOverideDiscoverCache');
  }

  DateTime? _lastDiscoverCachedTime;
  DateTime? get lastDiscoverCachedTime => _lastDiscoverCachedTime;
  set lastDiscoverCachedTime(DateTime? value) {
    _lastDiscoverCachedTime = value;
    value != null
        ? secureStorage.setInt(
            'ff_lastDiscoverCachedTime', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_lastDiscoverCachedTime');
  }

  void deleteLastDiscoverCachedTime() {
    secureStorage.delete(key: 'ff_lastDiscoverCachedTime');
  }

  bool _dashboardLoading = true;
  bool get dashboardLoading => _dashboardLoading;
  set dashboardLoading(bool value) {
    _dashboardLoading = value;
  }

  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? value) {
    _startTime = value;
    value != null
        ? secureStorage.setInt('ff_startTime', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_startTime');
  }

  void deleteStartTime() {
    secureStorage.delete(key: 'ff_startTime');
  }

  String _encodedCreds =
      'QUM0ZmYyMjI5NzZmNDk5YmU4OWM2NmUyMWQ0YjY1MGVmZjo4YzdlNjc1Y2ExOTVmYTk0ZDRjYjRlMzgzZDk2MzQ5ZA==';
  String get encodedCreds => _encodedCreds;
  set encodedCreds(String value) {
    _encodedCreds = value;
    secureStorage.setString('ff_encodedCreds', value);
  }

  void deleteEncodedCreds() {
    secureStorage.delete(key: 'ff_encodedCreds');
  }

  String _vid = 'VA77b794858c45b8ed5dfc737c483ba9a2';
  String get vid => _vid;
  set vid(String value) {
    _vid = value;
    secureStorage.setString('ff_vid', value);
  }

  void deleteVid() {
    secureStorage.delete(key: 'ff_vid');
  }

  final _discoverManager = FutureRequestManager<List<ArticleRecord>>();
  Future<List<ArticleRecord>> discover({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ArticleRecord>> Function() requestFn,
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
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
