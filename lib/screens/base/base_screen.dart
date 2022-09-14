import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_clone/observables/base_screen_navigation/base_screen_navigation.dart';
import 'package:olx_clone/screens/create__ad/create_ad_screen.dart';
import 'package:olx_clone/screens/home/home_screen.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({Key? key}) : super(key: key);

  final PageController pageController = PageController();
  final BaseScreenNavigation baseScreenNavigation =
      GetIt.I<BaseScreenNavigation>();

  @override
  Widget build(BuildContext context) {
    reaction<int>((_) => baseScreenNavigation.page,
        (page) => pageController.jumpToPage(page));
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          const CreateAdScreen(),
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
