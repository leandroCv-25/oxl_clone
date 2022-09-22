import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../models/ad.dart';
import '../../repositories/ad_repository.dart';
import '../user_manager/user_manager.dart';
part 'my_ads.g.dart';

class MyAds = _MyAdsBase with _$MyAds;

abstract class _MyAdsBase with Store {
  _MyAdsBase() {
    _getMyAds();
  }

  @observable
  bool loading = false;
  @observable
  String? error;

  @observable
  List<Ad> allAds = [];

  @computed
  List<Ad> get activeAds =>
      allAds.where((ad) => ad.status == AdStatus.active).toList();
  List<Ad> get pendingAds =>
      allAds.where((ad) => ad.status == AdStatus.pending).toList();
  List<Ad> get soldAds =>
      allAds.where((ad) => ad.status == AdStatus.sold).toList();

  Future<void> _getMyAds() async {
    final user = GetIt.I<UserManager>().user;

    try {
      loading = true;
      if (user != null) allAds = await AdRepository().getMyAds(user);
      loading = false;
    } catch (e) {
      setError(e as String);
    }
  }

  @action
  void setError(String? value) => error = value;

  void refresh() => _getMyAds();

  @action
  Future<void> soldAd(Ad ad) async {
    loading = true;
    await AdRepository().sold(ad);
    refresh();
  }

  @action
  Future<void> deleteAd(Ad ad) async {
    loading = true;
    await AdRepository().delete(ad);
    refresh();
  }
}
