import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../models/user.dart';
import '../../repositories/user_repository.dart';
import '../user_manager/user_manager.dart';
part 'edit_account_store.g.dart';

class EditAccount = _EditAccountBase with _$EditAccount;

abstract class _EditAccountBase with Store {
  _EditAccountBase() {
    if (userManagerStore.user != null) {
      user = userManagerStore.user!;

      userType = user!.userType;
      name = user!.name;
      phone = user!.phone!;
    }
  }

  User? user;

  final UserManager userManagerStore = GetIt.I<UserManager>();

  @observable
  UserType userType = UserType.particular;

  @computed
  bool get isTypeParticular => userType == UserType.particular;

  @computed
  bool get isTypeProfessional => userType == UserType.professional;

  @action
  void setUserType(int value) => userType = UserType.values[value];

  @observable
  String? name;

  @observable
  bool obscure = true;

  @action
  void setObscure() => obscure = !obscure;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name!.length >= 6;
  String? get nameError => nameValid ? null : 'Campo obrigatório';

  @observable
  String? phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone!.length >= 14;
  String? get phoneError => phoneValid ? null : 'Campo obrigatório';

  @observable
  String pass1 = '';

  @action
  void setPass1(String value) => pass1 = value;

  @observable
  String pass2 = '';

  @action
  void setPass2(String value) => pass2 = value;

  @computed
  bool get passValid => pass1 == pass2 && (pass1.length >= 6 || pass1.isEmpty);
  String? get passError {
    if (pass1.isNotEmpty && pass1.length < 6) {
      return 'Senha muito curta';
    } else if (pass1 != pass2) {
      return 'Senhas não coincidem';
    }
    return null;
  }

  @computed
  bool get isFormValid => nameValid && phoneValid && passValid;

  @observable
  bool loading = false;

  @action
  Future<void> save() async {
    loading = true;

    user!.name = name!;
    user!.phone = phone;
    user!.userType = userType;

    if (pass1.isNotEmpty) {
      user!.password = pass1;
    } else {
      user!.password = null;
    }

    try {
      await UserRepository().save(user!);
      userManagerStore.setUser(user);
    } catch (e) {
      debugPrint(e.toString());
    }

    loading = false;
  }

  void logout() => userManagerStore.logout();
}
