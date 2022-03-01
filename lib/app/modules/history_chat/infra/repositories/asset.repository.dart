import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/services.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/modules/history_chat/domain/repositories/repository.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';
import 'package:value_panel/app/modules/history_chat/infra/models/history_item.model.dart';

class APIHistoryRepository implements HistoryRepository{
  @override
  Future<Either<HistoryError, List<HistoryItemEntity>>> getAllHistoryItems({required String idPatient}) async{
    await Future.delayed(const Duration(seconds: 2));
    String data = await rootBundle.loadString('assets/static_jsons/history_items.json');
    var jsonResult = json.decode(data);
    List<HistoryItemEntity> historyItems = (jsonResult as List).map((i) => HistoryItem.fromJson(i)).toList();
    return Right(historyItems);

  }

}