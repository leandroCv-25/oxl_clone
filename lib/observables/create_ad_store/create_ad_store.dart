import 'package:mobx/mobx.dart';
import 'package:olx_clone/models/category.dart';

part 'create_ad_store.g.dart';

class CreateAdStore = _CreateAdStore with _$CreateAdStore;

abstract class _CreateAdStore with Store {
  ObservableList images = ObservableList();

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;
}
