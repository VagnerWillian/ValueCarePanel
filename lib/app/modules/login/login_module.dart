import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/login/domain/usecases/save_token.usecase.dart';
import 'package:value_panel/app/modules/login/domain/usecases/signin_email_pass.usecase.dart';
import 'package:value_panel/app/modules/login/infra/repositories/asset.repository.dart';
import 'package:value_panel/app/modules/login/infra/repositories/local_preferences.repository.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';
import 'package:value_panel/app/shared/core/preferences/local_preferences.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';
import 'package:value_panel/app/utils/utils.dart';

import 'infra/repositories/api.repository.dart';
import 'ui/login_page.dart';
import 'ui/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [

    //Stores
    Bind.lazySingleton((i) => LoginStore(
      i.get<ConfigManager>(),
      i.get<SignInUseCase>(),
      i.get<SaveTokenUseCase>(),
    )),

    //UseCases
    Bind.lazySingleton((i) => SignInUseCase(i.get<ApiLoginRepository>())),
    Bind.lazySingleton((i) => SaveTokenUseCase(i.get<LocalLoginRepository>())),

    //Repositories
    Bind.lazySingleton((i) {
      if(MOCK){
        return AssetLoginRepository();
      }
      return ApiLoginRepository(i.get<CustomDio>());
    }),
    Bind.lazySingleton((i) => LocalLoginRepository(i.get<LocalPreferences>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
