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
import 'package:value_panel/app/shared/core/domain/entities/classification.entity.dart';
import 'package:value_panel/app/shared/core/domain/entities/specialty.entity.dart';
import 'package:value_panel/app/shared/core/managers/config.manager.dart';

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
  final ConfigManager _configManager;

  //Keys
  final formKey = GlobalKey<FormState>();


  _HistoryChatStoreBase(this._appStore, this._configManager, this._getAllHistoryUseCase, this._deleteHistoryUseCase, this._markedReadUseCase){
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
    updateHistory();
    isExpanded = true;
    this.isFullHeight = isFullHeight;
  }

  @action
  _addAllItem(List<HistoryItemEntity> values)=>items.addAll(values);

  @action
  _addItem(HistoryItemEntity value)=>items.insert(0, value);

  @action
  _deleteItem(String value)=>items.removeWhere((i) => i.id==value);

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

  void updateHistory()async{
   if(selectedIdPatient!=null){
     _setLoading(true);
     Either<HistoryError, List<HistoryItemEntity>> response = await _getAllHistoryUseCase(idPatient: selectedIdPatient!);
     response.fold((HistoryError failure) {
       return failure;
     }, (List<HistoryItemEntity> items) {
       _addAllItem(items);
       return items;
     });
     _setLoading(false);
   }
  }

  Future<bool> deleteHistory(String idHistoryItem, Function onError)async{
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

  Future<bool> markRead(String idHistoryItem, Function onError)async{
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
      HistoryItemEntity newHistory = HistoryItem.sendText(
          data: "Agora",
          operator: _appStore.loggedUser!.name,
          text: "${_appStore.loggedUser!.name}: "+ textEditingController.text
      );
      _addItem(newHistory);
      scrollController.animateTo(-scrollController.offset, duration: const Duration(seconds: 1), curve: Curves.bounceIn);
      textEditingController.clear();
      setLoadingSend(false);
    }
  }

  Future sendWarningSetter({required String idPatient, int? idNewClassification, String? newAppointmentDate, int? idNewSpecialty, bool? newStatusConfirmation})async{
      if(selectedIdPatient!=null&&selectedIdPatient==idPatient){
        setLoadingSend(true);
        HistoryItemEntity newHistory = HistoryItem.sendWarningSetter(
            data: "Agora",
            operator: _appStore.loggedUser!.name,
            idNewClassification: idNewClassification,
            newAppointmentDate: newAppointmentDate,
            idNewSpecialty: idNewSpecialty,
            newStatusConfirmation: newStatusConfirmation
        );
        if(idNewClassification!=null){
          newHistory.text = "${newHistory.operator} alterou a classificação para ${_configManager.classifications.singleWhere((i) => i.id==idNewClassification).label}.";
        }else if(newAppointmentDate!=null){
          newHistory.text = "${newHistory.operator} definiu uma nova data de agendamento para:";
        }else if(idNewSpecialty!=null){
          newHistory.text = "${newHistory.operator} alterou a especialidade para ${_configManager.specialties.singleWhere((i) => i.id==idNewSpecialty).label}.";
        }else if(newStatusConfirmation!=null){
          newHistory.text = "${newHistory.operator} alterou o status para ${newStatusConfirmation?"confirmado":"não confirmado"}";
        }
        _addItem(newHistory);
        scrollController.animateTo(-scrollController.offset, duration: const Duration(seconds: 1), curve: Curves.bounceIn);
        textEditingController.clear();
        setLoadingSend(false);
      }
  }

}