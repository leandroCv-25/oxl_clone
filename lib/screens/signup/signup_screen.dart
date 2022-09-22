import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:olx_clone/observables/sign_up/sign_up_store.dart';
import 'package:olx_clone/screens/login/login_screen.dart';
import 'package:olx_clone/screens/signup/widgets/pass_widget.dart';
import 'package:olx_clone/widgets/app_outlined_button.dart';
import 'package:olx_clone/widgets/error_box.dart';
import 'package:olx_clone/widgets/or_divider.dart';
import 'package:olx_clone/widgets/App_icon_button.dart';
import 'package:olx_clone/widgets/app_text_field.dart';
import 'package:olx_clone/widgets/responsive_widget.dart';

import '../../observables/user_manager/user_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpStore = SignUpStore();

  final UserManager _userManager = GetIt.I<UserManager>();

  @override
  void initState() {
    super.initState();
    when((_) => _userManager.isLoggedIn, () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb
          ? AppBar(
              title: const Text("Cadastrar"),
            )
          : null,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: ResponsiveWidget.isLimitedOnMobileScreenLarge(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  margin: EdgeInsets.zero,
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const OrDivider(),
                        Observer(builder: (context) {
                          return AppTextField(
                            title: "Apelido",
                            subtitle:
                                const Text("Como aparecerá em seus anúncios"),
                            hint: "Exemplo: João S.",
                            textInputType: TextInputType.name,
                            onChanged: signUpStore.setName,
                            enabled: !signUpStore.loading,
                            errorText: signUpStore.nameError,
                          );
                        }),
                        Observer(builder: (context) {
                          return AppTextField(
                            title: "E-mail",
                            textInputType: TextInputType.emailAddress,
                            onChanged: signUpStore.setEmail,
                            enabled: !signUpStore.loading,
                            errorText: signUpStore.emailError,
                            prefix: const Icon(Icons.email),
                          );
                        }),
                        Observer(builder: (context) {
                          return Column(
                            children: [
                              AppTextField(
                                onChanged: signUpStore.setPhone,
                                title: "Celular",
                                errorText: signUpStore.phoneError,
                                subtitle: const Text('Proteja sua conta'),
                                textInputType: TextInputType.phone,
                                enabled: !signUpStore.loading,
                                prefix: const Icon(Icons.phone),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  TelefoneInputFormatter()
                                ],
                              ),
                            ],
                          );
                        }),
                        Observer(builder: (context) {
                          return Column(
                            children: [
                              AppTextField(
                                onChanged: signUpStore.setPass,
                                title: "Senha",
                                errorText: signUpStore.passError,
                                subtitle: const Text(
                                    "Use letras, números e caracteres especiais"),
                                textInputType: TextInputType.visiblePassword,
                                enabled: !signUpStore.loading,
                                obscure: signUpStore.obscure,
                                prefix: const Icon(Icons.password),
                                suffix: AppIconButton(
                                  radius: 32,
                                  iconData: signUpStore.obscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  onTap: signUpStore.setObscure,
                                ),
                              ),
                              PassWidget(
                                grade: signUpStore.passStrenghGrade,
                              )
                            ],
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 32),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              height: 60,
                              child: Observer(builder: (context) {
                                return AppOutlinedButton(
                                  onPressed: () {
                                    signUpStore.signUp();
                                  },
                                  enabled: signUpStore.formValid,
                                  loading: signUpStore.loading,
                                  textChild: "Cadastra-se",
                                );
                              }),
                            ),
                          ),
                        ),
                        Observer(builder: (_) {
                          return ErrorBox(
                            message: signUpStore.error,
                          );
                        }),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 15),
                          child: Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Text(
                                "Já tem uma conta? ",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Entrar",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          color: Colors.blue,
                                          decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
