import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/widgets/vendor_type_button.dart';

import '../../../observables/filter_store/filter_store.dart';

class VendorTypeField extends StatelessWidget {
  const VendorTypeField(this.filter, {super.key});

  final FilterStore filter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text('Tipo de anunciante',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: Theme.of(context).primaryColor)),
        ),
        Observer(builder: (_) {
          return Wrap(
            runSpacing: 4,
            children: [
              VendorTypeButton(
                selected: filter.isTypeParticular,
                label: 'Particular',
                onTap: () {
                  if (filter.isTypeParticular) {
                    if (filter.isTypeProfessional) {
                      filter.resetVendorType(vendorTypeParticular);
                    } else {
                      filter.selectVendorType(vendorTypeProfessional);
                    }
                  } else {
                    filter.setVendorType(vendorTypeParticular);
                  }
                },
              ),
              const SizedBox(width: 12),
              VendorTypeButton(
                label: "Profissional",
                selected: filter.isTypeProfessional,
                onTap: () {
                  if (filter.isTypeProfessional) {
                    if (filter.isTypeParticular) {
                      filter.resetVendorType(vendorTypeProfessional);
                    } else {
                      filter.selectVendorType(vendorTypeParticular);
                    }
                  } else {
                    filter.setVendorType(vendorTypeProfessional);
                  }
                },
              ),
            ],
          );
        }),
      ],
    );
  }
}
