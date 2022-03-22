import 'package:flutter/material.dart';
import 'package:werkama_flutter_setup/components/custom_title.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key, required this.textToShow}) : super(key: key);
  static const routeName = '/second_screen';
  final String textToShow;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second screen'),
        ),
        body: SafeArea(child: Center(child: CustomTitle(title: textToShow))));
  }
}
