import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_clone/observables/base_screen_navigation/base_screen_navigation.dart';
import 'package:olx_clone/observables/favorite/favorite_store.dart';
import 'package:olx_clone/observables/home_store/home_store.dart';
import 'package:olx_clone/screens/base/base_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'observables/categories/categories_store.dart';
import 'observables/user_manager/user_manager.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  await Parse().initialize(
    dotenv.env['appId']!,
    dotenv.env['serverUrl']!,
    clientKey: dotenv.env['clientKey']!,
    autoSendSessionId: true,
    debug: true,
  );

  setUpLocators();

  runApp(const MyApp());
}

setUpLocators() {
  GetIt.I.registerSingleton(BaseScreenNavigation());
  GetIt.I.registerSingleton(UserManager());
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(CategoriesStore());
  GetIt.I.registerSingleton(FavoriteStore());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple,
        secondaryHeaderColor: Colors.orange,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18 * MediaQuery.textScaleFactorOf(context),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.orange,
        ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          titleTextStyle: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white),
        ),
      ),
      home: BaseScreen(),
    );
  }
}
