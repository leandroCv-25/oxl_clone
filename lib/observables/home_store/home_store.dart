import 'package:mobx/mobx.dart';
import 'package:olx_clone/models/category.dart';

import '../../models/ad.dart';
import '../filter_store/filter_store.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  String search = '';

  @observable
  int page = 0;

  @observable
  bool lastPage = false;

  ObservableList<Ad> adList = ObservableList<Ad>();

  @action
  void setSearch(String value) => search = value;

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;

  @observable
  FilterStore filter = FilterStore();

  FilterStore get clonedFilter => filter.clone();

  @action
  void setFilter(FilterStore value) {
    filter = value;
    resetPage();
  }

  void resetPage() {
    page = 0;
    adList.clear();
    lastPage = false;
  }
}
