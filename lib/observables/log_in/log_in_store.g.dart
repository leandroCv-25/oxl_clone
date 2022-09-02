// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LogInStore on _LogInStoreBase, Store {
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_LogInStoreBase.emailValid'))
          .value;
  Computed<bool>? _$passValidComputed;

  @override
  bool get passValid =>
      (_$passValidComputed ??= Computed<bool>(() => super.passValid,
              name: '_LogInStoreBase.passValid'))
          .value;
  Computed<String?>? _$passErrorComputed;

  @override
  String? get passError =>
      (_$passErrorComputed ??= Computed<String?>(() => super.passError,
              name: '_LogInStoreBase.passError'))
          .value;
  Computed<bool>? _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_LogInStoreBase.formValid'))
          .value;

  late final _$emailAtom =
      Atom(name: '_LogInStoreBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$_passAtom =
      Atom(name: '_LogInStoreBase._pass', context: context);

  @override
  String? get _pass {
    _$_passAtom.reportRead();
    return super._pass;
  }

  @override
  set _pass(String? value) {
    _$_passAtom.reportWrite(value, super._pass, () {
      super._pass = value;
    });
  }

  late final _$obscureAtom =
      Atom(name: '_LogInStoreBase.obscure', context: context);

  @override
  bool get obscure {
    _$obscureAtom.reportRead();
    return super.obscure;
  }

  @override
  set obscure(bool value) {
    _$obscureAtom.reportWrite(value, super.obscure, () {
      super.obscure = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_LogInStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_LogInStoreBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$logInAsyncAction =
      AsyncAction('_LogInStoreBase.logIn', context: context);

  @override
  Future<void> logIn() {
    return _$logInAsyncAction.run(() => super.logIn());
  }

  late final _$_LogInStoreBaseActionController =
      ActionController(name: '_LogInStoreBase', context: context);

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_LogInStoreBaseActionController.startAction(
        name: '_LogInStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LogInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass(String value) {
    final _$actionInfo = _$_LogInStoreBaseActionController.startAction(
        name: '_LogInStoreBase.setPass');
    try {
      return super.setPass(value);
    } finally {
      _$_LogInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObscure() {
    final _$actionInfo = _$_LogInStoreBaseActionController.startAction(
        name: '_LogInStoreBase.setObscure');
    try {
      return super.setObscure();
    } finally {
      _$_LogInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_LogInStoreBaseActionController.startAction(
        name: '_LogInStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_LogInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
obscure: ${obscure},
loading: ${loading},
error: ${error},
emailValid: ${emailValid},
passValid: ${passValid},
passError: ${passError},
formValid: ${formValid}
    ''';
  }
}
