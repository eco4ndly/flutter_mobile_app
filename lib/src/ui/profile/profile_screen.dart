import 'package:flutter/material.dart';
import 'package:fluttermobileapp/generated/i18n.dart';
import 'package:fluttermobileapp/src/base/ui_event.dart';
import 'package:fluttermobileapp/src/data/model/profile_screen/post_network_model.dart';
import 'package:fluttermobileapp/src/data/model/profile_screen/profile_details_network_model.dart';
import 'package:fluttermobileapp/src/data/model/profile_screen/profile_screen_arg.dart';
import 'package:fluttermobileapp/src/infra/bloc/bloc_provider.dart';
import 'package:fluttermobileapp/src/infra/bloc/event_listener.dart';
import 'package:fluttermobileapp/src/ui/home/home_screen.dart';
import 'package:fluttermobileapp/src/ui/profile/bloc/profile_bloc.dart';
import 'package:fluttermobileapp/src/ui/profile/bloc/profile_screen_events.dart';
import 'package:fluttermobileapp/src/utility/color_constants.dart';

class ProfileScreen extends StatelessWidget {
  static const ROUTE_NAME = "/profile_screen_route";
  final ProfileScreenArgument _profileScreenArgument;

  ProfileScreen(this._profileScreenArgument);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: ProfileBloc(),
      child: _ProfileScreenInternal(_profileScreenArgument),
    );
  }
}

class _ProfileScreenInternal extends StatefulWidget {
  final ProfileScreenArgument _profileScreenArgument;

  _ProfileScreenInternal(this._profileScreenArgument);

  @override
  _ProfileScreenState createState() =>
      _ProfileScreenState(_profileScreenArgument);
}

class _ProfileScreenState extends State<_ProfileScreenInternal> {
  ProfileScreenArgument _profileScreenArgument;

  _ProfileScreenState(this._profileScreenArgument);

  bool redirect = false;

  GlobalKey<ScaffoldState> _scafoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return EventListener(
      BlocProvider
          .of<ProfileBloc>(context)
          .uiEventStream,
      handleEvent,
      child: Scaffold(
        key: _scafoldKey,
        body: Stack(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  StreamBuilder<Post>(
                    stream: BlocProvider
                        .of<ProfileBloc>(context)
                        .profileDetailsStream,
                    builder: (context, snapshot) {
                      if(snapshot.data != null ) {
                        redirect = true;
                      }
                      return Text(snapshot.data != null
                          ? snapshot.data.toJson().toString()
                          : "");
                    },
                  ),
                  MaterialButton(
                    child: Text(S.of(context).get_details),
                    onPressed: onButtonClick,
                    color: ColorConstants.home_bg_gradient_color2,
                  )
                ],
              ),
            ),
            StreamBuilder<bool>(
                stream: BlocProvider
                    .of<ProfileBloc>(context)
                    .loaderStreamController,
                initialData: false,
                builder: (context, snapshot) {
                  return Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: snapshot.data
                        ? CircularProgressIndicator()
                        : Container(
                      height: 0,
                      width: 0,
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  void onButtonClick() {
    if(redirect) {
      BlocProvider.of<ProfileBloc>(context).redirectTest();
    } else {
      BlocProvider.of<ProfileBloc>(context).getProfileDetails(
          _profileScreenArgument.id);
    }
  }

  void handleEvent(UIEvent uiEvent) {
    if (uiEvent != null) {
      if (uiEvent is SnackBarEvent) {
        SnackBarEvent sbe = uiEvent;
        _scafoldKey.currentState.showSnackBar(SnackBar(
          content: Text(sbe.message),
        ));
      } else if (uiEvent is NavigateHome) {
        Navigator.of(context).pushNamed(HomeScreen.ROUTE_NAME);
      }
    }
  }
}
