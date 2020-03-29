import 'package:flutter/material.dart';
import 'package:fluttermobileapp/src/route/custom_material_page_route.dart';
import 'package:fluttermobileapp/src/ui/home/home_screen.dart';
import 'package:fluttermobileapp/src/ui/profile/profile_screen.dart';

class Routes {
  static onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.ROUTE_NAME:
        return _navigate(HomeScreen(), settings);
      case ProfileScreen.ROUTE_NAME:
        return _navigate(ProfileScreen(settings.arguments), settings);
    }
    return null;
  }
}

_navigate(Widget child, RouteSettings settings) {
  return CustomMaterialPageRoute(
      settings: settings,
      builder: (context) {
        return child;
      });
}
