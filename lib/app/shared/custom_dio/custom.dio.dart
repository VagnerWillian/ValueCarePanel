
import 'package:dio/dio.dart';
import 'package:value_panel/app/shared/custom_dio/custom.interceptor.dart';
import 'package:value_panel/app/utils/utils.dart';

class CustomDio{

  Dio client;

  CustomDio(this.client){
    client.options.baseUrl = baseUrl;
    client.interceptors.add(CustomInterceptor(),);
  }

}