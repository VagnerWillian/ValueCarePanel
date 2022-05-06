import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/app_store.dart';
import 'package:value_panel/app/modules/history_chat/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/history_chat/domain/services/get_all_history.service.dart';
import 'package:value_panel/app/modules/history_chat/domain/usecases/get_all_history.usecase.dart';
import 'package:value_panel/app/modules/history_chat/infra/repositories/asset.repository.dart';
import 'package:value_panel/app/modules/history_chat/ui/history_chat.dart';
import 'package:value_panel/app/modules/history_chat/ui/history_chat_store.dart';

class HistoryChatModule extends WidgetModule {

  @override
  final List<Bind> binds = [

    //Stories
    Bind.lazySingleton((i) => HistoryChatStore(
        i.get<GetAllHistoryUseCase>(),
        i.get<AppStore>()
    )),

    //Usecases
    Bind.lazySingleton((i) => GetAllHistory(i.get<HistoryRepository>())),

    // Repositories
    // Bind.lazySingleton((i) => JsonGeneratorHistoryRepository(i.get<CustomDio>())),
    Bind.lazySingleton((i) => APIHistoryRepository()),

  ];

  @override
  Widget get view => const HistoryChat();

}
