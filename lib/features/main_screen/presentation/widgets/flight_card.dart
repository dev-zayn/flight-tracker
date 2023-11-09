import 'package:flight_tracker/core/constant/responsive.dart';
import 'package:flight_tracker/core/theme/colors.dart';
import 'package:flight_tracker/features/main_screen/domain/entities/ariplane_entity.dart';
import 'package:flight_tracker/injectable_config.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../../../core/time.dart';
import '../bloc/main_bloc.dart';
import 'planes_sheet.dart';
import 'ticket_clipper.dart';

class FlightCard extends StatelessWidget {
  final AirPlaneEntity airplane;
  const FlightCard({super.key, required this.airplane});

  @override
  Widget build(BuildContext context) {
    MainBloc mainBloc = getIt<MainBloc>();
    return ClipPath(
      clipper: CustomTicketShape(),
      child: Container(
        padding: const EdgeInsets.all(7),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kcWhite,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  airplane.flightNumber ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: Responsive.screenWidth(context) * .4,
                    child: Text(
                      airplane.departure?.airport ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Transform.rotate(
                    angle: 90 * 3.14 / 180,
                    child: const Icon(
                      Icons.local_airport_outlined,
                      color: kcGreen,
                      size: 18,
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: Responsive.screenWidth(context) * .4,
                    child: Text(
                      airplane.arrival?.airport ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          sendNotificationToAllDevices(airplane);
                          mainBloc.add(BookmarkAirplanesEvent(airplane));
                        },
                        icon: Icon(mainBloc.bookmarked.contains(airplane)
                            ? Icons.bookmark
                            : Icons.bookmark_border)),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: airplane.flightStatus == 'landed'
                            ? kcSuccess
                            : airplane.flightStatus == 'scheduled'
                                ? kcYellow
                                : airplane.flightStatus == 'active'
                                    ? kcPrimary
                                    : kcRed,
                      ),
                      child: Text(
                        airplane.flightStatus ?? '',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kcYellow.withOpacity(0.2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      children: [
                        DateWidget(
                          title: 'Actual-time:',
                          dateTime: airplane.departure?.actualTime,
                        ),
                        const SizedBox(height: 5),
                        DateWidget(
                          title: 'Estimated-time:',
                          dateTime: airplane.departure?.estimatedTime,
                        ),
                        const SizedBox(height: 5),
                        DateWidget(
                          title: 'Scheduled-time:',
                          dateTime: airplane.departure?.scheduledTime,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DateWidget(
                          title: 'Actual-time:',
                          dateTime: airplane.departure?.actualTime,
                        ),
                        const SizedBox(height: 5),
                        DateWidget(
                          title: 'Estimated-time:',
                          dateTime: airplane.departure?.estimatedTime,
                        ),
                        const SizedBox(height: 5),
                        DateWidget(
                          title: 'Scheduled-time:',
                          dateTime: airplane.departure?.scheduledTime,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendNotificationToAllDevices(AirPlaneEntity airPlaneEntity) async {
    final status = await OneSignal.shared.getDeviceState();
    final String? osUserID = status?.userId;
    // final userID = osUserID.toString();
    // print(
    //     ' AppDateUtils is ${AppDateUtils.yyyyMMddHHmmssFormat(airplane.departure?.scheduledTime)}');
    var notification = OSCreateNotification(
      content: "Your flight ${airplane.flightNumber} content",
      heading: "Your notification heading",
      playerIds: [
        osUserID!,
      ],
      // sendAfter: DateTime.now(),
      delayedOption: OSCreateNotificationDelayOption.timezone,
      // deliveryTimeOfDay: "2023-11-09 02:57",
      // deliveryTimeOfDay: "2023-11-09 02:57",
      deliveryTimeOfDay:
          AppDateUtils.yyyyMMddHHmmssFormat(airplane.departure?.scheduledTime),
      // sendAfter: DateTime.now(),
    );
    await OneSignal.shared.postNotification(notification);
  }
}
