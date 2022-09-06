import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/observables/zip_store/zip_store.dart';
import 'package:olx_clone/widgets/app_text_field.dart';

class ZipField extends StatelessWidget {
  ZipField({super.key});
  final ZipStore zipStore = ZipStore('');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Observer(builder: (context) {
          return AppTextField(
              prefix: const Icon(Icons.location_city),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
              errorText: zipStore.error,
              textInputType: TextInputType.number,
              onChanged: zipStore.setZip,
              enabled: !zipStore.loading);
        })
      ],
    );
  }
}
