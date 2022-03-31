import 'package:flutter/material.dart';

class UnkwonScreen extends StatelessWidget {
  static const String routeName = '404';

  const UnkwonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('No Page Found'),
      ),
    );
  }
}
