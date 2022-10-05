import 'package:olx_clone/repositories/ad_repository.dart';
import 'package:olx_clone/repositories/parse_errors.dart';
import 'package:olx_clone/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../models/ad.dart';
import '../models/user.dart';

class FavoriteRepository {
  Future<List<Ad>> getFavorites(User user) async {
    final queryBuilder =
        QueryBuilder<ParseObject>(ParseObject(keyFavoritesTable));

    queryBuilder.whereEqualTo(keyFavoritesOwner, user.id);
    queryBuilder.includeObject([keyFavoritesAd, 'ad.owner']);

    final response = await queryBuilder.query();

    if (response.success && response.results != null) {
      return response.results!
          .map((po) => AdRepository().mapParseToAd(po.get(keyFavoritesAd)))
          .toList();
    } else if (response.success && response.results == null) {
      return [];
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> save({required Ad ad, required User user}) async {
    final favoriteObject = ParseObject(keyFavoritesTable);

    favoriteObject.set<String>(keyFavoritesOwner, user.id!);
    favoriteObject.set<ParseObject>(
        keyFavoritesAd, ParseObject(keyAdTable)..set(keyAdId, ad.id));

    final response = await favoriteObject.save();
    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }

  Future<void> delete({required Ad ad, required User user}) async {
    try {
      final queryBuilder =
          QueryBuilder<ParseObject>(ParseObject(keyFavoritesTable));

      queryBuilder.whereEqualTo(keyFavoritesOwner, user.id);
      queryBuilder.whereEqualTo(
          keyFavoritesAd, ParseObject(keyAdTable)..set(keyAdId, ad.id));

      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        for (final f in response.results as List<ParseObject>) {
          await f.delete();
        }
      }
    } catch (e) {
      return Future.error('Falha ao deletar favorito');
    }
  }
}
