import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_clone/screens/create__ad/widgets/category_field.dart';
import 'package:olx_clone/screens/create__ad/widgets/hide_phone_field.dart';
import 'package:olx_clone/screens/create__ad/widgets/images_field.dart';
import 'package:olx_clone/widgets/app_drawer/app_drawer.dart';
import 'package:olx_clone/widgets/app_outlined_button.dart';
import 'package:olx_clone/widgets/error_box.dart';

import '../../observables/base_screen_navigation/base_screen_navigation.dart';
import '../../observables/create_ad_store/create_ad_store.dart';
import '../../widgets/app_text_field.dart';
import 'widgets/zip_field.dart';

class CreateAdScreen extends StatefulWidget {
  const CreateAdScreen({Key? key}) : super(key: key);

  @override
  State<CreateAdScreen> createState() => _CreateAdScreenState();
}

class _CreateAdScreenState extends State<CreateAdScreen> {
  final CreateAdStore _createAdStore = CreateAdStore();

  @override
  void initState() {
    super.initState();
    when((_) => _createAdStore.savedAd, () {
      // if (editing) {
      //   Navigator.of(context).pop(true);
      // } else {
      GetIt.I<BaseScreenNavigation>().setPage(0);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inserir Anúncio"),
      ),
      drawer: AppDrawer(),
      body: Observer(builder: (context) {
        if (_createAdStore.loading) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'Salvando Anúncio',
                    style: TextStyle(fontSize: 18, color: Colors.purple),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.purple),
                  )
                ],
              ),
            ),
          );
        } else {
          return ListView(
            padding: const EdgeInsets.all(8),
            children: [
              ImagesField(_createAdStore),
              Observer(builder: (context) {
                return AppTextField(
                    errorText: _createAdStore.titleError,
                    title: "Título do anúncio*",
                    hint: "Ex: Samsung S9 novo na caixa",
                    textInputType: TextInputType.text,
                    onChanged: _createAdStore.setTitle,
                    enabled: true);
              }),
              Observer(builder: (context) {
                return AppTextField(
                  errorText: _createAdStore.descriptionError,
                  maxLines: 5,
                  title: "Descrição*",
                  hint:
                      "Ex: Smartphone Samsung Galaxy S9 com 128gb de memória, com caixa, todos os cabos e sem marca de uso",
                  textInputType: TextInputType.text,
                  onChanged: _createAdStore.setDescription,
                  enabled: true,
                );
              }),
              CategoryField(createAdStore: _createAdStore),
              Observer(builder: (context) {
                return AppTextField(
                  errorText: _createAdStore.priceError,
                  title: "Preço (R\$)",
                  textInputType:
                      const TextInputType.numberWithOptions(decimal: true),
                  onChanged: _createAdStore.setPrice,
                  enabled: true,
                );
              }),
              ZipField(
                createAdStore: _createAdStore,
              ),
              HidePhoneField(createAdStore: _createAdStore),
              Observer(builder: (context) {
                return ErrorBox(message: _createAdStore.error);
              }),
              Observer(builder: (context) {
                return GestureDetector(
                  onTap: _createAdStore.formValid
                      ? null
                      : _createAdStore.setShowErrors,
                  child: AppOutlinedButton(
                    onPressed: _createAdStore.send,
                    enabled: _createAdStore.formValid,
                    loading: _createAdStore.loading,
                    textChild: 'Enviar',
                  ),
                );
              }),
            ],
          );
        }
      }),
    );
  }
}
