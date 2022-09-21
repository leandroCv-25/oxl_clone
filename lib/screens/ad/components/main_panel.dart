import 'package:flutter/material.dart';
import 'package:olx_clone/helpers/extensions.dart';

import '../../../models/ad.dart';

class MainPanel extends StatelessWidget {
  const MainPanel(this.ad, {super.key});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 14),
          child: Text(
            ad.price.formattedMoney(),
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.grey),
          ),
        ),
        Text(
          ad.title,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 18),
          child: Text(
            'Publicado em ${ad.created?.formattedDate()}',
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
