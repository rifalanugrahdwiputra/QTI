import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:qti/app/data/models/assets_all_model.dart';
import 'package:qti/app/data/models/assets_edit_model.dart';
import '../../config/app_config.dart';
import '../../middleware/app_auth_token_middleware.dart';

class AssetProviders {
  Dio dio = Dio();
  Response? response;
  String baseUrl = AppConfig.baseUrl;

  Future<AssetAllModel> getAsset({page, pageSize}) async {
    response = await dio.get("${baseUrl}asset?page=$page&page_size=$pageSize",
        options:
            Options(headers: AppAuthTokenMiddleware.setHeaderHttpRequest()));
    return assetAllModelFromJson(jsonEncode(response!.data));
  }

  Future<AssetEditModel> getAssetEdit({String? id}) async {
    response = await dio.get("${baseUrl}asset/$id",
        options:
            Options(headers: AppAuthTokenMiddleware.setHeaderHttpRequest()));
    return assetEditModelFromJson(jsonEncode(response!.data));
  }
}
