import 'package:dio/dio.dart';
import 'dart:async';

class Api {
  static String apiKey = '0b2bdeda43b5688921839c8ecb20399b';
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
