import 'package:mobx/mobx.dart';

import '../../helpers/zip_validation.dart';
import '../../models/address.dart';
import '../../repositories/zip_repository.dart';
part 'zip_store.g.dart';

class ZipStore = _ZipStoreBase with _$ZipStore;

abstract class _ZipStoreBase with Store {
  _ZipStoreBase(String initialZip) {
    autorun((_) {
      if (clearZip.length != 8) {
        _reset();
      } else {
        _searchZip();
      }
    });

    setZip(initialZip);
  }

  @observable
  String zip = '';

  @action
  void setZip(String value) => zip = value;

  @computed
  String get clearZip => zipClean(zip);

  @observable
  Address? address;

  @observable
  String? error;

  @observable
  bool loading = false;

  @action
  Future<void> _searchZip() async {
    loading = true;
    try {
      address = await ZipRepository().getAddressFromApi(clearZip);
      error = null;
    } catch (e) {
      error = e as String;
      address = null;
    }
    loading = false;
  }

  @action
  void _reset() {
    address = null;
    error = null;
  }
}