import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api_class.dart';

class APIFunction {
  Future<dynamic> apiCall({
    required String apiName,
    required BuildContext context,
    FormData? params,
    String? token = "",
    Object? withOutFormData,
    bool isGet = false,
    bool isLoading = true,
  }) async {
    try{
      if (isGet != true && params != null) {
        log("params -------->>> ${params.fields}");
        log("params -------->>> ${params.files}");
      }
      if (isGet == true) {
        var response = await HttpUtil(token!, isLoading, context).get(
          apiName,
          token: token,
        );
        return response;
      }

      var response = await HttpUtil(token!, isLoading, context).post(
        apiName,
        data: params,
        token: token,
        withOutFormData: withOutFormData,
      );
      return response;
    }catch (e){
      print("apiname--${apiName}---error--${e}");
    }
  }
}
