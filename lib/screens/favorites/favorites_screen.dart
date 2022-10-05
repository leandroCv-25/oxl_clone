import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/widgets/app_drawer/app_drawer.dart';


import '../../observables/favorite/favorite_store.dart';
import '../../widgets/empty_card.dart';
import 'components/favorite_tile.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({this.hideDrawer = false});

  final bool hideDrawer;

  final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        centerTitle: true,
      ),
      drawer: hideDrawer ? null : AppDrawer(),
      body: Observer(builder: (_) {
        if (favoriteStore.favoriteList.isEmpty) {
          return const EmptyCard('Nenhum anúncio favoritado.');
        }

        return ListView.builder(
          padding: const EdgeInsets.all(2),
          itemCount: favoriteStore.favoriteList.length,
          itemBuilder: (_, index) =>
              FavoriteTile(favoriteStore.favoriteList[index]),
        );
      }),
    );
  }
}
