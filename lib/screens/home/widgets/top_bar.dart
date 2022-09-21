import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/screens/filter/filter_screen.dart';

import '../../../observables/home_store/home_store.dart';
import '../../category/category_screen.dart';
import 'bar_button.dart';

class TopBar extends StatelessWidget {
  final HomeStore homeStore = GetIt.I<HomeStore>();

  TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Observer(builder: (_) {
          return Observer(builder: (context) {
            return BarButton(
              label: homeStore.category?.description ?? 'Categorias',
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
              onTap: () async {
                final category =
                    await Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => CategoryScreen(
                    showAll: true,
                    selected: homeStore.category,
                  ),
                ));
                if (category != null) homeStore.setCategory(category);
              },
            );
          });
        }),
        BarButton(
          label: 'Filtros',
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Theme.of(context).primaryColor),
              left: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FilterScreen()));
          },
        ),
      ],
    );
  }
}
