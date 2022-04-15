import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/users/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/users/domain/usecases/create_user.usecase.dart';
import 'package:value_panel/app/modules/users/domain/usecases/get_users.usecase.dart';
import 'package:value_panel/app/modules/users/ui/users_page.dart';
import 'package:value_panel/app/modules/users/ui/users_store.dart';
import 'package:value_panel/app/shared/custom_dio/custom.dio.dart';

import '../scheduling/infra/repositories/json_generator.repository.dart';
import 'infra/repositories/api.repository.dart';
import 'ui/components/dialogs/new_user.dialog_store.dart';
class UsersModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UsersStore(Modular.get<GetUsersUseCase>(),)),
    Bind.lazySingleton((i) => NewUserDialogStore(Modular.get<CreateUserUseCase>(),)),

    // UseCases
    Bind.lazySingleton((i) => GetUsersUseCase(Modular.get<UsersRepository>())),
    Bind.lazySingleton((i) => CreateUserUseCase(Modular.get<UsersRepository>())),

    // Repositories
    Bind.lazySingleton((i) => ApiUsersRepository(i.get<CustomDio>())),
    // Bind.lazySingleton((i) => JsonGeneratorRepository(Modular.get<CustomDio>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const UsersPage()),
  ];
}
