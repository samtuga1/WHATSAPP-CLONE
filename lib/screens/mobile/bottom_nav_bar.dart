import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:whatsap_clone/constants/icons.dart';
import 'package:whatsap_clone/constants/themes.dart';
import 'package:whatsap_clone/providers/mobile/settings_provider.dart';
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
    // List<Widget> screens = [
    //   const MobileChatsScreen(),
    //   ChangeNotifierProvider<MobileSettingSProvider>(
    //     create: (context) => MobileSettingSProvider(),
    //     child: MobileSettings(),
    //   ),
    // ];
    // int currentScreenIndex = 1;

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
              icon: FaIcon(kChatsIcon),
            ),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: FaIcon(kSettingsIcon),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return const MobileChatsScreen();
            case 1:
              return const MobileSettings();
            case 3:
            default:
              return const MobileSettings();
          }
        });
  }
}
