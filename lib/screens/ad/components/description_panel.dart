import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../models/ad.dart';

class DescriptionPanel extends StatelessWidget {
  const DescriptionPanel(this.ad, {super.key});

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            'Descrição',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: ReadMoreText(
            ad.description,
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Ver descrição completa',
            trimExpandedText: ' ...menos',
            colorClickableText: Theme.of(context).primaryColor,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
