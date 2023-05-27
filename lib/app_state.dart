import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _exampleUserRef =
        (await secureStorage.getString('ff_exampleUserRef'))?.ref ??
            _exampleUserRef;
    _profileFilled =
        await secureStorage.getBool('ff_profileFilled') ?? _profileFilled;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _chosenEventId = '';
  String get chosenEventId => _chosenEventId;
  set chosenEventId(String _value) {
    _chosenEventId = _value;
  }

  DocumentReference? _exampleUserRef =
      FirebaseFirestore.instance.doc('/users/TACOBnEZLSBhdaZZVzIw');
  DocumentReference? get exampleUserRef => _exampleUserRef;
  set exampleUserRef(DocumentReference? _value) {
    _exampleUserRef = _value;
    _value != null
        ? secureStorage.setString('ff_exampleUserRef', _value.path)
        : secureStorage.remove('ff_exampleUserRef');
  }

  void deleteExampleUserRef() {
    secureStorage.delete(key: 'ff_exampleUserRef');
  }

  List<String> _selectedInterests = [];
  List<String> get selectedInterests => _selectedInterests;
  set selectedInterests(List<String> _value) {
    _selectedInterests = _value;
  }

  void addToSelectedInterests(String _value) {
    _selectedInterests.add(_value);
  }

  void removeFromSelectedInterests(String _value) {
    _selectedInterests.remove(_value);
  }

  void removeAtIndexFromSelectedInterests(int _index) {
    _selectedInterests.removeAt(_index);
  }

  void updateSelectedInterestsAtIndex(
    int _index,
    Function(String) updateFn,
  ) {
    updateFn(_selectedInterests[_index]);
  }

  bool _profileFilled = false;
  bool get profileFilled => _profileFilled;
  set profileFilled(bool _value) {
    _profileFilled = _value;
    secureStorage.setBool('ff_profileFilled', _value);
  }

  void deleteProfileFilled() {
    secureStorage.delete(key: 'ff_profileFilled');
  }

  bool _eventFotoUploaded = false;
  bool get eventFotoUploaded => _eventFotoUploaded;
  set eventFotoUploaded(bool _value) {
    _eventFotoUploaded = _value;
  }

  bool _areSubscriptionsSelected = true;
  bool get areSubscriptionsSelected => _areSubscriptionsSelected;
  set areSubscriptionsSelected(bool _value) {
    _areSubscriptionsSelected = _value;
  }
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
