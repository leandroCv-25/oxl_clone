import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/observables/base_screen_navigation/base_screen_navigation.dart';
import 'package:olx_clone/observables/filter_store/filter_store.dart';
import 'package:olx_clone/widgets/app_outlined_button.dart';
import 'package:olx_clone/widgets/app_text_field.dart';

import '../../observables/edit_account/edit_account_store.dart';
import '../../widgets/App_icon_button.dart';
import '../../widgets/vendor_type_button.dart';

class EditAccountScreen extends StatelessWidget {
  EditAccountScreen({super.key});

  final store = EditAccount();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Conta'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(builder: (_) {
                  return Wrap(
                    runSpacing: 4,
                    children: [
                      VendorTypeButton(
                        selected: store.isTypeParticular,
                        label: 'Particular',
                        onTap: () {
                          if (!store.isTypeParticular) {
                            store.setUserType(vendorTypeParticular);
                          }
                        },
                      ),
                      const SizedBox(width: 12),
                      VendorTypeButton(
                        label: "Profissional",
                        selected: store.isTypeProfessional,
                        onTap: () {
                          if (store.isTypeProfessional) {
                            store.setUserType(vendorTypeProfessional);
                          }
                        },
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 12),
                Observer(builder: (_) {
                  return AppTextField(
                    initialValue: store.name,
                    textInputType: TextInputType.name,
                    onChanged: store.setName,
                    enabled: !store.loading,
                    title: "Nome*",
                    errorText: store.nameError,
                  );
                }),
                const SizedBox(height: 8),
                Observer(builder: (_) {
                  return AppTextField(
                    initialValue: store.phone,
                    textInputType: TextInputType.phone,
                    onChanged: store.setPhone,
                    enabled: !store.loading,
                    title: "Telefone*",
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                    errorText: store.phoneError,
                  );
                }),
                const SizedBox(height: 8),
                Observer(builder: (_) {
                  return AppTextField(
                    textInputType: TextInputType.visiblePassword,
                    onChanged: store.setPass1,
                    enabled: !store.loading,
                    title: "Nova Senha",
                    obscure: store.obscure,
                    prefix: const Icon(Icons.password),
                    suffix: AppIconButton(
                      radius: 32,
                      iconData: store.obscure
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onTap: store.setObscure,
                    ),
                  );
                }),
                const SizedBox(height: 8),
                Observer(builder: (_) {
                  return AppTextField(
                    textInputType: TextInputType.visiblePassword,
                    onChanged: store.setPass2,
                    enabled: !store.loading,
                    title: "Confirmar Nova Senha",
                    errorText: store.passError,
                    obscure: store.obscure,
                    prefix: const Icon(Icons.password),
                    suffix: AppIconButton(
                      radius: 32,
                      iconData: store.obscure
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onTap: store.setObscure,
                    ),
                  );
                }),
                const SizedBox(height: 12),
                Observer(builder: (_) {
                  return SizedBox(
                    height: 40,
                    child: AppOutlinedButton(
                        onPressed: store.save,
                        enabled: store.isFormValid,
                        loading: store.loading,
                        textChild: 'Salvar'),
                  );
                }),
                const SizedBox(height: 8),
                SizedBox(
                  height: 40,
                  child: AppOutlinedButton(
                      color: Colors.red,
                      onPressed: () {
                        store.logout();

                        GetIt.I<BaseScreenNavigation>().setPage(0);
                        Navigator.of(context).pop();
                      },
                      enabled: store.isFormValid,
                      loading: store.loading,
                      textChild: 'Sair'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
