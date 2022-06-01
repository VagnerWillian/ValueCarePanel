import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/splash/domain/repositories/splash.repository.dart';
import 'package:value_panel/app/modules/splash/domain/usecases/get_user_token.usecase.dart';
import 'package:value_panel/app/modules/splash/infra/repositories/api.repository.dart';
import 'package:value_panel/app/modules/splash/infra/repositories/asset.repository.dart';
import 'package:value_panel/app/modules/splash/ui/splash_page.dart';
import 'package:value_panel/app/modules/splash/ui/splash_store.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

import '../../app_store.dart';
import '../../utils/utils.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [

    //Stores
    Bind.lazySingleton((i) => SplashStore(i.get<ConfigManager>(), i.get<GetUseWithTokenUseCase>() ,i.get<AppStore>())),

    //UseCases
    Bind.lazySingleton((i) => GetUseWithTokenUseCase(i.get<SplashRepository>())),

    //Repositories
    Bind.lazySingleton((i) {
      if(MOCK){
        return AssetSplashRepository();
      }
      return ApiSplashRepository(i.get<CustomDio>());
    }),

  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
  ];
}
