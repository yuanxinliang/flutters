import 'package:dio/dio.dart';

import 'network_config.dart';

class Network {

  static Future<Response> get(String url, {Map<String, dynamic> param}) async {
    // print('配置网络请求');
    final dio = Dio();
    dio.options.connectTimeout = network_timeout;
    dio.options.receiveTimeout = network_timeout;
    // 发送请求，并异步返回响应内容
    // print('发送网络请求');
    Response response = await dio.get(url, queryParameters: param);
    // print('接收网络请求内容');
    print(response.statusCode);
    return response;
  }
}