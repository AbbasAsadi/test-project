import 'package:dio/dio.dart';
import 'package:test_project/src/core/api/dio_response.dart';
import 'package:test_project/src/core/secure_storage/my_secure_storage.dart';

// import 'package:test_project/src/modules/login/api/login_api_routes.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class DioInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Add token to header
    String? userToken = await MySecureStorage.getInstance().readToken();
    if (userToken != null) {
      options.headers["Authorization"] = 'Token $userToken';
    }
    options.headers["Content-Type"] = "application/json";
    options.headers["Accept"] = "application/json";

    handler.next(options);
    // super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // A successful request involves basic processing of the data.
    if (isOk(response)) {
      response.data =
          DioResponse(status: DioResponseStatus.success, data: response.data);
    } else if (response.statusCode == 401) {
      //**************************** logout request ****************************
      // DioUtil()
      //     .request(LoginApiRoutes.logout, method: DioMethod.post)
      //     .then((value) {
      //   MySecureStorage.getInstance().clearToken().then(
      //         (value) async {
      //       SharedPreferences pref = await SharedPreferences.getInstance();
      //       await pref.clear();
      //     },
      //   );
      // });
      response.data = DioResponse(
          status: DioResponseStatus.unauthorized, data: response.data);
    } else if (hasError(response)) {
      response.data =
          DioResponse(status: DioResponseStatus.failure, data: response.data);
    } else if (hasServerError(response)) {
      response.data = DioResponse(
          status: DioResponseStatus.serverError, data: response.data);
    }
    // focus
    handler.next(response);
  }

  bool isOk(Response<dynamic> response) {
    return ((response.statusCode ?? 0) >= 200) &&
        (response.statusCode ?? 0) < 300;
  }

  bool hasServerError(Response<dynamic> response) =>
      (response.statusCode ?? 0) >= 500;

  bool hasError(Response<dynamic> response) {
    return ((response.statusCode ?? 0) >= 400) &&
        (response.statusCode ?? 0) < 500;
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
    // super.onError(err, handler);
  }
}
