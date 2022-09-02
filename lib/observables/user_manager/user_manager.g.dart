// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserManager on _UserManagerBase, Store {
  Computed<User?>? _$userComputed;

  @override
  User? get user => (_$userComputed ??=
          Computed<User?>(() => super.user, name: '_UserManagerBase.user'))
      .value;
  Computed<dynamic>? _$isLoggedInComputed;

  @override
  dynamic get isLoggedIn =>
      (_$isLoggedInComputed ??= Computed<dynamic>(() => super.isLoggedIn,
              name: '_UserManagerBase.isLoggedIn'))
          .value;

  late final _$_userAtom =
      Atom(name: '_UserManagerBase._user', context: context);

  @override
  User? get _user {
    _$_userAtom.reportRead();
    return super._user;
  }

  @override
  set _user(User? value) {
    _$_userAtom.reportWrite(value, super._user, () {
      super._user = value;
    });
  }

  late final _$_UserManagerBaseActionController =
      ActionController(name: '_UserManagerBase', context: context);

  @override
  void setUser(User? user) {
    final _$actionInfo = _$_UserManagerBaseActionController.startAction(
        name: '_UserManagerBase.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_UserManagerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoggedIn: ${isLoggedIn}
    ''';
  }
}
