import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/screens/login/login_screen.dart';

import '../../observables/base_screen_navigation/base_screen_navigation.dart';
import '../../observables/user_manager/user_manager.dart';

class AppDrawerHeader extends StatelessWidget {
  AppDrawerHeader({Key? key}) : super(key: key);

  final userManager = GetIt.I<UserManager>();

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 20, bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              if (userManager.isLoggedIn) {
                GetIt.I<BaseScreenNavigation>().setPage(4);
              } else {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              }
            },
            child: Row(
              children: [
                const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 35,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userManager.isLoggedIn
                            ? userManager.user!.name
                            : "Acesse sua conta agora!",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white),
                      ),
                      Text(
                        userManager.isLoggedIn
                            ? userManager.user!.email
                            : "Clique aqui",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
