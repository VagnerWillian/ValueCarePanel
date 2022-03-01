import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/history_chat/history_chat_module.dart';
import 'package:value_panel/app/modules/history_chat/ui/history_chat.dart';
import 'package:value_panel/app/modules/home/ui/components/header/header.component.dart';
import 'package:value_panel/app/modules/home/ui/components/menus/left_menu.component.dart';
import 'package:value_panel/app/modules/home/ui/home_store.dart';
import 'package:value_panel/app/modules/home/ui/models/menu.model.dart';
import 'package:value_panel/app/shared/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
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
                  MenuLeftItem(
                    assetIcon: 'assets/images/menu/inicio.svg',
                    label: "Ínicio",
                    badgeNum: 0,
                    route: DASHBOARD_ROUTE,
                  ),
                  MenuLeftItem(assetIcon: 'assets/images/menu/monitoramento.svg', label: "Monitoramento", badgeNum: 17, route: MONITORING_ROUTE),
                  MenuLeftItem(assetIcon: 'assets/images/menu/agendamento.svg', label: "Agendamento", badgeNum: 0, route: SCHEDULING_ROUTE),
                  MenuLeftItem(assetIcon: 'assets/images/menu/pacientes.svg', label: "Pacientes", badgeNum: 0, route: '#'),
                  MenuLeftItem(assetIcon: 'assets/images/menu/notificacoes.svg', label: "Notificações", badgeNum: 0, route: '#'),
                  MenuLeftItem(assetIcon: 'assets/images/menu/analytics.svg', label: "Analytics", badgeNum: 0, route: ANALYTICS_ROUTE),
                  MenuLeftItem(assetIcon: 'assets/images/menu/pacientes.svg', label: "Usuários", badgeNum: 0, route: USERS_ROUTE),
                  MenuLeftItem(assetIcon: 'assets/images/menu/configuracoes.svg', label: "Configurações", badgeNum: 0, route: '#'),
                ]),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [Header(), Expanded(child: RouterOutlet())],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 30,
            child: HistoryChatModule()
          )
        ],
      ),
    );
  }
}
