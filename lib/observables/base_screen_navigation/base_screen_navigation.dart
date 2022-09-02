import 'package:mobx/mobx.dart';
part 'base_screen_navigation.g.dart';

class BaseScreenNavigation = _BaseScreenNavigationBase
    with _$BaseScreenNavigation;

abstract class _BaseScreenNavigationBase with Store {
  _BaseScreenNavigationBase();

  @observable
  int _page = 0;

  @computed
  int get page => _page;

  @action
  setPage(int value) {
    if (value == _page) return;
    _page = value;
  }
}
