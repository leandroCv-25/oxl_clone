import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/screens/home/widgets/top_bar.dart';
import 'package:olx_clone/widgets/app_drawer/app_drawer.dart';

import '../../observables/home_store/home_store.dart';
import '../../widgets/empty_card.dart';
import 'widgets/ad_tile.dart';
import 'widgets/create_ad_button.dart';
import 'widgets/search_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeStore homeStore = GetIt.I<HomeStore>();

  final ScrollController scrollController = ScrollController();

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
          Expanded(
            child: Stack(
              children: [
                Observer(builder: (context) {
                  if (homeStore.error != null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error,
                            color: Theme.of(context).primaryColor,
                            size: 100,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text('Ocorreu um erro!',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1),
                        ],
                      ),
                    );
                  }
                  if (homeStore.showProgress) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    );
                  }
                  if (homeStore.adList.isEmpty) {
                    return const EmptyCard('Nenhum anúncio encontrado.');
                  }

                  return ListView.builder(
                    controller: scrollController,
                    itemCount: homeStore.itemCount,
                    itemBuilder: (_, index) {
                      if (index < homeStore.adList.length) {
                        return AdTile(homeStore.adList[index]);
                      }
                      homeStore.loadNextPage();
                      return const SizedBox(
                        height: 10,
                        child: LinearProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.purple),
                        ),
                      );
                    },
                  );
                }),
                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,
                  child: CreateAdButton(scrollController),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
