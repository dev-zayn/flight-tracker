import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: BookmarkedFlightsRoute.page,
          path: '/bookmarked-flights',
        ),
      ];
}
