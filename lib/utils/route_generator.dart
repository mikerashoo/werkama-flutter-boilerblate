import 'package:flutter/material.dart';
import 'package:werkama_flutter_setup/screens/home_page_screen.dart';
import 'package:werkama_flutter_setup/screens/on_undefined_screen.dart';
import 'package:werkama_flutter_setup/screens/second_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MyHomePage());
      case SecondScreen.routeName:
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => SecondScreen(
                    textToShow: args,
                  ));
        }
        return onUnkownRoute();
      default:
        return onUnkownRoute();
    }
  }

  static Route<dynamic> onUnkownRoute() {
    return MaterialPageRoute(builder: (_) => const OnUndefinedScreen());
  }
}
