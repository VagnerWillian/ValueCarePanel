import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';

class CustomInterceptor extends InterceptorsWrapper {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print('REQUEST[${options.method}] => PATH: ${options.uri}');
    final ConfigManager configManager = Modular.get<ConfigManager>();
    // options.headers = {"Authorization":"Bearer ${configManager.tokenUserLogged}"};
    print("TOKEN APLICADO **${configManager.tokenUserLogged}**");
    print(options.headers);
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    print(err);
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    /*if(Modular.to.path!=LOGIN_ROUTE&&err.response!=null&&err.response.statusCode==401){
      await Modular.to.showDialog(builder: (_)=>Material(child: RequestErrorDialog(response: ResponseModel(errorStatusCode: 401, sucess: false, result: null))));
    }*/
    return super.onError(err, handler);
  }
}
