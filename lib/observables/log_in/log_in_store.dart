import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../helpers/email_validation.dart';
import '../../models/user.dart';
import '../../repositories/user_repository.dart';
import '../user_manager/user_manager.dart';
part 'log_in_store.g.dart';

class LogInStore = _LogInStoreBase with _$LogInStore;

abstract class _LogInStoreBase with Store {
  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && emailValidation(email);
  String? get emailError {
    if (email == null || emailValid) {
      return null;
    } else if (email!.isEmpty) {
      return "Campo obrigatório";
    } else {
      return "E-mail invalido";
    }
  }

  @observable
  String? _pass;
  @observable
  bool obscure = true;

  @action
  void setPass(String value) => _pass = value;
  @action
  void setObscure() => obscure = !obscure;

  @computed
  bool get passValid => _pass != null && _pass!.length >= 8;

  @computed
  String? get passError {
    if (_pass != null && _pass!.length < 8) {
      return "Senhas com pelo menos 8 caracteres";
    }
    return null;
  }

  @computed
  bool get formValid => emailValid && passValid;

  @observable
  bool loading = false;
  @observable
  String? error;

  @action
  void setLoading(bool value) => loading = value;
  void setError(value) => error = value;

  @action
  Future<void> logIn() async {
    setLoading(true);

    final userREpository = UserRepository();
    try {
      setError(null);
      User user =
          await userREpository.logInWithEmail(email: email!, password: _pass!);

      GetIt.I<UserManager>().setUser(user);
    } catch (e) {
      setError(e as String);
    }

    setLoading(false);
  }
}
