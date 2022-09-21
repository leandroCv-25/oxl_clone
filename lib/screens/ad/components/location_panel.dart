import 'package:flutter/material.dart';

import '../../../models/ad.dart';

class LocationPanel extends StatelessWidget {
  const LocationPanel(this.ad, {super.key});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 12),
          child: Text(
            'Localização',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text('CEP'),
                  SizedBox(
                    height: 12,
                  ),
                  Text('Município'),
                  SizedBox(
                    height: 12,
                  ),
                  Text('Bairro'),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(ad.address.cep),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(ad.address.city.name),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(ad.address.district)
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
