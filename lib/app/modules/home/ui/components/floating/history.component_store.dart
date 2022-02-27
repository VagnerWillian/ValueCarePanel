
import 'package:mobx/mobx.dart';

part 'history.component_store.g.dart';

class HistoryFloatingStore = HistoryFloatingStoreBase with _$HistoryFloatingStore;

abstract class HistoryFloatingStoreBase with Store {

  @observable
  bool isExpanded = false;

  @observable
  bool show = false;

  @action
  void expand() {
    if(show) {
      isExpanded = true;
    }
  }

  @action
  void shrink(){
    if(show) {
      isExpanded = false;
    }
  }

  @action
  void collapse(){
    if(show) {
      isExpanded = !isExpanded;
    }
  }

  @action
  void open() {
    show = true;
    isExpanded = true;
  }

  @action
  void close() {
    show = false;
    isExpanded=false;
  }

}