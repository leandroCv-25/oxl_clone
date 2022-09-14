import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../observables/filter_store/filter_store.dart';

class OrderByField extends StatelessWidget {
  const OrderByField(this.filter);

  final FilterStore filter;

  @override
  Widget build(BuildContext context) {
    Widget buildOption(String title, OrderBy option) {
      return GestureDetector(
        onTap: () {
          filter.setOrderBy(option);
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: filter.orderBy == option
                ? Theme.of(context).primaryColor
                : Colors.transparent,
            border: Border.all(
              color: filter.orderBy == option
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).secondaryHeaderColor,
            ),
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.button?.copyWith(
                  color: filter.orderBy == option ? Colors.white : Colors.black,
                ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text('Ordernar por',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Theme.of(context).primaryColor)),
        ),
        Observer(builder: (_) {
          return Row(
            children: [
              buildOption('Data', OrderBy.date),
              const SizedBox(width: 12),
              buildOption('Preço', OrderBy.price),
            ],
          );
        }),
      ],
    );
  }
}
