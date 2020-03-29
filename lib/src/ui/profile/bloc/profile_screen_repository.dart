import 'package:dio/dio.dart';
import 'package:fluttermobileapp/src/base/base_repository.dart';
import 'package:fluttermobileapp/src/data/model/parsed_response.dart';
import 'package:fluttermobileapp/src/data/model/profile_screen/post_network_model.dart';
import 'package:fluttermobileapp/src/data/model/profile_screen/profile_details_network_model.dart';
import 'package:fluttermobileapp/src/data/web_services.dart';
import 'package:fluttermobileapp/src/utility/url_constants.dart';

class ProfileRepository extends BaseRepository {
  WebServices _webServices;

  ProfileRepository(this._webServices);

  Future<ParsedResponse<Post>> getProfileDetails(
      ProfileDetailsRequestModel requestModel) async {

    try {
      Response response = await _webServices.doGetApiCall(UrlConstants.profile_details);
      if(response != null && response.statusCode == BaseRepository.HTTP_OK) {
        return ParsedResponse.addData(Post.fromJson(response.data));
      } else {
        return Future.value(ParsedResponse.addError(handleHttpErrorResponse(response)));
      }
    } on DioError catch(e) {
      return Future.value(ParsedResponse.addError(handleDioError(e)));
    }
  }

}