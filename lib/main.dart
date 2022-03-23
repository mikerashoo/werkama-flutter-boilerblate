import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:werkama_flutter_setup/providers/app_provider.dart';
import 'package:werkama_flutter_setup/screens/on_undefined_screen.dart';
import 'package:werkama_flutter_setup/utils/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>(create: (_) => AppProvider())
      ],
      child: MaterialApp(
        title: 'Werkama Flutter',
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (_) => const OnUndefinedScreen()),
      ),
    );
  }
}
