import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../connectivity_helper.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

@singleton
class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc._() : super(ConnectivityInitial()) {
    on<ConnectivityObserve>(_observe);
    on<ConnectivityNotify>(_notifyStatus);
  }

  static final ConnectivityBloc _instance = ConnectivityBloc._();

  factory ConnectivityBloc() => _instance;

  void _observe(event, emit) {
    ConnectivityHelper.observeNetwork();
  }

  void _notifyStatus(ConnectivityNotify event, emit) {
    event.isConnected
        ? emit(ConnectivitySuccess())
        : emit(ConnectivityFailure());
  }
}

// class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
//   ConnectivityBloc() : super(ConnectivityInitial()) {
//     on<ConnectivityObserve>((event, emit) {
//       ConnectivityHelper.observeNetwork();
//     });
//     on<ConnectivityNotify>((event, emit) {
//       event.isConnected
//           ? emit(ConnectivitySuccess())
//           : emit(ConnectivityFailure());
//     });
//   }

//   static final ConnectivityBloc _instance = ConnectivityBloc();

//   factory ConnectivityBloc() => _instance;

//   void _observe(event, emit) {
//     NetworkHelper.observeNetwork();
//   }

//   void _notifyStatus(NetworkNotify event, emit) {
//     event.isConnected ? emit(NetworkSuccess()) : emit(NetworkFailure());
//   }
// }
