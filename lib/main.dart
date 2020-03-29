import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttermobileapp/src/data/shared_pref.dart';
import 'package:fluttermobileapp/src/data/web_services.dart';
import 'package:fluttermobileapp/src/infra/network/web_services_impl.dart';
import 'package:fluttermobileapp/src/infra/sharedpreference_helper.dart';
import 'package:fluttermobileapp/src/the_awesome_app.dart';
import 'package:fluttermobileapp/src/utility/url_constants.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setUpDependencyInjection();

  runApp(TheAwesomeApp());
}

void setUpDependencyInjection() {
  GetIt.instance.registerLazySingleton<SharedPrefData>(() => SharedPrefsImpl());
  GetIt.instance.registerLazySingleton<WebServices>(() => WebServicesImpl(UrlConstants.BASE_URL));
}