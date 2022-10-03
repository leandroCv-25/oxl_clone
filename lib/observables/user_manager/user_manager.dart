import 'package:mobx/mobx.dart';
import 'package:olx_clone/repositories/user_repository.dart';

import '../../models/user.dart';
part 'user_manager.g.dart';

class UserManager = _UserManagerBase with _$UserManager;

abstract class _UserManagerBase with Store {
  _UserManagerBase() {
    _getcurrentUser();
  }

  @observable
  User? _user;

  @computed
  User? get user => _user;
  @computed
  get isLoggedIn => _user != null;

  @action
  void setUser(User? user) => _user = user;

  Future<void> _getcurrentUser() async {
    setUser(await UserRepository().currentUser());
  }

  Future<void> logout() async {
    await UserRepository().logout();
    setUser(null);
  }
}
