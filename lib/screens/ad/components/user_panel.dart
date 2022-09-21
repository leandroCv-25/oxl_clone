import 'package:flutter/material.dart';

import '../../../models/ad.dart';
import '../../../helpers/extensions.dart';

class UserPanel extends StatelessWidget {
  const UserPanel(this.ad, {super.key});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 18),
          child: Text(
            'Anunciante',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: Colors.grey),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                ad.user.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(
                'Na XLO desde ${ad.user.createdAt?.formattedDate()}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.grey),
              )
            ],
          ),
        ),
      ],
    );
  }
}
