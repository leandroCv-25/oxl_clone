import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_clone/models/ad.dart';
import 'package:olx_clone/models/category.dart';
import 'package:olx_clone/observables/user_manager/user_manager.dart';
import 'package:olx_clone/repositories/ad_repository.dart';

import '../../models/address.dart';
import '../zip_store/zip_store.dart';

part 'create_ad_store.g.dart';

class CreateAdStore = _CreateAdStore with _$CreateAdStore;

abstract class _CreateAdStore with Store {
  _CreateAdStore(Ad? ad) {
    if (ad != null) {
      title = ad.title;
      description = ad.description;
      images = ad.images.asObservable();
      category = ad.category;
      priceText = ad.price.toStringAsFixed(2);
      hidePhone = ad.hidePhone;

      zipStore = ZipStore(ad.address.cep);
      setEditing(true);
    } else {
      setEditing(false);
    }
  }

  @observable
  bool showErrors = false;
  @observable
  bool loading = false;
  @observable
  String? error;
  @observable
  bool savedAd = false;
  @observable
  bool editing = false;

  ObservableList images = ObservableList();

  @action
  void setEditing(bool value) => editing = value;

  @computed
  bool get imagesValid => images.isNotEmpty;

  @computed
  String? get imagesError {
    if (!showErrors || imagesValid) {
      return null;
    } else {
      return 'Insira imagens';
    }
  }

  @observable
  String title = '';

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length >= 6;
  String? get titleError {
    if (!showErrors || titleValid) {
      return null;
    } else if (title.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Título muito curto';
    }
  }

  @observable
  String description = '';

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description.length >= 10;
  String? get descriptionError {
    if (!showErrors || descriptionValid) {
      return null;
    } else if (title.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Descrição muito curta';
    }
  }

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;

  @computed
  bool get categoryValid => category != null;
  String? get categoryError {
    if (!showErrors || categoryValid) {
      return null;
    } else {
      return 'Campo obrigatório';
    }
  }

  ZipStore zipStore = ZipStore("");

  @computed
  Address? get address => zipStore.address;
  bool get addressValid => address != null;
  String? get addressError {
    if (!showErrors || addressValid) {
      return null;
    } else {
      return 'Campo obrigatório';
    }
  }

  @observable
  String priceText = '';

  @action
  void setPrice(String value) => priceText = value;

  @computed
  num? get price {
    if (priceText.contains(',')) {
      num? value = num.tryParse(priceText.replaceAll(RegExp('[^0-9]'), ''));
      if (value != null) {
        return value / 100;
      } else {
        return value;
      }
    } else {
      return num.tryParse(priceText);
    }
  }

  bool get priceValid => price != null && price! > 0 && price! <= 9999999;
  String? get priceError {
    if (!showErrors || priceValid) {
      return null;
    } else if (priceText.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Preço inválido';
    }
  }

  @observable
  bool hidePhone = false;

  @action
  void setHidePhone(bool value) => hidePhone = value;

  @computed
  bool get formValid =>
      imagesValid &&
      titleValid &&
      descriptionValid &&
      categoryValid &&
      addressValid &&
      priceValid;

  @action
  void setShowErrors() => showErrors = true;

  @action
  Future<void> send() async {
    loading = true;

    Ad ad = Ad(
      title: title,
      description: description,
      category: category!,
      address: address!,
      price: price!,
      hidePhone: hidePhone,
      user: GetIt.I<UserManager>().user!,
      images: images.toList(),
    );
    try {
      await AdRepository().save(ad);
      savedAd = true;
    } catch (e) {
      error = e as String;
    }

    loading = false;
  }
}
