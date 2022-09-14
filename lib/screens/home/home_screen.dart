import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/screens/home/widgets/top_bar.dart';
import 'package:olx_clone/widgets/app_drawer/app_drawer.dart';

import '../../observables/home_store/home_store.dart';
import 'widgets/search_dialog.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeStore homeStore = GetIt.I<HomeStore>();

  openSearch(BuildContext context) async {
    final search = await showDialog(
      context: context,
      builder: (_) => SearchDialog(
        currentSearch: homeStore.search,
      ),
    );
    if (search != null) homeStore.setSearch(search);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          if (homeStore.search.isEmpty) return Container();
          return GestureDetector(
            onTap: () => openSearch(context),
            child: LayoutBuilder(
              builder: (_, constraints) {
                return SizedBox(
                  width: constraints.biggest.width,
                  child: Text(homeStore.search),
                );
              },
            ),
          );
        }),
        actions: [
          Observer(builder: (_) {
            if (homeStore.search.isEmpty) {
              return IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  openSearch(context);
                },
              );
            }
            return IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                homeStore.setSearch('');
              },
            );
          }),
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          TopBar(),
        ],
      ),
    );
  }
}
