import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/screens/filter/widgets/vendor_type_field.dart';

import '../../observables/filter_store/filter_store.dart';
import '../../observables/home_store/home_store.dart';
import 'widgets/order_by_field.dart';
import 'widgets/price_range_field.dart';

class FilterScreen extends StatelessWidget {
  final FilterStore filter = GetIt.I<HomeStore>().clonedFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtrar Busca'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            OrderByField(filter),
            PriceRangeField(filter),
            VendorTypeField(filter),
            Observer(builder: (_) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).secondaryHeaderColor,
                    disabledBackgroundColor:
                        Theme.of(context).secondaryHeaderColor.withAlpha(120),
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: filter.isFormValid
                      ? () {
                          filter.save();
                          Navigator.of(context).pop();
                        }
                      : null,
                  child: const Text(
                    'FILTRAR',
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
