import 'package:flutter/material.dart';
import 'package:olx_clone/screens/home/home_screen.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const HomeScreen(),
          Container(
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}
