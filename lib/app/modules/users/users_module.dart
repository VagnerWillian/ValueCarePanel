import 'package:value_panel/app/modules/users/users_Page.dart';
import 'package:value_panel/app/modules/users/users_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsersModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => UsersStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => UsersPage()),
  ];
}
