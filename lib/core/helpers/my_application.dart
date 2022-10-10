import 'package:connectivity_plus/connectivity_plus.dart';

class MyApplication {
  static Future<bool> checkConnection() async {
    ConnectivityResult connectivityResult;

    connectivityResult = await (Connectivity().checkConnectivity());

    {
      return connectivityResult == ConnectivityResult.none ? false : true;
    }
  }
}
