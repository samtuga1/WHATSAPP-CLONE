import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsap_clone/constants/icons.dart';
import 'package:whatsap_clone/screens/mobile/mobile_chats_screen.dart';

import 'mobile_chats_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const MobileChatsScreen(),
    ];
    int currentScreenIndex = 0;
    void changedScreen(int nextScreenIndex) {
      currentScreenIndex = nextScreenIndex;
      print(currentScreenIndex);
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
        selectedItemColor: Colors.blue,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 20,
        unselectedItemColor: Colors.grey,
        onTap: (value) => changedScreen(value),
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
      body: screens[currentScreenIndex],
    );
  }
}
