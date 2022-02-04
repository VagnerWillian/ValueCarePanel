import 'package:value_panel/app/modules/users/domain/application/get_users.application.dart';
import 'package:value_panel/app/modules/users/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/users/domain/usecases/get_users.usecase.dart';
import 'package:value_panel/app/modules/users/ui/users_page.dart';
import 'package:value_panel/app/modules/users/ui/users_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';
import 'package:value_panel/app/modules/users/infra/repositories/json_generator.repository.dart';
class UsersModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UsersStore(
      Modular.get<GetUsersUseCase>()
    )),

    // UseCases
    Bind.lazySingleton((i) => GetUsers(Modular.get<UsersRepository>())),

    // Repositories
    // Bind.lazySingleton((i) => ApiUsersRepository()),
    Bind.lazySingleton((i) => JsonGeneratorRepository(Modular.get<CustomDio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const UsersPage()),
  ];
}
