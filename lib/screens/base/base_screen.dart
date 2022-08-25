import 'package:flutter/material.dart';
import 'package:olx_clone/providers/pages/page_provider.dart';
import 'package:olx_clone/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider(
        create: (context) => PageProvider(pageController),
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeScreen(),
            HomeScreen(),
          ],
        ),
      ),
    );
  }
}
