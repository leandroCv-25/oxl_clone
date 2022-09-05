import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/models/category.dart';
import 'package:olx_clone/observables/categories/categories_store.dart';
import 'package:olx_clone/widgets/error_box.dart';
import 'package:olx_clone/widgets/responsive_widget.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key, this.selected, this.showAll = false});

  final Category? selected;
  final bool showAll;

  final CategoriesStore categoriesStore = GetIt.I<CategoriesStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todas as categorias"),
      ),
      body: Observer(
        builder: (context) {
          if (categoriesStore.error != null) {
            return SizedBox(
              width: ResponsiveWidget.isLimitedOnMobileScreenLarge(context),
              height: ResponsiveWidget.isLimitedOnMobileScreenLarge(context),
              child: Center(
                child: Card(child: ErrorBox(message: categoriesStore.error)),
              ),
            );
          }
          List<Category> categories = showAll
              ? categoriesStore.allCategoryList
              : categoriesStore.categoryList;
          return ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: categories.length,
            separatorBuilder: (_, index) => const Divider(
              height: 1,
              color: Colors.grey,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pop(categories[index]);
                },
                child: Container(
                  height: 50,
                  color: categories[index].id == selected?.id
                      ? Theme.of(context).primaryColor.withAlpha(50)
                      : null,
                  alignment: Alignment.center,
                  child: Text(
                    categories[index].description,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
