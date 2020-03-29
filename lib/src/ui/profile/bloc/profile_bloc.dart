
import 'package:get_it/get_it.dart';
import 'package:fluttermobileapp/src/base/ui_event.dart';
import 'package:fluttermobileapp/src/data/model/parsed_response.dart';
import 'package:fluttermobileapp/src/data/model/profile_screen/post_network_model.dart';
import 'package:fluttermobileapp/src/data/model/profile_screen/profile_details_network_model.dart';
import 'package:fluttermobileapp/src/data/web_services.dart';
import 'package:fluttermobileapp/src/infra/bloc/bloc_provider.dart';
import 'package:fluttermobileapp/src/ui/profile/bloc/profile_screen_events.dart';
import 'package:fluttermobileapp/src/ui/profile/bloc/profile_screen_repository.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc extends BaseBloc {

  ProfileRepository _profileRepository;


  ProfileBloc() {
    _profileRepository = ProfileRepository(GetIt.I<WebServices>());
  }

  BehaviorSubject<Post> _profileDetailsStreamController = BehaviorSubject();
  Stream<Post> get profileDetailsStream => _profileDetailsStreamController.stream;

  BehaviorSubject<UIEvent> _uiEventStreamController = BehaviorSubject();
  Stream<UIEvent> get uiEventStream => _uiEventStreamController.stream;

  BehaviorSubject<bool> _loaderStreamController = BehaviorSubject.seeded(false);
  Stream<bool> get loaderStreamController => _loaderStreamController.stream;

  void getProfileDetails(String id) async {
    ProfileDetailsRequestModel requestModel = ProfileDetailsRequestModel(id: id);
    _loaderStreamController.add(true);
    ParsedResponse<Post> profileResponse = await _profileRepository.getProfileDetails(requestModel);
    _loaderStreamController.add(false);

    if(profileResponse.hasData) {
      _profileDetailsStreamController.add(profileResponse.data);
    } else {
      _uiEventStreamController.add(SnackBarEvent(profileResponse.error.message));
    }

  }

  void redirectTest() {
    _uiEventStreamController.add(NavigateHome());
  }
  @override
  void onDispose() {
    _profileDetailsStreamController.close();
    _uiEventStreamController.close();
    _loaderStreamController.close();
  }

}