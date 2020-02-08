import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

typedef void onResponseCallback(int statusCode, dynamic resultMap);

class NetworkHelper {
  // 单利
  static NetworkHelper shared = NetworkHelper();

  void requestDouBanList(String url, onResponseCallback callback) {
    _getNetworkData(url, callback);
  }

  void _getNetworkData(String url, onResponseCallback callback) async {
    BaseOptions options = BaseOptions(
      method: 'get',
      baseUrl: url,
      connectTimeout: 5000,
      receiveTimeout: 10000,
      contentType: ContentType.json,
      responseType: ResponseType.plain
    );

    Dio dio = Dio(options);
    try {
      Response response = await dio.get(url);
      callback(response.statusCode, jsonDecode(response.data));
    }on DioError catch(e) {
      print('fail to get network, url: $url');
      if (e.response != null) {
        print('================');
        print(e.response.data);
        print(e.response.headers);
        print('================');
      }else {
        print('****************');
        print(e.request);
        print('****************');
      }
      callback(404, Map());
    }
  }
}