import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/screens/signup/signup_screen.dart';
import 'package:olx_clone/widgets/or_divider.dart';
import 'package:olx_clone/widgets/App_icon_button.dart';
import 'package:olx_clone/widgets/app_text_field.dart';
import 'package:olx_clone/widgets/responsive_widget.dart';

import '../../observables/log_in/log_in_store.dart';
import '../../observables/user_manager/user_manager.dart';
import '../../widgets/error_box.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final logInStore = LogInStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb
          ? AppBar(
              title: const Text("Entrar"),
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
                            title: "E-mail",
                            textInputType: TextInputType.emailAddress,
                            onChanged: logInStore.setEmail,
                            enabled: !logInStore.loading,
                            errorText: logInStore.emailError,
                            prefix: const Icon(Icons.email),
                          );
                        }),
                        Observer(builder: (context) {
                          return AppTextField(
                            title: "Senha",
                            subtitle: GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Esqueceu sua senha",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline),
                              ),
                            ),
                            textInputType: TextInputType.visiblePassword,
                            onChanged: logInStore.setPass,
                            enabled: !logInStore.loading,
                            obscure: logInStore.obscure,
                            errorText: logInStore.passError,
                            prefix: const Icon(Icons.password),
                            suffix: AppIconButton(
                              radius: 32,
                              iconData: logInStore.obscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              onTap: logInStore.setObscure,
                            ),
                          );
                        }),
                        Observer(builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 32),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                height: 40,
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: Theme.of(context)
                                        .secondaryHeaderColor
                                        .withAlpha(
                                            logInStore.formValid ? 255 : 120),
                                  ),
                                  onPressed: logInStore.formValid
                                      ? () {
                                          logInStore.logIn();
                                          if (GetIt.I<UserManager>().isLoggedIn) {
                                            Navigator.pop(context);
                                          }
                                        }
                                      : null,
                                  child: logInStore.loading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text(
                                          "Entrar",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.copyWith(color: Colors.white),
                                        ),
                                ),
                              ),
                            ),
                          );
                        }),
                        Observer(builder: (_) {
                          return ErrorBox(
                            message: logInStore.error,
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
                                "Não tem uma conta? ",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => SignUpScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Cadastre-se",
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
