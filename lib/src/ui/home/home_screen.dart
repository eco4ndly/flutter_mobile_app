import 'package:flutter/material.dart';
import 'package:fluttermobileapp/generated/i18n.dart';
import 'package:fluttermobileapp/src/data/model/profile_screen/profile_screen_arg.dart';
import 'package:fluttermobileapp/src/ui/profile/profile_screen.dart';
import 'package:fluttermobileapp/src/utility/color_constants.dart';

class HomeScreen extends StatefulWidget {
  static const ROUTE_NAME = "/home_screen_route";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: MaterialButton(
            child: Text(S.of(context).go_to_profile),
            color: ColorConstants.home_bg_gradient_color2,
            onPressed: () {
              Navigator.of(context).pushNamed(
                  ProfileScreen.ROUTE_NAME,
                arguments: ProfileScreenArgument("Sayann", "s2213")
              );
            },
          ),
        ),
      ),
    );
  }
}
