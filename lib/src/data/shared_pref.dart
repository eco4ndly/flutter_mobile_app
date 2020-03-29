import 'package:get_it/get_it.dart';

abstract class SharedPrefData {
  void setToken(String token);

  String getToken();

  static SharedPrefData getInstance() {
    return GetIt.I<SharedPrefData>();
  }
}