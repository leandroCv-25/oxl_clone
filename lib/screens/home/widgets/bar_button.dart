import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  const BarButton(
      {super.key, required this.label, required this.decoration, this.onTap});

  final String label;
  final BoxDecoration decoration;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: decoration,
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }
}
