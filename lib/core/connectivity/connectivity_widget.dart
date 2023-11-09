import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injectable_config.dart';
import 'bloc/connectivity_bloc.dart';

class ConnectivityWidget extends StatefulWidget {
  final Widget child;
  const ConnectivityWidget({super.key, required this.child});

  @override
  State<ConnectivityWidget> createState() => _ConnectivityWidgetState();
}

class _ConnectivityWidgetState extends State<ConnectivityWidget> {
  final connectivityBloc = getIt<ConnectivityBloc>();

  @override
  void initState() {
    connectivityBloc.add(ConnectivityObserve());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      bloc: connectivityBloc,
      builder: (context, state) {
        if (state is ConnectivityFailure) {
          return const Material(
              child: Center(child: Text('No Internet Connection')));
        } else if (state is ConnectivitySuccess) {
          return widget.child;
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
