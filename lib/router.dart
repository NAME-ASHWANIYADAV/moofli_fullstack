import 'package:flutter/material.dart';
import 'package:moofli_fullstack/login-signup%20pages/loginpg.dart';
import 'package:moofli_fullstack/screens/home.dart';


Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {

      case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );


     case home_page.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const  home_page(),
      );

     default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}