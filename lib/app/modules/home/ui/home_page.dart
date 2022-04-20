import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/history_chat/history_chat_module.dart';
import 'package:value_panel/app/modules/home/ui/components/header/header.component.dart';
import 'package:value_panel/app/modules/home/ui/components/menus/left_menu.component.dart';
import 'package:value_panel/app/modules/home/ui/home_store.dart';
import 'package:value_panel/app/modules/home/ui/models/menu.model.dart';
import 'package:value_panel/app/shared/core/infra/models/user.model.dart';
import 'package:value_panel/app/utils/utils.dart';

import '../../../shared/components/dialogs/another_error.dialog.dart';
import '../../../shared/components/dialogs/repository_error.dialog.dart';
import '../errors/home.errors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) async{
      await store.loadUser(onError: onError);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Flex(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            direction: Axis.horizontal,
            children: [
              Observer(
                builder: (_) => LeftMenu(actuallyRoute: controller.actuallyRoute, navigateTo: controller.navigateTo, menus: [
                  MenuLeftItem(assetIcon: 'assets/images/menu/inicio.svg', label: "Ínicio", badgeNum: 0, route: DASHBOARD_ROUTE),
                  MenuLeftItem(assetIcon: 'assets/images/menu/monitoramento.svg', label: "Monitoramento", badgeNum: 17, route: MONITORING_ROUTE),
                  // MenuLeftItem(assetIcon: 'assets/images/menu/agendamento.svg', label: "Agendamento", badgeNum: 0, route: SCHEDULING_ROUTE),
                  // MenuLeftItem(assetIcon: 'assets/images/menu/pacientes.svg', label: "Pacientes", badgeNum: 0, route: PATIENTS_ROUTE),
                  // MenuLeftItem(assetIcon: 'assets/images/menu/notificacoes.svg', label: "Notificações", badgeNum: 0, route: '#'),
                  // MenuLeftItem(assetIcon: 'assets/images/menu/analytics.svg', label: "Analytics", badgeNum: 0, route: ANALYTICS_ROUTE),
                  MenuLeftItem(assetIcon: 'assets/images/menu/pacientes.svg', label: "Usuários", badgeNum: 0, route: USERS_ROUTE),
                  // MenuLeftItem(assetIcon: 'assets/images/menu/configuracoes.svg', label: "Configurações", badgeNum: 0, route: CONFIG_ROUTE),
                ]),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Observer(
                      builder: (_) => Header(
                        userEntity: store.userLogged,
                        signOut: store.signOut,
                      ),
                    ),
                    Observer(builder: (_) => Expanded(child: store.userLogged == null ? Container() : const RouterOutlet()))
                  ],
                ),
              ),
            ],
          ),
          Positioned(bottom: 0, right: 30, child: HistoryChatModule())
        ],
      ),
    );
  }

  Future onError(HomeError failure) async {
    if (failure is HomeRepositoryError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => RepositoryErrorDialog(repositoryError: failure));
    } else if (failure is UnknownHomeError) {
      await showDialog(barrierColor: Colors.white70, context: context, builder: (_) => UnknownErrorDialog(unknownError: failure));
    }
  }
}
