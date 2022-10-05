import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/widgets/app_drawer/app_drawer_header.dart';

import '../../observables/base_screen_navigation/base_screen_navigation.dart';
import '../../observables/user_manager/user_manager.dart';
import '../../screens/login/login_screen.dart';
import 'page_section_tile.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);

  final BaseScreenNavigation baseScreenNavigation =
      GetIt.I<BaseScreenNavigation>();
  final UserManager userManager = GetIt.I<UserManager>();

  @override
  Widget build(BuildContext context) {
    Future<void> verifyLoginAndSetPage(int page) async {
      if (userManager.isLoggedIn) {
        baseScreenNavigation.setPage(page);
      } else {
        await Navigator.of(context)
            .push(MaterialPageRoute(builder: (contest) => const LoginScreen()));
        if (userManager.isLoggedIn) baseScreenNavigation.setPage(page);
      }
    }

    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              AppDrawerHeader(),
              Observer(builder: (context) {
                return PageSectionTile(
                    label: "Anuncios",
                    iconData: Icons.list,
                    highLighted: baseScreenNavigation.page == 0,
                    onTap: () {
                      verifyLoginAndSetPage(0);
                    });
              }),
              Observer(builder: (context) {
                return PageSectionTile(
                    label: "Inserir Anúncio",
                    iconData: Icons.edit,
                    highLighted: baseScreenNavigation.page == 1,
                    onTap: () {
                      verifyLoginAndSetPage(1);
                    });
              }),
              Observer(builder: (context) {
                return PageSectionTile(
                    label: "Anuncios",
                    iconData: Icons.list,
                    highLighted: baseScreenNavigation.page == 2,
                    onTap: () {
                      verifyLoginAndSetPage(2);
                    });
              }),
              Observer(builder: (context) {
                return PageSectionTile(
                    label: "Favoritos",
                    iconData: Icons.favorite,
                    highLighted: baseScreenNavigation.page == 3,
                    onTap: () {
                      verifyLoginAndSetPage(3);
                    });
              }),
              Observer(builder: (context) {
                return PageSectionTile(
                    label: "Minha Conta",
                    iconData: Icons.person,
                    highLighted: baseScreenNavigation.page == 4,
                    onTap: () {
                      verifyLoginAndSetPage(4);
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
