import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:qti/app/data/models/me_model.dart';
import '../../config/app_config.dart';
import '../models/auth_model.dart';
import '../../middleware/app_auth_token_middleware.dart';

class AuthProviders {
  Dio dio = Dio();
  Response? response;
  String baseUrl = AppConfig.baseUrl;

  Future<AuthModel> postAuth({dataRequest}) async {
    response = await dio.post("${baseUrl}auth/login",
        data: dataRequest,
        options:
            Options(headers: AppAuthTokenMiddleware.setHeaderHttpRequest()));
    return authModelFromJson(jsonEncode(response!.data));
  }

  Future<MeModel> postLogout() async {
    response = await dio.post("${baseUrl}auth/logout",
        options: Options(
            headers: AppAuthTokenMiddleware.setHeaderHttpRequestJson()));
    return meModelFromJson(jsonEncode(response!.data));
  }

  Future<MeModel> getMe() async {
    response = await dio.get("${baseUrl}auth/me",
        options:
            Options(headers: AppAuthTokenMiddleware.setHeaderHttpRequest()));
    return meModelFromJson(jsonEncode(response!.data));
  }
}
