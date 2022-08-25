import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:olx_clone/screens/login/widgets/or_divider.dart';
import 'package:olx_clone/widgets/app_icon_button/App_icon_button.dart';
import 'package:olx_clone/widgets/app_text_field/app_text_field.dart';
import 'package:olx_clone/widgets/responsive/responsive_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !kIsWeb
          ? AppBar(
              title: const Text("Entrar"),
            )
          : null,
      body: Center(
        child: SizedBox(
          width: ResponsiveWidget.isLimitedOnMobileScreenLarge(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      OrDivider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "E-mail",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 8),
                        child: AppTextField(
                          textInputType: TextInputType.emailAddress,
                          onChanged: (_) {},
                          enabled: true,
                          controller: _emailController,
                          prefix: const Icon(Icons.email),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Senha",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Esqueceu sua senha",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 8),
                        child: AppTextField(
                          textInputType: TextInputType.visiblePassword,
                          onChanged: (_) {},
                          enabled: true,
                          controller: _passwordController,
                          obscure: true,
                          prefix: const Icon(Icons.password),
                          suffix: AppIconButton(
                            radius: 32,
                            iconData: Icons.visibility,
                            onTap: () {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 32),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            height: 40,
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).secondaryHeaderColor,
                                ),
                                onPressed: () {},
                                child: Text(
                                  "ENTRAR",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: Colors.white),
                                )),
                          ),
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              "Não tem uma conta? ",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Cadastre-se",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
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
    );
  }
}
