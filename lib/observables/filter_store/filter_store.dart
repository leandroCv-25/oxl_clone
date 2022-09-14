// ignore_for_file: unused_element

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../home_store/home_store.dart';
part 'filter_store.g.dart';

class FilterStore = _FilterStore with _$FilterStore;

enum OrderBy { date, price }

const int vendorTypeParticular = 1 << 0;
const int vendorTypeProfessional = 1 << 1;

abstract class _FilterStore with Store {
  _FilterStore(
      {this.minPrice,
      this.maxPrice,
      this.orderBy = OrderBy.date,
      this.vendorType = 3});

  @observable
  OrderBy orderBy = OrderBy.date;

  @action
  void setOrderBy(OrderBy value) => orderBy = value;

  @observable
  int? minPrice;

  @action
  void setMinPrice(int value) => minPrice = value;

  @observable
  int? maxPrice;

  @computed
  String? get priceError =>
      maxPrice != null && minPrice != null && maxPrice! < minPrice!
          ? 'Faixa de preço inválida'
          : null;

  @action
  void setMaxPrice(int value) => maxPrice = value;

  @observable
  int vendorType;

  @action
  void selectVendorType(int value) => vendorType = value;
  void setVendorType(int type) => vendorType = vendorType | type;
  void resetVendorType(int type) => vendorType = vendorType & ~type;

  @computed
  bool get isTypeParticular => (vendorType & vendorTypeParticular) != 0;
  bool get isTypeProfessional => (vendorType & vendorTypeProfessional) != 0;

  @computed
  bool get isFormValid => priceError == null;

  void save() {
    GetIt.I<HomeStore>().setFilter(clone());
  }

  FilterStore clone() {
    return FilterStore(
        orderBy: orderBy,
        minPrice: minPrice,
        maxPrice: maxPrice,
        vendorType: vendorType);
  }
}
