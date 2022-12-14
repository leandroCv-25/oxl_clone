import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_clone/models/category.dart';
import 'package:olx_clone/repositories/category_repository.dart';

import '../connectivity/connectivity_store.dart';
part 'categories_store.g.dart';

class CategoriesStore = _CategoriesStoreBase with _$CategoriesStore;

abstract class _CategoriesStoreBase with Store {
  

  final ConnectivityStore connectivityStore = GetIt.I<ConnectivityStore>();

  _CategoriesStoreBase() {
    autorun((_) {
      if (connectivityStore.connected && categoryList.isEmpty)
        _loadCategories();
    });
  }

  ObservableList<Category> categoryList = ObservableList<Category>();

  @computed
  List<Category> get allCategoryList => List.from(categoryList)
    ..insert(0, Category(id: "*", description: "Todas"));

  @action
  void setCategories(List<Category> categories) {
    categoryList.clear();
    categoryList.addAll(categories);
  }

  @observable
  String? error;

  @action
  void setError(String value) => error = value;

  Future<void> _loadCategories() async {
    try {
      final categories = await CategoryRepository().getList();

      setCategories(categories);
    } catch (e) {
      setError(e as String);
    }
  }
}
