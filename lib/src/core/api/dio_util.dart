import 'package:dio/dio.dart';

import 'custom_log_interceptor.dart';
import 'dio_interceptors.dart';
import 'dio_method.dart';
import 'dio_response.dart';

class DioUtil {
  /// Connection timeout
  static const Duration connectionTimeOut = Duration(seconds: 20);

  /// Response timeout
  static const Duration receiveTimeOut = Duration(seconds: 20);

  /// Requested URL prefix
  static String baseURL = "http://baseurl.com:5050/";

  static DioUtil? _instance;
  static Dio _dio = Dio();

  Dio get dio => _dio;

  DioUtil._internal() {
    _instance = this;
    _instance!._init();
  }

  factory DioUtil() => _instance ?? DioUtil._internal();

  static DioUtil? getInstance() {
    _instance ?? DioUtil._internal();
    return _instance;
  }

  _init() {
    /// Initialize basic options
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      connectTimeout: connectionTimeOut,
      receiveTimeout: receiveTimeOut,
      contentType: Headers.jsonContentType,
      validateStatus: (status) => true,
    );

    /// initialize dio
    _dio = Dio(options);

    /// Add interceptor
    _dio.interceptors.add(DioInterceptors());
    _dio.interceptors.add(CustomLogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
    ));
  }

  /// Request class
  Future<DioResponse> request<T>(
    String path, {
    required DioMethod method,
    Map<String, dynamic>? params,
    data,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const methodValues = {
      DioMethod.get: 'get',
      DioMethod.post: 'post',
      DioMethod.put: 'put',
      DioMethod.delete: 'delete',
      DioMethod.patch: 'patch',
    };

    try {
      Response response;
      response = await _dio.request(path,
          data: data,
          queryParameters: params,
          options:  Options(method: methodValues[method]),
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return response.data as DioResponse;
    } on DioException catch (e) {
      rethrow;
    }
  }

  Future<DioResponse> multipartRequest<T>(
    String path, {
    Map<String, dynamic>? params,
    formData,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response;
      response = await _dio.put(path,
          data: formData,
          queryParameters: params,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return response.data as DioResponse;
    } on DioException catch (e) {
      rethrow;
    }
  }
}
