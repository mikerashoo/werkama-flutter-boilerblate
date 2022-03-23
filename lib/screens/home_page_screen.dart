import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:werkama_flutter_setup/components/custom_title.dart';
import 'package:werkama_flutter_setup/providers/app_provider.dart';
import 'package:werkama_flutter_setup/screens/second_screen.dart';
import 'package:werkama_flutter_setup/utils/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(APP_NAME),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CustomTitle(
              title: 'Home Screen',
            ),
            Consumer<AppProvider>(
              builder: (context, appProvider, _) => CustomTitle(
                  title:
                      'Users fetched from server : ${appProvider.userCount}'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, SecondScreen.routeName,
                      arguments: "Hello from homescreen++");
                },
                child: const Text('Go to next screen'))
          ],
        ),
      ),
    );
  }
}
