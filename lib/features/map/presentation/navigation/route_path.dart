import 'package:fltuter_web_map/features/map/presentation/screens/home_screen.dart';
import 'package:fltuter_web_map/features/map/presentation/screens/map_screen.dart';

class RoutePath {
  final String? currentRoute;
  final bool isUnknown;

  RoutePath.home()
      : currentRoute = HomeScreen.routeName,
        isUnknown = false;

  RoutePath.map()
      : currentRoute = VoloMapScreen.routeName,
        isUnknown = false;

  RoutePath.unknown()
      : currentRoute = null,
        isUnknown = true;

  bool get isHomeScreen => currentRoute == HomeScreen.routeName;
  bool get isMapScreen => currentRoute == VoloMapScreen.routeName;
}
