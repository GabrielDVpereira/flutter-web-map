import 'package:fltuter_web_map/core/core.dart';
import 'package:fltuter_web_map/features/map/presentation/navigation/route_path.dart';
import 'package:fltuter_web_map/features/map/presentation/screens/home_screen.dart';
import 'package:fltuter_web_map/features/map/presentation/screens/map_screen.dart';
import 'package:flutter/material.dart';

class RouteDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  bool show404 = false;
  String path = '';

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  void _goToMapScreen() {
    path = VoloMapScreen.routeName;
    notifyListeners();
  }

  @override
  RoutePath get currentConfiguration {
    if (path == VoloMapScreen.routeName) {
      return RoutePath.map();
    }
    if (show404) {
      return RoutePath.unknown();
    }

    return RoutePath.home();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: HomeScreen(onButtonTapped: _goToMapScreen),
          key: const ValueKey(HomeScreen.routeName),
        ),
        if (show404)
          const MaterialPage(
            child: UnkwonScreen(),
            key: ValueKey(UnkwonScreen.routeName),
          ),
        if (path == VoloMapScreen.routeName)
          const MaterialPage(
            child: VoloMapScreen(),
            key: ValueKey(VoloMapScreen.routeName),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          show404 = true;
          return false;
        }
        path = '';
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    if (configuration.isUnknown) {
      show404 = true;
      path = '';
      return;
    }

    if (configuration.isMapScreen) {
      show404 = false;
      path = VoloMapScreen.routeName;

      return;
    }

    show404 = false;
    path = HomeScreen.routeName;
  }
}
