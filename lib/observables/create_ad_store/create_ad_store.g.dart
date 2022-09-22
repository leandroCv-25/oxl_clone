// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_ad_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateAdStore on _CreateAdStore, Store {
  Computed<bool>? _$imagesValidComputed;

  @override
  bool get imagesValid =>
      (_$imagesValidComputed ??= Computed<bool>(() => super.imagesValid,
              name: '_CreateAdStore.imagesValid'))
          .value;
  Computed<String?>? _$imagesErrorComputed;

  @override
  String? get imagesError =>
      (_$imagesErrorComputed ??= Computed<String?>(() => super.imagesError,
              name: '_CreateAdStore.imagesError'))
          .value;
  Computed<bool>? _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: '_CreateAdStore.titleValid'))
          .value;
  Computed<bool>? _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_CreateAdStore.descriptionValid'))
      .value;
  Computed<bool>? _$categoryValidComputed;

  @override
  bool get categoryValid =>
      (_$categoryValidComputed ??= Computed<bool>(() => super.categoryValid,
              name: '_CreateAdStore.categoryValid'))
          .value;
  Computed<Address?>? _$addressComputed;

  @override
  Address? get address =>
      (_$addressComputed ??= Computed<Address?>(() => super.address,
              name: '_CreateAdStore.address'))
          .value;
  Computed<num?>? _$priceComputed;

  @override
  num? get price => (_$priceComputed ??=
          Computed<num?>(() => super.price, name: '_CreateAdStore.price'))
      .value;
  Computed<bool>? _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_CreateAdStore.formValid'))
          .value;

  late final _$showErrorsAtom =
      Atom(name: '_CreateAdStore.showErrors', context: context);

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_CreateAdStore.loading', context: context);

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

  late final _$errorAtom = Atom(name: '_CreateAdStore.error', context: context);

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

  late final _$savedAdAtom =
      Atom(name: '_CreateAdStore.savedAd', context: context);

  @override
  bool get savedAd {
    _$savedAdAtom.reportRead();
    return super.savedAd;
  }

  @override
  set savedAd(bool value) {
    _$savedAdAtom.reportWrite(value, super.savedAd, () {
      super.savedAd = value;
    });
  }

  late final _$editingAtom =
      Atom(name: '_CreateAdStore.editing', context: context);

  @override
  bool get editing {
    _$editingAtom.reportRead();
    return super.editing;
  }

  @override
  set editing(bool value) {
    _$editingAtom.reportWrite(value, super.editing, () {
      super.editing = value;
    });
  }

  late final _$titleAtom = Atom(name: '_CreateAdStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_CreateAdStore.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

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

  late final _$priceTextAtom =
      Atom(name: '_CreateAdStore.priceText', context: context);

  @override
  String get priceText {
    _$priceTextAtom.reportRead();
    return super.priceText;
  }

  @override
  set priceText(String value) {
    _$priceTextAtom.reportWrite(value, super.priceText, () {
      super.priceText = value;
    });
  }

  late final _$hidePhoneAtom =
      Atom(name: '_CreateAdStore.hidePhone', context: context);

  @override
  bool get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
    });
  }

  late final _$sendAsyncAction =
      AsyncAction('_CreateAdStore.send', context: context);

  @override
  Future<void> send() {
    return _$sendAsyncAction.run(() => super.send());
  }

  late final _$_CreateAdStoreActionController =
      ActionController(name: '_CreateAdStore', context: context);

  @override
  void setEditing(bool value) {
    final _$actionInfo = _$_CreateAdStoreActionController.startAction(
        name: '_CreateAdStore.setEditing');
    try {
      return super.setEditing(value);
    } finally {
      _$_CreateAdStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_CreateAdStoreActionController.startAction(
        name: '_CreateAdStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_CreateAdStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_CreateAdStoreActionController.startAction(
        name: '_CreateAdStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_CreateAdStoreActionController.endAction(_$actionInfo);
    }
  }

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
  void setPrice(String value) {
    final _$actionInfo = _$_CreateAdStoreActionController.startAction(
        name: '_CreateAdStore.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_CreateAdStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHidePhone(bool value) {
    final _$actionInfo = _$_CreateAdStoreActionController.startAction(
        name: '_CreateAdStore.setHidePhone');
    try {
      return super.setHidePhone(value);
    } finally {
      _$_CreateAdStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowErrors() {
    final _$actionInfo = _$_CreateAdStoreActionController.startAction(
        name: '_CreateAdStore.setShowErrors');
    try {
      return super.setShowErrors();
    } finally {
      _$_CreateAdStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showErrors: ${showErrors},
loading: ${loading},
error: ${error},
savedAd: ${savedAd},
editing: ${editing},
title: ${title},
description: ${description},
category: ${category},
priceText: ${priceText},
hidePhone: ${hidePhone},
imagesValid: ${imagesValid},
imagesError: ${imagesError},
titleValid: ${titleValid},
descriptionValid: ${descriptionValid},
categoryValid: ${categoryValid},
address: ${address},
price: ${price},
formValid: ${formValid}
    ''';
  }
}
