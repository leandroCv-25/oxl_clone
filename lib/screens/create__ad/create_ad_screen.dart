import 'package:flutter/material.dart';
import 'package:olx_clone/screens/create__ad/widgets/images_fields.dart';
import 'package:olx_clone/widgets/app_drawer/app_drawer.dart';

import '../../observables/create_ad_store/create_ad_store.dart';
import '../../widgets/app_text_field.dart';

class CreateAdScreen extends StatelessWidget {
  CreateAdScreen({Key? key}) : super(key: key);

  final CreateAdStore _createAdStore = CreateAdStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inserir Anúncio"),
      ),
      drawer: AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ImagesField(_createAdStore),
          AppTextField(
              title: "Título do anúncio*",
              hint: "Ex: Samsung S9 novo na caixa",
              textInputType: TextInputType.text,
              onChanged: (_) {},
              enabled: true),
          AppTextField(
            maxLines: 5,
            title: "Descrição*",
            hint:
                "Ex: Smartphone Samsung Galaxy S9 com 128gb de memória, com caixa, todos os cabos e sem marca de uso",
            textInputType: TextInputType.text,
            onChanged: (_) {},
            enabled: true,
          ),
          AppTextField(
            title: "Preço (R\$)",
            textInputType: const TextInputType.numberWithOptions(decimal: true),
            onChanged: (_) {},
            enabled: true,
          ),
        ],
      ),
    );
  }
}
