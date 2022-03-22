import 'package:flutter/material.dart';
import 'package:werkama_flutter_setup/components/custom_title.dart';
import 'package:werkama_flutter_setup/utils/constants.dart' as constants;

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);
  static const routeName = '/second_screen';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
            child: Center(child: CustomTitle(title: constants.appName))));
  }
}
