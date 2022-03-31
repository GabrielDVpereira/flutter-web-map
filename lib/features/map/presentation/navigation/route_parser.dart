import 'package:fltuter_web_map/core/core.dart';
import 'package:fltuter_web_map/features/map/presentation/navigation/route_path.dart';
import 'package:fltuter_web_map/features/map/presentation/screens/home_screen.dart';
import 'package:fltuter_web_map/features/map/presentation/screens/map_screen.dart';
import 'package:flutter/material.dart';

class AppRouteInformationParser extends RouteInformationParser<RoutePath> {
  @override
  Future<RoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    if (routeInformation.location == null) return RoutePath.unknown();

    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) return RoutePath.home();

    if (uri.pathSegments.first == VoloMapScreen.routeName) {
      return RoutePath.map();
    }

    return RoutePath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(RoutePath configuration) {
    if (configuration.isHomeScreen) {
      return const RouteInformation(location: '/${HomeScreen.routeName}');
    }
    if (configuration.isMapScreen) {
      return const RouteInformation(location: '/${VoloMapScreen.routeName}');
    }
    if (configuration.isUnknown) {
      return const RouteInformation(location: '/${UnkwonScreen.routeName}');
    }
    return null;
  }
}
