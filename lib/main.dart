import 'package:flutter/material.dart';
import 'package:whatsap_clone/screens/chats_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ChatsScreen(),
    );
  }
}
