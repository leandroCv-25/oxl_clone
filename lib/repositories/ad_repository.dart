import 'dart:io';

import 'package:olx_clone/models/category.dart';
import 'package:olx_clone/models/user.dart';
import 'package:olx_clone/observables/filter_store/filter_store.dart';
import 'package:olx_clone/repositories/category_repository.dart';
import 'package:olx_clone/repositories/user_repository.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path/path.dart' as path;

import '../models/ad.dart';
import '../models/address.dart';
import '../models/city.dart';
import '../models/uf.dart';
import 'parse_errors.dart';
import 'table_keys.dart';

class AdRepository {
  Future<List<Ad>> getHomeAdList({
    required FilterStore filter,
    required String search,
    Category? category,
    required int page,
  }) async {
    try {
      final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyAdTable));

      queryBuilder.includeObject([keyAdOwner, keyAdCategory]);

      queryBuilder.setAmountToSkip(page * 10);
      queryBuilder.setLimit(10);

      queryBuilder.whereEqualTo(keyAdStatus, AdStatus.active.index);

      if (search.trim().isNotEmpty) {
        queryBuilder.whereContains(keyAdTitle, search, caseSensitive: false);
      }

      if (category != null && category.id != '*') {
        queryBuilder.whereEqualTo(
          keyAdCategory,
          (ParseObject(keyCategoryTable)..set(keyCategoryId, category.id))
              .toPointer(),
        );
      }

      switch (filter.orderBy) {
        case OrderBy.price:
          queryBuilder.orderByAscending(keyAdPrice);
          break;
        case OrderBy.date:
        default:
          queryBuilder.orderByDescending(keyAdCreatedAt);
          break;
      }

      if (filter.minPrice != null && filter.minPrice! > 0) {
        queryBuilder.whereGreaterThanOrEqualsTo(keyAdPrice, filter.minPrice);
      }

      if (filter.maxPrice != null && filter.maxPrice! > 0) {
        queryBuilder.whereLessThanOrEqualTo(keyAdPrice, filter.maxPrice);
      }

      if (filter.vendorType > 0 &&
          filter.vendorType < (vendorTypeProfessional | vendorTypeParticular)) {
        final userQuery = QueryBuilder<ParseUser>(ParseUser.forQuery());

        if (filter.vendorType == vendorTypeParticular) {
          userQuery.whereEqualTo(keyUserType, UserType.particular.index);
        }

        if (filter.vendorType == vendorTypeProfessional) {
          userQuery.whereEqualTo(keyUserType, UserType.professional.index);
        }

        queryBuilder.whereMatchesQuery(keyAdOwner, userQuery);
      }

      final response = await queryBuilder.query();
      if (response.success && response.results != null) {
        return response.results!.map((po) => mapParseToAd(po)).toList();
      } else if (response.success && response.results == null) {
        return [];
      } else {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      return Future.error('Falha de conexão');
    }
  }

  Future<void> save(Ad ad) async {
    try {
      final parseImages = await saveImages(ad.images);

      final parseUser = ParseUser('', '', '')..set(keyUserId, ad.user.id);

      final adObject = ParseObject(keyAdTable);

      if (ad.id != null) adObject.objectId = ad.id;

      final parseAcl = ParseACL(owner: parseUser);
      parseAcl.setPublicReadAccess(allowed: true);
      parseAcl.setPublicWriteAccess(allowed: false);
      adObject.setACL(parseAcl);

      adObject.set<String>(keyAdTitle, ad.title);
      adObject.set<String>(keyAdDescription, ad.description);
      adObject.set<bool>(keyAdHidePhone, ad.hidePhone);
      adObject.set<double>(keyAdPrice, ad.price.toDouble());
      adObject.set<int>(keyAdStatus, ad.status.index);

      adObject.set<String>(keyAdDistrict, ad.address.district);
      adObject.set<String>(keyAdCity, ad.address.city.name);
      adObject.set<String>(keyAdFederativeUnit, ad.address.uf.initials);
      adObject.set<String>(keyAdPostalCode, ad.address.cep);

      adObject.set<List<ParseFile>>(keyAdImages, parseImages);

      adObject.set<ParseUser>(keyAdOwner, parseUser);

      adObject.set<ParseObject>(keyAdCategory,
          ParseObject(keyCategoryTable)..set(keyCategoryId, ad.category.id));
      ParseResponse response;
      if (ad.id != null) {
        response = await adObject.save();
      } else {
        response = await adObject.create();
      }
      if (!response.success) {
        return Future.error(ParseErrors.getDescription(response.error!.code));
      }
    } catch (e) {
      return Future.error('Falha ao salvar anúncio');
    }
  }

  Future<List<ParseFile>> saveImages(List images) async {
    final parseImages = <ParseFile>[];

    try {
      for (final image in images) {
        if (image is File) {
          final parseFile = ParseFile(image, name: path.basename(image.path));
          final response = await parseFile.save();
          if (!response.success) {
            return Future.error(
                ParseErrors.getDescription(response.error!.code));
          }
          parseImages.add(parseFile);
        } else {
          final parseFile = ParseFile(null);
          parseFile.name = path.basename(image);
          parseFile.url = image;
          parseImages.add(parseFile);
        }
      }

      return parseImages;
    } catch (e) {
      return Future.error('Falha ao salvar imagens');
    }
  }

  Ad mapParseToAd(ParseObject object) {
    return Ad(
      id: object.objectId,
      title: object.get<String>(keyAdTitle)!,
      description: object.get<String>(keyAdDescription)!,
      images: object.get<List>(keyAdImages)!.map((e) => e.url).toList(),
      hidePhone: object.get<bool>(keyAdHidePhone)!,
      price: object.get<num>(keyAdPrice)!,
      created: object.createdAt!,
      address: Address(
        district: object.get<String>(keyAdDistrict)!,
        city: City(name: object.get<String>(keyAdCity)!),
        cep: object.get<String>(keyAdPostalCode)!,
        uf: UF(initials: object.get<String>(keyAdFederativeUnit)!),
      ),
      views: object.get<int>(keyAdViews, defaultValue: 0)!,
      category: CategoryRepository()
          .mapParseToCategory(object.get<ParseObject>(keyAdCategory)!),
      status: AdStatus.values[object.get<int>(keyAdStatus)!],
      user: UserRepository().mapParseToUser(object.get<ParseUser>(keyAdOwner)!),
    );
  }
}
