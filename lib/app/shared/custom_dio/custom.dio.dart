
import 'package:dio/dio.dart';
import 'package:value_panel/app/shared/custom_dio/custom.interceptor.dart';

class CustomDio{

  Dio client;

  CustomDio(this.client){
    client.interceptors.add(CustomInterceptor(),);
  }

}