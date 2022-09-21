import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/screens/filter/widgets/price_field.dart';
import 'package:olx_clone/widgets/error_box.dart';

import '../../../observables/filter_store/filter_store.dart';

class PriceRangeField extends StatelessWidget {
  const PriceRangeField(this.filter, {super.key});

  final FilterStore filter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text('Preço',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Theme.of(context).primaryColor)),
        ),
        Row(
          children: [
            PriceField(
              label: 'Min',
              onChanged: filter.setMinPrice,
              initialValue: filter.minPrice,
            ),
            const SizedBox(width: 12),
            PriceField(
              label: 'Max',
              onChanged: filter.setMaxPrice,
              initialValue: filter.maxPrice,
            ),
          ],
        ),
        Observer(builder: (_) {
          return ErrorBox(
            message: filter.priceError,
          );
        }),
      ],
    );
  }
}
