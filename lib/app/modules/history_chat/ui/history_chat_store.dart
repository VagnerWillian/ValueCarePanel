import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:value_panel/app/app_store.dart';
import 'package:value_panel/app/modules/history_chat/domain/entities/history_item.entity.dart';
import 'package:value_panel/app/modules/history_chat/domain/usecases/delete_history.usecase.dart';
import 'package:value_panel/app/modules/history_chat/domain/usecases/get_all_history.usecase.dart';
import 'package:value_panel/app/modules/history_chat/domain/usecases/mark_read_history.usecase.dart';
import 'package:value_panel/app/modules/history_chat/errors/history.errors.dart';
import 'package:value_panel/app/modules/history_chat/infra/models/history_item.model.dart';

part 'history_chat_store.g.dart';

class HistoryChatStore = _HistoryChatStoreBase with _$HistoryChatStore;
abstract class _HistoryChatStoreBase with Store {

  //CaseUses
  final GetAllHistoryUseCase _getAllHistoryUseCase;
  final DeleteHistoryUseCase _deleteHistoryUseCase;
  final MarkedReadUseCase _markedReadUseCase;

  //Controllers
  late final TextEditingController textEditingController;
  late final ScrollController scrollController;

  //Store
  final AppStore _appStore;

  //Keys
  final formKey = GlobalKey<FormState>();


  _HistoryChatStoreBase(this._getAllHistoryUseCase, this._deleteHistoryUseCase, this._markedReadUseCase,this._appStore){
   textEditingController = TextEditingController();
   scrollController = ScrollController();
  }

  //Observables

  @observable
  bool isExpanded = false;

  @observable
  bool isFullHeight = false;

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
  void open({required String idPatient, isFullHeight = false}) {
    selectedIdPatient = idPatient;
    _loadHistory(idPatient: idPatient);
    isExpanded = true;
    this.isFullHeight = isFullHeight;
  }

  @action
  _addAllItem(List<HistoryItemEntity> values)=>items.addAll(values);

  @action
  _addItem(HistoryItemEntity value)=>items.insert(0, value);

  @action
  _deleteItem(int value)=>items.removeWhere((i) => i.id==value);

  @action
  _setLoading(bool value)=>loading=value;

  @action
  setLoadingSend(bool value)=>loadingSend=value;

  @action
  void close() {
    selectedIdPatient = null;
    isExpanded=false;
  }

  //Voids

  void _loadHistory({required String idPatient})async{
    _setLoading(true);
    Either<HistoryError, List<HistoryItemEntity>> response = await _getAllHistoryUseCase(idPatient: idPatient);
    response.fold((HistoryError failure) {
      return failure;
    }, (List<HistoryItemEntity> items) {
      _addAllItem(items);
      return items;
    });
    _setLoading(false);
  }

  Future<bool> deleteHistory(int idHistoryItem, Function onError)async{
    Either<HistoryError, bool> response = await _deleteHistoryUseCase(idHistoryItem: idHistoryItem);
    bool deleted = false;
    response.fold((HistoryError failure) {
      onError(failure);
      return failure;
    }, (bool value) {
      _deleteItem(idHistoryItem);
      deleted = true;
      return value;
    });
    return deleted;
  }

  Future<bool> markRead(int idHistoryItem, Function onError)async{
    Either<HistoryError, bool> response = await _markedReadUseCase(idHistoryItem: idHistoryItem);
    bool marked = false;
    response.fold((HistoryError failure) {
      onError(failure);
      return failure;
    }, (bool value) {
      marked = true;
      return value;
    });
    return marked;
  }

  Future sendText()async{
    if(formKey.currentState!.validate()){
      setLoadingSend(true);
      HistoryItemEntity newHistory = HistoryItem.send(
          data: "Agora",
          name: _appStore.loggedUser!.name,
          text: textEditingController.text);
      _addItem(newHistory);
      scrollController.animateTo(-scrollController.offset, duration: const Duration(seconds: 1), curve: Curves.bounceIn);
      textEditingController.clear();
      setLoadingSend(false);
    }
  }



}