import 'package:dio/dio.dart';
import 'package:fluttermobileapp/src/infra/network/model/api_error_model.dart';

abstract class WebServices {
  Future<Response> doPostApiCall(String endPoint, {Map<String, dynamic> body});

  Future<Response> doGetApiCall(String endPoint, {Map<String, dynamic> qParams});
}
