import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_clone/observables/base_screen_navigation/base_screen_navigation.dart';
import 'package:olx_clone/screens/account/acount_screen.dart';
import 'package:olx_clone/screens/create__ad/create_ad_screen.dart';
import 'package:olx_clone/screens/favorites/favorites_screen.dart';
import 'package:olx_clone/screens/home/home_screen.dart';

import '../../observables/connectivity/connectivity_store.dart';
import '../offline/offline_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  final BaseScreenNavigation baseScreenNavigation =
      GetIt.I<BaseScreenNavigation>();

  final ConnectivityStore connectivityStore = GetIt.I<ConnectivityStore>();

  @override
  void initState() {
    super.initState();

    autorun((_) {
      
      if (!connectivityStore.connected) {
        Future.delayed(const Duration(milliseconds: 50)).then((value) {
          showDialog(context: context, builder: (_) => OfflineScreen());
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    reaction<int>((_) => baseScreenNavigation.page,
        (page) => pageController.jumpToPage(page));
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeScreen(),
          const CreateAdScreen(),
          const HomeScreen(),
          FavoritesScreen(),
          const AccountScreen(),
        ],
      ),
    );
  }
}
