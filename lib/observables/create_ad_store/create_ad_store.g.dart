// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ad_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateAdStore on _CreateAdStore, Store {
  late final _$categoryAtom =
      Atom(name: '_CreateAdStore.category', context: context);

  @override
  Category? get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Category? value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$_CreateAdStoreActionController =
      ActionController(name: '_CreateAdStore', context: context);

  @override
  void setCategory(Category value) {
    final _$actionInfo = _$_CreateAdStoreActionController.startAction(
        name: '_CreateAdStore.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_CreateAdStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
category: ${category}
    ''';
  }
}
