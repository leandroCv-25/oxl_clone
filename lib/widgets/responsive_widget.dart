import 'dart:math';

import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget? screen4K;
  final Widget? laptopScreenLarge;
  final Widget? laptopScreen;
  final Widget? tabletScreen;
  final Widget? mobileScreenLarge;
  final Widget? mobileScreenMedium;
  final Widget mobileScreenSmall;

  const ResponsiveWidget({
    Key? key,
    this.screen4K,
    this.laptopScreenLarge,
    this.laptopScreen,
    this.tabletScreen,
    this.mobileScreenLarge,
    this.mobileScreenMedium,
    required this.mobileScreenSmall,
  }) : super(key: key);

  static bool isMobileScreenSmall(BuildContext context) {
    return MediaQuery.of(context).size.width < 375;
  }

  static bool isMobileScreenMedium(BuildContext context) {
    return MediaQuery.of(context).size.width < 425;
  }

  static bool isMobileScreenLarge(BuildContext context) {
    return MediaQuery.of(context).size.width < 720;
  }

  static bool isTableScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 1024;
  }

  static bool isLaptopScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 1440;
  }

  static bool isLaptopScreenLarge(BuildContext context) {
    return MediaQuery.of(context).size.width < 2560;
  }

  static bool isScreen4K(BuildContext context) {
    return MediaQuery.of(context).size.width >= 2560;
  }

  static double isLimitedOnMobileScreenLarge(BuildContext context) {
    return min(475, MediaQuery.of(context).size.width);
  }

  static double sizeWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 2560) {
          return screen4K ?? mobileScreenSmall;
        } else if (constraints.maxWidth >= 1440) {
          return laptopScreenLarge ?? mobileScreenSmall;
        } else if (constraints.maxWidth >= 1024) {
          return laptopScreen ?? mobileScreenSmall;
        } else if (constraints.maxWidth >= 720) {
          return tabletScreen ?? mobileScreenSmall;
        } else if (constraints.maxWidth >= 425) {
          return mobileScreenLarge ?? mobileScreenSmall;
        } else if (constraints.maxWidth >= 375) {
          return mobileScreenLarge ?? mobileScreenSmall;
        } else {
          return mobileScreenSmall;
        }
      },
    );
  }
}
