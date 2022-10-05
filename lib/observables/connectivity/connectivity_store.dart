import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_store.g.dart';

class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {
  _ConnectivityStore() {
    _setupListener();
  }

  StreamSubscription<ConnectivityResult>? subscription;

  void _setupListener() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi ||
          result == ConnectivityResult.ethernet) {
        setConnected(true);
      } else {
        setConnected(false);
      }
    });
  }

  @observable
  bool connected = true;

  @action
  void setConnected(bool value) => connected = value;

  dispose() {
    subscription!.cancel();
  }
}
