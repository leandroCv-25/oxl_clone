import 'package:flutter/material.dart';

class VendorTypeButton extends StatelessWidget {
  const VendorTypeButton(
      {super.key, required this.selected, this.onTap, required this.label});

  final bool selected;
  final Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: selected ? Theme.of(context).primaryColor : Colors.transparent,
          border: Border.all(
            color: selected
                ? Theme.of(context).primaryColor
                : Theme.of(context).secondaryHeaderColor,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: Theme.of(context).textTheme.button?.copyWith(
                color: selected ? Colors.white : Colors.black,
              ),
        ),
      ),
    );
  }
}
