import 'package:flight_tracker/core/constant/responsive.dart';
import 'package:flight_tracker/core/time.dart';
import 'package:flight_tracker/core/toast.dart';
import 'package:flight_tracker/features/_components/loading_widget.dart';
import 'package:flight_tracker/features/main_screen/presentation/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injectable_config.dart';
import 'flight_card.dart';

class PlanesSheet extends StatelessWidget {
  const PlanesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    MainBloc bloc = getIt<MainBloc>();
    return SizedBox(
      height: Responsive.screenHeight(context) * .8,
      child: BlocConsumer<MainBloc, MainState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is GetAirplanesError) {
            showToastFlutter(state.message);
          }
        },
        builder: (context, state) {
          return (state is GetAirplanesLoading)
              ? const LoadingWidget()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: bloc.searchController.text.isNotEmpty
                      ? bloc.searchResualt.length
                      : bloc.airplanes.length,
                  itemBuilder: (context, index) {
                    return FlightCard(
                      airplane: bloc.searchController.text.isNotEmpty
                          ? bloc.searchResualt[index]
                          : bloc.airplanes[index],
                    );
                  },
                );
        },
      ),
    );
  }

// void scheduleNotification() async {
  //   var notification = OSCreateNotification(
  //     playerIds: ["DEVICE_PLAYER_ID"],
  //     content: "Your notification content",
  //     sendAfter: DateTime.now().add(Duration(minutes: 10)),
  //   );
  //   await OneSignal.Notifications.displayNotification();
  // }
}

class DateWidget extends StatelessWidget {
  final String title;
  final DateTime? dateTime;
  const DateWidget({super.key, required this.title, this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
        const SizedBox(height: 3),
        SizedBox(
          width: Responsive.screenWidth(context) * .4,
          child: Text(
            dateTime != null
                ? AppDateUtils.yyyyMMddHHmmssFormat(dateTime)
                : 'NA',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
