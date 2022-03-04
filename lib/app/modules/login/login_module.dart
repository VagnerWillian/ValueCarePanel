import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/home/ui/home_store.dart';
import 'package:value_panel/app/modules/login/domain/repositories/login.repository.dart';
import 'package:value_panel/app/modules/login/domain/usecases/get_token.usecase.dart';
import 'package:value_panel/app/modules/login/domain/usecases/save_token.usecase.dart';
import 'package:value_panel/app/modules/login/domain/usecases/signin.usecase.dart';
import 'package:value_panel/app/modules/login/infra/repositories/json_generator.repository.dart';
import 'package:value_panel/app/modules/login/infra/repositories/local_preferences.repository.dart';
import 'package:value_panel/app/shared/core/preferences/local_preferences.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

import 'ui/login_page.dart';
import 'ui/login_store.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [

    //Stores
    Bind.lazySingleton((i) => LoginStore(
      i.get<SignInUseCase>(),
      i.get<SaveTokenUseCase>(),
      i.get<GetTokenUseCase>(),
    )),

    //UseCases
    Bind.lazySingleton((i) => SignInUseCase(i.get<JsonGeneratorLoginRepository>())),
    Bind.lazySingleton((i) => SaveTokenUseCase(i.get<LocalLoginRepository>())),
    Bind.lazySingleton((i) => GetTokenUseCase(i.get<LocalLoginRepository>())),

    //Repositories
    Bind.lazySingleton((i) => JsonGeneratorLoginRepository(i.get<CustomDio>())),
    Bind.lazySingleton((i) => LocalLoginRepository(i.get<LocalPreferences>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const LoginPage()),
  ];
}
