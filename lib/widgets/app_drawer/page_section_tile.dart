import 'package:flutter/material.dart';

class PageSectionTile extends StatelessWidget {
  const PageSectionTile(
      {Key? key,
      required this.label,
      required this.iconData,
      required this.onTap,
      required this.highLighted})
      : super(key: key);

  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highLighted;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: Theme.of(context).textTheme.button?.copyWith(
            color: highLighted ? Theme.of(context).secondaryHeaderColor : null),
      ),
      leading: Icon(iconData,
          color: highLighted
              ? Theme.of(context).primaryColor
              : Theme.of(context).iconTheme.color),
      onTap: onTap,
    );
  }
}
