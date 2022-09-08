import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/models/address.dart';
import 'package:olx_clone/observables/create_ad_store/create_ad_store.dart';
import 'package:olx_clone/observables/zip_store/zip_store.dart';
import 'package:olx_clone/widgets/app_text_field.dart';

class ZipField extends StatelessWidget {
  ZipField({super.key, required this.createAdStore})
      : zipStore = createAdStore.zipStore;

  final CreateAdStore createAdStore;
  final ZipStore zipStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Observer(builder: (context) {
          return AppTextField(
            title: "CEP:",
            prefix: const Icon(Icons.location_city),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter(),
            ],
            errorText: zipStore.error ?? createAdStore.addressError,
            textInputType: TextInputType.number,
            onChanged: zipStore.setZip,
            enabled: !zipStore.loading,
          );
        }),
        Observer(builder: (context) {
          if (zipStore.address == null && !zipStore.loading) {
            return Container();
          } else if (zipStore.loading) {
            return const LinearProgressIndicator(
              color: Colors.purple,
            );
          } else {
            Address address = zipStore.address!;
            return Container(
              padding: const EdgeInsets.all(8),
              color: Theme.of(context).primaryColor.withAlpha(180),
              child: Text(
                "Endereço: ${address.district}, ${address.city.name} - ${address.uf.initials}",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            );
          }
        })
      ],
    );
  }
}
