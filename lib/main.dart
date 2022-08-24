import 'package:flutter/material.dart';
import 'package:olx_clone/screens/base/base_screen.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  runApp(const MyApp());

  await dotenv.load(fileName: ".env");

  await Parse().initialize(dotenv.env['appId']!, dotenv.env['serverUrl']!,
      clientKey: dotenv.env['clientKey']!,
      autoSendSessionId: true,
      debug: true,
      coreStore: await CoreStoreSembastImp.getInstance());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Colors.purple,
          secondaryHeaderColor: Colors.orange),
      home: BaseScreen(),
    );
  }
}
