import 'dart:async';
import 'dart:convert';
import '../data/all.dart';
import '../data/utils.dart';
import 'loading.dart';

class HttpUtil {
  factory HttpUtil(String token, bool isLoading, BuildContext context) =>
      _instance(token, isLoading, context);

  static HttpUtil _instance(token, isLoading, context) =>
      HttpUtil._internal(token: token, isLoading: isLoading, context: context);

  late Dio dio;
  CancelToken cancelToken = CancelToken();
  String apiUrl = Constants.baseUrl;

  BuildContext? context;

  HttpUtil._internal(
      {String? token, bool? isLoading, required BuildContext context}) {
    BaseOptions options = BaseOptions(
      baseUrl: apiUrl,
      connectTimeout: 10000,
      receiveTimeout: 10000,
      headers: {
        'token': token,
      },
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    dio = Dio(options);
    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (isLoading!) {
          Loading.show();
        }
        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        if (isLoading!) {
          Loading.dismiss();
        }
        return handler.next(response); // continue
      },
      onError: (DioError e, handler) {
        if (isLoading!) {
          Loading.dismiss();
        }
        onError(createErrorEntity(e), context);
        return handler.next(e); //continue
      },
    ));
  }

// On Error....
  void onError(ErrorEntity eInfo, BuildContext context) {
    printError(
        "error.code -> ${eInfo.code}, error.message -> ${eInfo.message}");
    if (eInfo.message.isNotEmpty) {
      Utils.showSnackBar(message: eInfo.message);
    }
  }

  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return ErrorEntity(
            code: -1, message: "Request to server was cancelled");
      case DioErrorType.connectTimeout:
        return ErrorEntity(code: -2, message: "Connection timeout with server");
      case DioErrorType.sendTimeout:
        return ErrorEntity(
            code: -3, message: "Send timeout in connection with server");
      case DioErrorType.receiveTimeout:
        return ErrorEntity(
            code: -4, message: "Receive timeout in connection with server");
      case DioErrorType.response:
        {
          try {
            int errCode =
                error.response != null ? error.response!.statusCode! : 00;

            switch (errCode) {
              case 400:
                return ErrorEntity(
                    code: errCode, message: error.response!.data["message"]);
              case 401:
                return ErrorEntity(
                    code: errCode, message: error.response!.data["message"]);
              case 409:
                return ErrorEntity(
                    code: errCode, message: error.response!.data["message"]);
              case 403:
                return ErrorEntity(
                    code: errCode, message: error.response!.data["message"]);
              case 404:
                return ErrorEntity(
                    code: errCode, message: error.response!.data["message"]);
              case 405:
                return ErrorEntity(
                    code: errCode, message: error.response!.data["message"]);
              case 500:
                return ErrorEntity(
                    code: errCode, message: error.response!.data["message"]);
              case 502:
                return ErrorEntity(
                    code: errCode, message: error.response!.data["message"]);
              case 503:
                return ErrorEntity(
                    code: errCode, message: error.response!.data["message"]);
              case 505:
                return ErrorEntity(
                    code: errCode,
                    message: "HTTP protocol requests are not supported");
              default:
                return ErrorEntity(
                    code: errCode,
                    message:
                        error.response != null ? error.response!.data! : "");
            }
          } on Exception catch (_) {
            return ErrorEntity(code: 00, message: "Unknown mistake");
          }
        }
      case DioErrorType.other:
        if (error.message!.contains("SocketException")) {
          return ErrorEntity(
              code: -5,
              message:
                  "Your internet is not available, please try again later");
        } else if (error.message!
            .contains("Software caused connection abort")) {
          return ErrorEntity(
              code: -6,
              message:
                  "Your internet is not available, please try again later");
        }
        return ErrorEntity(code: -7, message: "Oops something went wrong");
      default:
        return ErrorEntity(code: -8, message: "Oops something went wrong");
    }
  }

  void cancelRequests() {
    cancelToken.cancel("cancelled");
  }

  /// restful get
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool refresh = false,
    bool noCache = true,
    bool list = false,
    String? token,
    String cacheKey = '',
    bool cacheDisk = false,
  }) async {
    try{
      Options requestOptions = Options(
        headers: {
          "Authorization": "Bearer ${token}",
        },
      );

      var response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response.data;
    }catch(e){
      print("apiname--${path}---error--${e}");
    }
  }

  /// restful post
  Future post(
    String path, {
    FormData? data,
    String? token,
    Object? withOutFormData,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try{
      Options requestOptions =
          options ?? Options(headers: {"Authorization": "Bearer ${token}"});

      var response = await dio.post(
        path,
        data: withOutFormData == null ? data : jsonEncode(withOutFormData),
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response.data;
    }catch(e){
      print("apiname--${path}---error--${e}");
    }
  }

  /// restful put
  Future put(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful delete
  Future delete(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful patch
  Future patch(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post form
  Future postForm(
    String path, {
    FormData? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post Stream
  Future postStream(
    String path, {
    dynamic data,
    int dataLength = 0,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();

    requestOptions.headers!.addAll({
      Headers.contentLengthHeader: dataLength.toString(),
    });
    var response = await dio.post(
      path,
      data: Stream.fromIterable(data.map((e) => [e])),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = "";

  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception: code $code, $message";
  }
}
