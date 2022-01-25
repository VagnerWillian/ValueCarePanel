import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/home/ui/components/header/header.component.dart';
import 'package:value_panel/app/modules/home/ui/components/menus/left_menu.component.dart';
import 'package:value_panel/app/modules/home/ui/home_store.dart';
import 'package:value_panel/app/modules/home/ui/models/menu.model.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        direction: Axis.horizontal,
        children: [
          LeftMenu(
            menus: [
            MenuLeftItem(assetIcon: 'assets/images/menu/inicio.svg', label: "Ínicio", badgeNum: 0),
            MenuLeftItem(assetIcon: 'assets/images/menu/monitoramento.svg', label: "Monitoramento", badgeNum: 17),
            MenuLeftItem(assetIcon: 'assets/images/menu/agendamento.svg', label: "Agendamento", badgeNum: 0),
            MenuLeftItem(assetIcon: 'assets/images/menu/pacientes.svg', label: "Pacientes", badgeNum: 0),
            MenuLeftItem(assetIcon: 'assets/images/menu/notificacoes.svg', label: "Notificações", badgeNum: 0),
            MenuLeftItem(assetIcon: 'assets/images/menu/analytics.svg', label: "Analytics", badgeNum: 0),
            MenuLeftItem(assetIcon: 'assets/images/menu/pacientes.svg', label: "Usuários", badgeNum: 0),
            MenuLeftItem(assetIcon: 'assets/images/menu/configuracoes.svg', label: "Configurações", badgeNum: 0),
          ]),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Header(),
                Expanded(
                  child: RouterOutlet()
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}