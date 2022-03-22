import 'package:flutter/material.dart';
import 'package:werkama_flutter_setup/components/custom_title.dart';
import 'package:werkama_flutter_setup/screens/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Werkama Flutter', initialRoute: '/', routes: {
      '/': ((context) => MyHomePage(title: 'Home Page')),
      SecondScreen.routeName: ((context) => SecondScreen()),
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CustomTitle(
              title: 'Home Screen',
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, SecondScreen.routeName);
                },
                child: const Text('Go to next screen'))
          ],
        ),
      ),
    );
  }
}
