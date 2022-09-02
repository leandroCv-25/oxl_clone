import 'package:mobx/mobx.dart';

part 'create_ad_store.g.dart';

class CreateAdStore = _CreateAdStore with _$CreateAdStore;

abstract class _CreateAdStore with Store {
  ObservableList images = ObservableList();
}
