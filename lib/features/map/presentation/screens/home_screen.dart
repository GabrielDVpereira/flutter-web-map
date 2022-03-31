import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '';
  final VoidCallback onButtonTapped;

  const HomeScreen({
    Key? key,
    required this.onButtonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VOLO WEB POC'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: onButtonTapped,
          child: const Text('Go to map'),
        ),
      ),
    );
  }
}
