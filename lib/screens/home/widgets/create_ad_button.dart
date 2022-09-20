import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/widgets/app_outlined_button.dart';

import '../../../observables/base_screen_navigation/base_screen_navigation.dart';

class CreateAdButton extends StatefulWidget {
  const CreateAdButton(this.scrollController, {super.key});

  final ScrollController scrollController;

  @override
  State<CreateAdButton> createState() => _CreateAdButtonState();
}

class _CreateAdButtonState extends State<CreateAdButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> buttonAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    buttonAnimation = Tween<double>(begin: 0, end: 66).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.4, 0.6),
      ),
    );

    widget.scrollController.addListener(scrollChanged);
  }

  void scrollChanged() {
    final s = widget.scrollController.position;
    if (s.userScrollDirection == ScrollDirection.forward) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: buttonAnimation,
      builder: (_, __) {
        return FractionallySizedBox(
          widthFactor: 0.6,
          child: Container(
            height: 50,
            margin: EdgeInsets.only(
              bottom: buttonAnimation.value,
            ),
            child: AppOutlinedButton(
              onPressed: () {
                GetIt.I<BaseScreenNavigation>().setPage(1);
              },
              enabled: true,
              loading: false,
              textChild: 'Anunciar agora',
            ),
          ),
        );
      },
    );
  }
}
