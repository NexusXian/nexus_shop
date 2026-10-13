import 'package:dio/dio.dart';
import 'package:nexus_shop/constants/index.dart';

class DioRequest {
  final _dio = Dio();
  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.baseUrl
      ..connectTimeout = Duration(milliseconds: GlobalConstants.timeOut)
      ..receiveTimeout = Duration(milliseconds: GlobalConstants.timeOut)
      ..sendTimeout = Duration(milliseconds: GlobalConstants.timeOut);
    // interceptors
    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          handler.next(request);
        },
        onResponse: (response, handler) {
          // http response code
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
            return;
          } else {
            handler.reject(
              DioException(requestOptions: response.requestOptions),
            );
          }
        },
        onError: (error, handler) {
          handler.reject(error);
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? params}) async {
    return _handlerResponse(_dio.get(url, queryParameters: params));
  }

  Future<dynamic> _handlerResponse(Future<Response<dynamic>> task) async {
    Response<dynamic> res = await task;
    final data = res.data as Map<String, dynamic>;
    if (data.containsKey("code") &&
        data["code"] == GlobalConstants.successCode) {
      return data["result"];
    }
    throw Exception(data["msg"] ?? '加载数据异常');
  }
}

// singleton
final dioRequest = DioRequest();
