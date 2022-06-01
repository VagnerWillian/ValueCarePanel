import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:value_panel/app/app_store.dart';
import 'package:value_panel/app/modules/history_chat/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/history_chat/domain/services/delete_history.service.dart';
import 'package:value_panel/app/modules/history_chat/domain/services/get_all_history.service.dart';
import 'package:value_panel/app/modules/history_chat/domain/services/mark_read_history.service.dart';
import 'package:value_panel/app/modules/history_chat/domain/usecases/get_all_history.usecase.dart';
import 'package:value_panel/app/modules/history_chat/domain/usecases/mark_read_history.usecase.dart';
import 'package:value_panel/app/modules/history_chat/infra/repositories/api.repository.dart';
import 'package:value_panel/app/modules/history_chat/infra/repositories/asset.repository.dart';
import 'package:value_panel/app/modules/history_chat/ui/history_chat.dart';
import 'package:value_panel/app/modules/history_chat/ui/history_chat_store.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';
import 'package:value_panel/app/utils/utils.dart';

import '../../shared/custom_dio/custom.dio.dart';
import 'domain/usecases/delete_history.usecase.dart';

class HistoryChatModule extends WidgetModule {

  @override
  final List<Bind> binds = [

    //Stories
    Bind.lazySingleton((i) => HistoryChatStore(
        i.get<AppStore>(),
        i.get<ConfigManager>(),
        i.get<GetAllHistoryUseCase>(),
        i.get<DeleteHistoryUseCase>(),
        i.get<MarkedReadUseCase>(),
    )),

    //Usecases
    Bind.lazySingleton((i) => GetAllHistory(i.get<HistoryRepository>())),
    Bind.lazySingleton((i) => DeleteHistory(i.get<HistoryRepository>())),
    Bind.lazySingleton((i) => MarkedReadService(i.get<HistoryRepository>())),

    // Repositories
    Bind.lazySingleton((i) {
      // if(MOCK){
        return AssetHistoryRepository();
      // }
      // return ApiHistoryRepository(i.get<CustomDio>());
    }),

  ];

  @override
  Widget get view => const HistoryChat();

}
