import 'package:flutter/material.dart';
import 'package:whatsap_clone/Routing/custom_page_route.dart';
import 'package:whatsap_clone/screens/home.dart';

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
      home: const HomeScreen(),
      onGenerateRoute: (route) => CustomPageRouter.onGenerateRoute(route),
    );
  }
}
