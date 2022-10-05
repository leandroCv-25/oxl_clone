import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../models/ad.dart';
import '../../repositories/favorite_repository.dart';
import '../user_manager/user_manager.dart';
part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStoreBase with _$FavoriteStore;

abstract class _FavoriteStoreBase with Store {
  _FavoriteStoreBase() {
    reaction((_) => userManager.isLoggedIn, (_) {
      _getFavoriteList();
    });
  }

  final UserManager userManager = GetIt.I<UserManager>();

  ObservableList<Ad> favoriteList = ObservableList<Ad>();

  @action
  Future<void> _getFavoriteList() async {
    try {
      favoriteList.clear();
      if (userManager.user != null) {
        final favorites =
            await FavoriteRepository().getFavorites(userManager.user!);
        favoriteList.addAll(favorites);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @action
  Future<void> toggleFavorite(Ad ad) async {
    try {
      if (favoriteList.any((a) => a.id == ad.id)) {
        if (userManager.user != null) {
          favoriteList.removeWhere((a) => a.id == ad.id);
          await FavoriteRepository().delete(ad: ad, user: userManager.user!);
        }
      } else {
        if (userManager.user != null) {
          favoriteList.add(ad);
          await FavoriteRepository().save(ad: ad, user: userManager.user!);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
