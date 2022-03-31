import 'package:flutter/material.dart';

import 'features/map/presentation/presentation.dart';

void main() {
  runApp(VoloApp());
}

class VoloApp extends StatelessWidget {
  VoloApp({Key? key}) : super(key: key);

  final _routeInformationParser = AppRouteInformationParser();
  final _routeDelegate = RouteDelegate();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: _routeInformationParser,
      routerDelegate: _routeDelegate,
    );
  }
}
