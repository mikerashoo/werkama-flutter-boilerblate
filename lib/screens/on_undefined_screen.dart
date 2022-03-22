import 'package:flutter/material.dart';

class OnUndefinedScreen extends StatelessWidget {
  const OnUndefinedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const SafeArea(child: Center(child: Text('Unknown route called'))),
    );
  }
}
