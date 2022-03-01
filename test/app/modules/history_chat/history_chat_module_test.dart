import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:value_panel/app/modules/history_chat/history_chat_module.dart';

void main() {

  setUpAll(() {
    initModule(HistoryChatModule());
  });
}