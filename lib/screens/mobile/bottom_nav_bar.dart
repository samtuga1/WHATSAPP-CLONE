import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:whatsap_clone/constants/icons.dart';
import 'package:whatsap_clone/constants/themes.dart';
import 'package:whatsap_clone/providers/call_screen_provider.dart';
import 'package:whatsap_clone/providers/mobile/settings_provider.dart';
import 'package:whatsap_clone/screens/mobile/calls_screen.dart';
import 'package:whatsap_clone/screens/mobile/chats_screen.dart';
import 'package:whatsap_clone/screens/mobile/settings.dart';
import 'chats_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      backgroundColor: kBackgroundColor,
      tabBar: CupertinoTabBar(
        activeColor: Colors.blue,
        iconSize: 20,
        inactiveColor: Colors.grey,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(
            label: 'Status',
            icon: SizedBox(
              height: 30,
              child: FaIcon(kStatusIcon),
            ),
          ),
          BottomNavigationBarItem(
            label: 'Calls',
            icon: FaIcon(kCallIcon),
          ),
          BottomNavigationBarItem(
            label: 'Camera',
            icon: FaIcon(kCameraIcon),
          ),
          BottomNavigationBarItem(
            label: 'Chats',
            icon: FaIcon(
              kChatsIcon,
              size: 31.5,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: FaIcon(kSettingsIcon),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 3:
            return const MobileChatsScreen();
          case 4:
            return const MobileSettings();
          case 1:
            return ChangeNotifierProvider(
              create: (context) => CallScreenProvider(),
              child: const MobileCallScreen(),
            );
          default:
            return const MobileSettings();
        }
      },
    );
  }
}
