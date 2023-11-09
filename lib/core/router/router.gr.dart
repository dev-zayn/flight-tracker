// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flight_tracker/features/main_screen/presentation/pages/bookmarked_flights.dart'
    as _i1;
import 'package:flight_tracker/features/main_screen/presentation/pages/main_screen.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    BookmarkedFlightsRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BookmarkedFlightsPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BookmarkedFlightsPage]
class BookmarkedFlightsRoute extends _i3.PageRouteInfo<void> {
  const BookmarkedFlightsRoute({List<_i3.PageRouteInfo>? children})
      : super(
          BookmarkedFlightsRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarkedFlightsRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i3.PageRouteInfo<void> {
  const MainRoute({List<_i3.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
