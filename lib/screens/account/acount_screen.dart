import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/screens/favorites/favorites_screen.dart';
import 'package:olx_clone/screens/myads/myads_screen.dart';
import 'package:olx_clone/widgets/app_drawer/app_drawer.dart';

import '../../observables/user_manager/user_manager.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Conta'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (_) => EditAccountScreen(),
              //   ),
              // );
            },
            child: Text(
              'EDITAR',
              style: Theme.of(context)
                  .textTheme
                  .button
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: 140,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Observer(builder: (_) {
                    return Text(
                      GetIt.I<UserManager>().user?.name ?? "Erro",
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: Colors.white,
                          ),
                    );
                  }),
                  Text(
                    GetIt.I<UserManager>().user?.email ?? "Erro",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Colors.white,
                        ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Meus an??ncios',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyAdsScreen(
                        initialPage: 0,
                      )));
            },
          ),
          ListTile(
            title: Text(
              'Favoritos',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FavoritesScreen(
                        hideDrawer: true,
                      )));
            },
          ),
        ],
      ),
    );
  }
}
