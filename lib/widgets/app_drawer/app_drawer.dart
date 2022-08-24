import 'package:flutter/material.dart';
import 'package:olx_clone/widgets/app_drawer/app_drawer_header.dart';

import 'page_section_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              const AppDrawerHeader(),
              PageSectionTile(
                  label: "Anuncios",
                  iconData: Icons.list,
                  highLighted: true,
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
