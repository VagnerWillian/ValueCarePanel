import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/modules/configurations/ui/configurations_store.dart';
import 'package:flutter/material.dart';

class ConfigurationsPage extends StatefulWidget {
  final String title;
  const ConfigurationsPage({Key? key, this.title = 'ConfigurationsPage'}) : super(key: key);
  @override
  ConfigurationsPageState createState() => ConfigurationsPageState();
}
class ConfigurationsPageState extends State<ConfigurationsPage> {
  final ConfigurationsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}