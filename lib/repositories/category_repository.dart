import 'package:olx_clone/models/category.dart';
import 'package:olx_clone/repositories/parse_errors.dart';
import 'package:olx_clone/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CategoryRepository {
  Future<List<Category>> getList() async {
    final queryBuilder = QueryBuilder(ParseObject(keyCategoryTable))
      ..orderByAscending(keyCategoryDescription);

    final response = await queryBuilder.query();
    if (response.success) {
      return response.results!.map((p) => mapParseToCategory(p)).toList();
    } else {
      throw ParseErrors.getDescription(response.error!.code);
    }
  }

  Category mapParseToCategory(ParseObject parseObject) {
    return Category(
      description: parseObject.get(keyCategoryDescription),
      id: parseObject.objectId!,
    );
  }
}
