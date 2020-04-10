import 'package:dio/dio.dart';

class HttpConfig {
  static const String baseURL = 'http://123.207.32.32:8001/api';
  static const int connectionTimeout = 5000;
}

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: HttpConfig.baseURL,
    connectTimeout: HttpConfig.connectionTimeout,
  );
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url, {
                              String method = 'get',
                              Map<String, dynamic> params,
                              Interceptor inter}) async {
    // 1.创建单独配置
    final options = Options(method: method);
    // 全局拦截
    Interceptor t_inter = InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        print('请求拦截：${options.baseUrl}');
        return options;
      },
      onResponse: (Response e) {
        print('响应拦截：${e.statusCode}');
        return e;
      },
      onError: (DioError e) {
        print('错误拦截：${e.message}');
        return e;
      }
    );

    List<Interceptor> inters = [t_inter];
    if (inter != null) {
      inters.add(inter);
    }
    dio.interceptors.clear();
    dio.interceptors.addAll(inters);

    // 2.发送网络请求
    Response response = await dio.request(url, queryParameters: params, options: options);
    return response.data;
  }
}