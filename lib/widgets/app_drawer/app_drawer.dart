import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/widgets/app_drawer/app_drawer_header.dart';

import '../../observables/base_screen_navigation/base_screen_navigation.dart';
import 'page_section_tile.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({Key? key}) : super(key: key);

  final BaseScreenNavigation baseScreenNavigation =
      GetIt.I<BaseScreenNavigation>();

  @override
  Widget build(BuildContext context) {
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
                      baseScreenNavigation.setPage(0);
                    });
              }),
              Observer(builder: (context) {
                return PageSectionTile(
                    label: "Inserir Anúncio",
                    iconData: Icons.edit,
                    highLighted: baseScreenNavigation.page == 1,
                    onTap: () {
                      baseScreenNavigation.setPage(1);
                    });
              }),
              Observer(builder: (context) {
                return PageSectionTile(
                    label: "Anuncios",
                    iconData: Icons.list,
                    highLighted: baseScreenNavigation.page == 2,
                    onTap: () {
                      baseScreenNavigation.setPage(1);
                    });
              }),
              Observer(builder: (context) {
                return PageSectionTile(
                    label: "Anuncios",
                    iconData: Icons.list,
                    highLighted: baseScreenNavigation.page == 3,
                    onTap: () {
                      baseScreenNavigation.setPage(3);
                    });
              }),
              Observer(builder: (context) {
                return PageSectionTile(
                    label: "Minha Conta",
                    iconData: Icons.person,
                    highLighted: baseScreenNavigation.page == 4,
                    onTap: () {
                      baseScreenNavigation.setPage(4);
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
