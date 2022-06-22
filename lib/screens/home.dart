import 'package:flutter/material.dart';
import 'package:whatsap_clone/responsive/responsive_layout.dart';
import 'package:whatsap_clone/screens/desktop/desktop_chats_screen.dart';
import 'package:whatsap_clone/screens/mobile/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileBody: BottomNavBar(),
      desktopBody: ChatsDesktopView(),
    );
  }
}
