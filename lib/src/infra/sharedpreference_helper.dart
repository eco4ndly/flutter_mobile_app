import 'package:fluttermobileapp/src/data/shared_pref.dart';
import 'package:fluttermobileapp/src/utility/string_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefsImpl implements SharedPrefData{

  SharedPreferences _prefs;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    return 0;
  }

  @override
  String getToken() {
    return _prefs.getString(StringConstants.TOKEN);
  }

  @override
  Future<bool> setToken(String token) {
    return _prefs.setString(StringConstants.TOKEN, token);
  }
}
