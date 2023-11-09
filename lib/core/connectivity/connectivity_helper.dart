import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flight_tracker/injectable_config.dart';

import 'bloc/connectivity_bloc.dart';

class ConnectivityHelper {
  static void observeNetwork() async {
    final connectivityBloc = getIt<ConnectivityBloc>();

    // first time check
    final connectivityResult = await (Connectivity().checkConnectivity());
    if ([
      ConnectivityResult.mobile,
      ConnectivityResult.wifi,
      ConnectivityResult.ethernet,
      ConnectivityResult.vpn,
    ].contains(connectivityResult)) {
      connectivityBloc.add(const ConnectivityNotify(isConnected: true));
    } else {
      connectivityBloc.add(const ConnectivityNotify());
    }

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if ([
        ConnectivityResult.mobile,
        ConnectivityResult.wifi,
        ConnectivityResult.ethernet,
        ConnectivityResult.vpn,
      ].contains(connectivityResult)) {
        connectivityBloc.add(const ConnectivityNotify(isConnected: true));
      } else {
        connectivityBloc.add(const ConnectivityNotify());
      }
    });
  }
}
