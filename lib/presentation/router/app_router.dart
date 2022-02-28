import 'package:flutter/material.dart';
import 'package:workspace/presentation/views/home_screen.dart';
import 'package:workspace/presentation/views/login_screen.dart';
import 'package:workspace/presentation/views/user_intro.dart';

Route? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case UserIntro.id:
      return MaterialPageRoute(builder: (context) => const UserIntro());
    case LoginScreen.id:
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    case HomeScreen.id:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    default:
      return null;
  }
}
