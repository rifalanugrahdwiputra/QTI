import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:qti/app/data/models/assets_edit_model.dart';
import 'package:qti/app/data/models/assets_model.dart';
import 'package:qti/app/data/models/location_all_model.dart';
import 'package:qti/app/data/models/location_model.dart';
import 'package:qti/app/data/models/status_all_model.dart';
import 'package:qti/app/data/models/status_model.dart';
import '../../config/app_config.dart';
import '../../middleware/app_auth_token_middleware.dart';

class FormProviders {
  Dio dio = Dio();
  Response? response;
  String baseUrl = AppConfig.baseUrl;

  Future<AssetModel> postAsset({dataRequest}) async {
    response = await dio.post(
      "${baseUrl}asset",
      data: dataRequest,
      options: Options(
        headers: AppAuthTokenMiddleware.setHeaderHttpRequestJson(),
      ),
    );
    return assetModelFromJson(jsonEncode(response!.data));
  }

  Future<AssetEditModel> updateEdit({dataRequest, String? id}) async {
    response = await dio.put(
      "${baseUrl}asset/$id",
      data: dataRequest,
      options: Options(
        headers: AppAuthTokenMiddleware.setHeaderHttpRequestJson(),
      ),
    );
    return assetEditModelFromJson(jsonEncode(response!.data));
  }

  Future<StatusAllModel> getStatusAll() async {
    response = await dio.get("${baseUrl}status",
        options:
            Options(headers: AppAuthTokenMiddleware.setHeaderHttpRequest()));
    return statusAllModelFromJson(jsonEncode(response!.data));
  }

  Future<StatusModel> getStatus() async {
    response = await dio.get("${baseUrl}home/agg-asset-by-status",
        options:
            Options(headers: AppAuthTokenMiddleware.setHeaderHttpRequest()));
    return statusModelFromJson(jsonEncode(response!.data));
  }

  Future<LocationAllModel> getLocationAll() async {
    response = await dio.get("${baseUrl}location",
        options:
            Options(headers: AppAuthTokenMiddleware.setHeaderHttpRequest()));
    return locationAllModelFromJson(jsonEncode(response!.data));
  }

  Future<LocationModel> getLocation() async {
    response = await dio.get("${baseUrl}home/agg-asset-by-location",
        options:
            Options(headers: AppAuthTokenMiddleware.setHeaderHttpRequest()));
    return locationModelFromJson(jsonEncode(response!.data));
  }
}
