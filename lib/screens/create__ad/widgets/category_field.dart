import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/screens/category/category_screen.dart';

import '../../../observables/create_ad_store/create_ad_store.dart';

class CategoryField extends StatelessWidget {
  const CategoryField({super.key, required this.createAdStore});

  final CreateAdStore createAdStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Observer(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Categoria*',
                    style: Theme.of(context).textTheme.bodyText1),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: ListTile(
                    title: (createAdStore.category == null)
                        ? null
                        : Text(
                            createAdStore.category!.description,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                    onTap: () async {
                      final category = await showDialog(
                        context: context,
                        builder: (context) =>
                            CategoryScreen(selected: createAdStore.category),
                      );

                      if (category != null) createAdStore.setCategory(category);
                    },
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
