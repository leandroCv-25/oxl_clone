// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_screen_navigation.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseScreenNavigation on _BaseScreenNavigationBase, Store {
  Computed<int>? _$pageComputed;

  @override
  int get page => (_$pageComputed ??= Computed<int>(() => super.page,
          name: '_BaseScreenNavigationBase.page'))
      .value;

  late final _$_pageAtom =
      Atom(name: '_BaseScreenNavigationBase._page', context: context);

  @override
  int get _page {
    _$_pageAtom.reportRead();
    return super._page;
  }

  @override
  set _page(int value) {
    _$_pageAtom.reportWrite(value, super._page, () {
      super._page = value;
    });
  }

  late final _$_BaseScreenNavigationBaseActionController =
      ActionController(name: '_BaseScreenNavigationBase', context: context);

  @override
  dynamic setPage(int value) {
    final _$actionInfo = _$_BaseScreenNavigationBaseActionController
        .startAction(name: '_BaseScreenNavigationBase.setPage');
    try {
      return super.setPage(value);
    } finally {
      _$_BaseScreenNavigationBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
page: ${page}
    ''';
  }
}
