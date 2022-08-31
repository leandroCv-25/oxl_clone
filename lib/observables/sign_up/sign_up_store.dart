import 'package:mobx/mobx.dart';
import 'package:olx_clone/helpers/email_validation.dart';
import 'package:olx_clone/helpers/pass_validation.dart';
import 'package:olx_clone/models/user.dart';
import 'package:olx_clone/repositories/user_repository.dart';
part 'sign_up_store.g.dart';

// ignore: library_private_types_in_public_api
class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {
  @observable
  String? name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name!.length > 6;
  String? get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name!.isEmpty) {
      return "Campo obrigatório";
    } else {
      return "Nome muito curto";
    }
  }

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
  bool obscure = true;

  @action
  void setPass(String value) => _pass = value;
  void setObscure() => obscure = !obscure;

  @computed
  int get passValidUpperCase => (passValidationUpperCase(_pass)) ? 1 : 0;
  int get passValidSymbol => passValidationSymbol(_pass) ? 1 : 0;
  int get passValidNumber => passValidationNumber(_pass) ? 1 : 0;
  int get passValidLength => (_pass != null && _pass!.length >= 8) ? 1 : 0;

  @computed
  String? get passError {
    if (_pass != null && passValidLength != 1) {
      return "Senha muito curta! senhas com pelo menos 8 caracteres";
    } else if (_pass != null && passValidNumber != 1) {
      return "Senha muito fraca! Use senhas que contenha numeros";
    } else if (_pass != null && !passValidationUpperCase(_pass)) {
      return "Senha fraca! Use caracteres em maiúsculo";
    } else if (_pass != null && !passValidationSymbol(_pass)) {
      return "Ainda podemos reforçar! Use simbolos";
    }
    return null;
  }

  @computed
  int get passStrenghGrade =>
      passValidUpperCase + passValidSymbol + passValidNumber + passValidLength;
  bool get passValid => passStrenghGrade == 4;

  @computed
  bool get formValid => nameValid && emailValid && passValid;

  @observable
  bool loading = false;
  @observable
  String? error;

  @action
  void setLoading(bool value) => loading = value;
  void setError(value) => error = value;

  @action
  Future<void> signUp() async {
    setLoading(true);

    final User user = User(email: email!, name: name!, password: _pass);

    final userREpository = UserRepository();
    try {
      await userREpository.signUp(user);
    } catch (e) {
      setError(e as String);
    }

    setLoading(false);
  }
}
