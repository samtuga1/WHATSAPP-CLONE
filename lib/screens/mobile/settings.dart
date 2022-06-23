import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsap_clone/constants/icons.dart';
import 'package:whatsap_clone/constants/themes.dart';
import '../../widgets/option_selector.dart';

class MobileSettings extends StatelessWidget {
  const MobileSettings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            elevation: 0,
            backgroundColor: kBackgroundColor,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: const Text(
              'Settings',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white60,
              border: Border.all(color: Colors.grey, width: 0.2),
            ),
            width: double.infinity,
            height: 85,
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Ask Me',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Available',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                  backgroundColor: kBackgroundColor,
                  child: FaIcon(
                    kQRcodeIcon,
                    size: 22,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8.5),
            decoration: BoxDecoration(
              color: Colors.white60,
              border: Border.all(color: Colors.grey, width: 0.5),
            ),
            margin: const EdgeInsets.only(top: 37),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                OptionSelector(
                  icon: kStarIcon,
                  title: 'Starred Messages',
                  iconContainerColor: Color(0xFFECC729),
                ),
                Divider(
                  indent: 50,
                ),
                OptionSelector(
                  icon: kLaptopIcon,
                  title: 'Linked Devices',
                  iconContainerColor: Colors.green,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8.5),
            decoration: BoxDecoration(
              color: Colors.white60,
              border: Border.all(color: Colors.grey, width: 0.5),
            ),
            margin: const EdgeInsets.only(top: 37),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const OptionSelector(
                  icon: kKeyIcon,
                  title: 'Account',
                  iconContainerColor: Colors.blueAccent,
                ),
                const Divider(
                  indent: 50,
                ),
                const OptionSelector(
                  icon: kWhatsapIcon,
                  title: 'Chats',
                  iconContainerColor: Colors.green,
                ),
                const Divider(
                  indent: 50,
                ),
                OptionSelector(
                  alternateIcon: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      'assets/icons/notification.png',
                      color: Colors.white,
                    ),
                  ),
                  title: 'Notifications',
                  iconContainerColor: Colors.red,
                ),
                const Divider(
                  indent: 50,
                ),
                const OptionSelector(
                  icon: kArrowUpArrowDown,
                  title: 'Storage and Data',
                  iconContainerColor: Colors.green,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8.5),
            decoration: BoxDecoration(
              color: Colors.white60,
              border: Border.all(color: Colors.grey, width: 0.5),
            ),
            margin: const EdgeInsets.symmetric(vertical: 37),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                OptionSelector(
                  icon: kinfoIcon,
                  title: 'Help',
                  iconContainerColor: Colors.blue,
                ),
                Divider(
                  indent: 50,
                ),
                OptionSelector(
                  icon: Icons.favorite,
                  title: 'Tell a Friend',
                  iconContainerColor: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
