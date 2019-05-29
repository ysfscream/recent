import 'package:dio/dio.dart';
import 'dart:async';
import 'package:recent/utils/config.dart';

class Api {
  static Config config = Config();
  static String apiKey = config.apikey;
  static BaseOptions options = new BaseOptions(
    baseUrl: 'https://api.douban.com/v2/movie/',
    connectTimeout: 10000,
    receiveTimeout: 3000,
    queryParameters: {
      "apikey": apiKey,
    }
  );

  static Dio dio = new Dio(options);

  Future<dynamic> httpGet({ String url, Map params }) async {
    Response<Map> response = await dio.get(url, queryParameters: params);
    return response.data;
  }
}
