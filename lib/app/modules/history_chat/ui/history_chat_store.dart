import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/modules/history_chat/domain/usecases/get_all_history.usecase.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';

part 'history_chat_store.g.dart';

class HistoryChatStore = _HistoryChatStoreBase with _$HistoryChatStore;
abstract class _HistoryChatStoreBase with Store {

  final GetAllHistoryUseCase _getAllHistoryUseCase;
  _HistoryChatStoreBase(this._getAllHistoryUseCase);

  @observable
  bool isExpanded = false;

  @observable
  String? selectedIdPatient;

  @observable
  bool loading = false;

  @observable
  final ObservableList<HistoryItemEntity> items = ObservableList<HistoryItemEntity>();

  @action
  void expand() {
    if(selectedIdPatient!=null) {
      isExpanded = true;
    }
  }

  @action
  void shrink(){
    if(selectedIdPatient!=null) {
      isExpanded = false;
    }
  }

  @action
  void collapse(){
    if(selectedIdPatient!=null) {
      isExpanded = !isExpanded;
    }
  }

  @action
  void open({required String idPatient}) async{
    selectedIdPatient = idPatient;
    isExpanded = true;
    setLoading(true);
    Either<HistoryError, List<HistoryItemEntity>> response = await _getAllHistoryUseCase(idPatient: idPatient);
    response.fold((HistoryError failure) {
      return failure;
    }, (List<HistoryItemEntity> items) {
      addAllItem(items);
      return items;
    });
    setLoading(false);
    isExpanded = true;
  }

  @action
  addAllItem(List<HistoryItemEntity> values)=>items.addAll(values);

  @action
  addItem(HistoryItemEntity value)=>items.add(value);

  @action
  setLoading(bool value)=>loading=value;

  @action
  void close() {
    selectedIdPatient = null;
    isExpanded=false;
  }

}