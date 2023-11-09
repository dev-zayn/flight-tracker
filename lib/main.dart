import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import 'core/router/router.dart';
import 'core/theme/colors.dart';
import 'core/theme/theme.dart';
import 'features/_components/loading_widget.dart';
import 'injectable_config.dart';

const oneSignalAppId = '6be0cccc-a154-4743-b82c-3da1f94488d7';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  OneSignal.shared.setAppId("6be0cccc-a154-4743-b82c-3da1f94488d7");
  OneSignal.shared.setNotificationWillShowInForegroundHandler(
      (OSNotificationReceivedEvent event) {
    event.complete(event.notification);
  });
  Permission.notification.request();
  runApp(const FlightApp());
}

final appRouter = AppRouter();

class FlightApp extends StatelessWidget {
  const FlightApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: const LoadingWidget(),
      overlayColor: kcWhite.withOpacity(0.5),
      child: MaterialApp.router(
          title: 'Flight App',
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.config(),
          builder: (context, child) => ResponsiveBreakpoints.builder(
                breakpoints: [
                  const Breakpoint(start: 0, end: 450, name: MOBILE),
                  const Breakpoint(start: 451, end: 1024, name: TABLET),
                  const Breakpoint(start: 1025, end: 1920, name: DESKTOP),
                  const Breakpoint(
                      start: 1921, end: double.infinity, name: '4K'),
                ],
                child: child!,
              )),
    );
  }
}
