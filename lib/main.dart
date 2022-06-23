import 'package:flutter/material.dart';
import 'package:whatsap_clone/Routing/custom_page_route.dart';
import 'package:whatsap_clone/screens/home.dart';
import 'package:whatsap_clone/screens/mobile/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: (route) => onGenerateRoute(route),
    );
  }

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ProfileScreen.routeName:
        return CustomPageRouter(
          child: const ProfileScreen(),
          settings: settings,
        );
      case (HomeScreen.routeName):
        return CustomPageRouter(
          child: const HomeScreen(),
          settings: settings,
        );
      default:
        return CustomPageRouter(
          child: const HomeScreen(),
          settings: settings,
        );
    }
  }
}
