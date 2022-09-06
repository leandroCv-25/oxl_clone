// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zip_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ZipStore on _ZipStoreBase, Store {
  Computed<String>? _$clearZipComputed;

  @override
  String get clearZip =>
      (_$clearZipComputed ??= Computed<String>(() => super.clearZip,
              name: '_ZipStoreBase.clearZip'))
          .value;

  late final _$zipAtom = Atom(name: '_ZipStoreBase.zip', context: context);

  @override
  String get zip {
    _$zipAtom.reportRead();
    return super.zip;
  }

  @override
  set zip(String value) {
    _$zipAtom.reportWrite(value, super.zip, () {
      super.zip = value;
    });
  }

  late final _$addressAtom =
      Atom(name: '_ZipStoreBase.address', context: context);

  @override
  Address? get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address? value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$errorAtom = Atom(name: '_ZipStoreBase.error', context: context);

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

  late final _$loadingAtom =
      Atom(name: '_ZipStoreBase.loading', context: context);

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

  late final _$_searchZipAsyncAction =
      AsyncAction('_ZipStoreBase._searchZip', context: context);

  @override
  Future<void> _searchZip() {
    return _$_searchZipAsyncAction.run(() => super._searchZip());
  }

  late final _$_ZipStoreBaseActionController =
      ActionController(name: '_ZipStoreBase', context: context);

  @override
  void setZip(String value) {
    final _$actionInfo = _$_ZipStoreBaseActionController.startAction(
        name: '_ZipStoreBase.setZip');
    try {
      return super.setZip(value);
    } finally {
      _$_ZipStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _reset() {
    final _$actionInfo = _$_ZipStoreBaseActionController.startAction(
        name: '_ZipStoreBase._reset');
    try {
      return super._reset();
    } finally {
      _$_ZipStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
zip: ${zip},
address: ${address},
error: ${error},
loading: ${loading},
clearZip: ${clearZip}
    ''';
  }
}
