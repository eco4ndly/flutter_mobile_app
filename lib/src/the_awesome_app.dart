import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttermobileapp/generated/i18n.dart';
import 'package:fluttermobileapp/src/routes.dart';
import 'package:fluttermobileapp/src/ui/home/home_screen.dart';

class TheAwesomeApp extends StatefulWidget {
  static const locale = [Locale("en", "")];

  static void setLocale(BuildContext context, Locale newLocale) async {
    _TheAwesomeAppState state =
        context.findAncestorStateOfType<_TheAwesomeAppState>();

    state.setState(() {
      state.locale = newLocale;
    });
  }

  @override
  _TheAwesomeAppState createState() => _TheAwesomeAppState();
}

class _TheAwesomeAppState extends State<TheAwesomeApp> {
  var locale = TheAwesomeApp.locale[0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
          primaryColor: Colors.white,
          primaryColorDark: Colors.white,
          accentColor: Colors.white,
          fontFamily: 'Swiss'),
      localizationsDelegates: [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      locale: locale,
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: S.delegate.resolution(fallback: locale),
      home: HomeScreen(),
      onGenerateRoute: (RouteSettings settings) {
        return Routes.onGenerateRoute(settings);
      },
    );
  }
}
