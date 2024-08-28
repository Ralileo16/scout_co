import 'package:shared_preferences/shared_preferences.dart';

class ApiUrl {
  static final ApiUrl _instance = ApiUrl._internalConstructor();
  late final SharedPreferences prefs;
  late final Future<SharedPreferences> _prefsFuture;

  factory ApiUrl() => _instance;

  ApiUrl._internalConstructor() {
    _prefsFuture = SharedPreferences.getInstance();
  }

  Future<void> initialize() async {
    prefs = await _prefsFuture;
  }

  String get storedApiPath {
    return prefs.getString('apiPath') ?? '';
  }
}
