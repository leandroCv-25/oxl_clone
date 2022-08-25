import 'package:flutter/widgets.dart';

class PageProvider {
  final PageController _pageController;

  PageProvider(this._pageController);

  int _page = 0;

  int get page => _page;

  set page(int value) {
    if (value == _page) return;
    _page = value;
    _pageController.jumpToPage(value);
  }
}
