import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton(
      {super.key,
      required this.onPressed,
      required this.enabled,
      required this.loading,
      required this.textChild,
      this.color});

  final Function() onPressed;
  final bool enabled;
  final bool loading;
  final String textChild;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 40,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: color?.withAlpha(enabled ? 255 : 120) ??
                  Theme.of(context)
                      .secondaryHeaderColor
                      .withAlpha(enabled ? 255 : 120),
            ),
            onPressed: enabled ? onPressed : null,
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    textChild,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
