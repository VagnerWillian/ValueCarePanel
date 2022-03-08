import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/modules/history_chat/domain/usecases/get_all_history.usecase.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';
import 'package:value_panel/app/modules/history_chat/infra/models/history_item.model.dart';
import 'package:value_panel/app/modules/home/ui/home_store.dart';

part 'history_chat_store.g.dart';

class HistoryChatStore = _HistoryChatStoreBase with _$HistoryChatStore;
abstract class _HistoryChatStoreBase with Store {

  //CaseUses
  final GetAllHistoryUseCase _getAllHistoryUseCase;

  //Controllers
  late final TextEditingController textEditingController;

  //Store
  final HomeStore _homeStore;

  _HistoryChatStoreBase(this._getAllHistoryUseCase, this._homeStore){
   textEditingController = TextEditingController();
  }

  //Observables

  @observable
  bool isExpanded = false;

  @observable
  String? selectedIdPatient;

  @observable
  bool loading = false;

  @observable
  bool loadingSend = false;

  @observable
  ObservableList<HistoryItemEntity> items = ObservableList<HistoryItemEntity>();

  //Actions

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
  void open({required String idPatient}) {
    selectedIdPatient = idPatient;
    loadhistory(idPatient: idPatient);
    isExpanded = true;
  }

  @action
  addAllItem(List<HistoryItemEntity> values)=>items.addAll(values);

  @action
  addItem(HistoryItemEntity value)=>items.insert(0, value);

  @action
  setLoading(bool value)=>loading=value;

  @action
  setLoadingSend(bool value)=>loadingSend=value;

  @action
  void close() {
    selectedIdPatient = null;
    isExpanded=false;
  }

  //Voids

  void dispose(){
    textEditingController.dispose();
  }

  void loadhistory({required String idPatient})async{
    setLoading(true);
    Either<HistoryError, List<HistoryItemEntity>> response = await _getAllHistoryUseCase(idPatient: idPatient);
    response.fold((HistoryError failure) {
      return failure;
    }, (List<HistoryItemEntity> items) {
      addAllItem(items);
      return items;
    });
    setLoading(false);
  }

  void sendText()async{
    setLoadingSend(true);
    HistoryItemEntity newHistory = HistoryItem.send(
        name: "Vagner Willian",
        photo: "assets/ images/photos/user_1.jpg",
        text: textEditingController.text);

    await Future.delayed(const Duration(seconds: 1));
    addItem(newHistory);
    textEditingController.clear();
    setLoadingSend(false);
  }



}