import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:value_panel/app/modules/configurations/configurations_module.dart';
 
void main() {

  setUpAll(() {
    initModule(ConfigurationsModule());
  });
}