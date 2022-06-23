import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:whatsap_clone/constants/icons.dart';
import 'package:whatsap_clone/constants/themes.dart';
import 'package:whatsap_clone/providers/mobile/settings_provider.dart';
import 'package:whatsap_clone/screens/mobile/profile_screen.dart';
import '../../Routing/custom_page_route.dart';
import '../../widgets/option_selector.dart';

class MobileSettings extends StatefulWidget {
  const MobileSettings({Key? key}) : super(key: key);

  @override
  State<MobileSettings> createState() => _MobileSettingsState();
}

class _MobileSettingsState extends State<MobileSettings> {
  final controller = ScrollController();
  bool showPinnedBar = false;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        if (controller.hasClients) {
          if (controller.position.userScrollDirection ==
                  ScrollDirection.reverse &&
              controller.offset > 45) {
            showPinnedBar = true;
          } else if (controller.position.userScrollDirection ==
                  ScrollDirection.forward &&
              controller.offset < 45) {
            showPinnedBar = false;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      controller: controller,
      slivers: [
        SliverAppBar(
          pinned: true,
          title: showPinnedBar
              ? Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text('Settings'),
                )
              : null,
          centerTitle: true,
          foregroundColor: Colors.black,
          elevation: 0,
          backgroundColor: kBackgroundColor,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: const Text(
                      'Settings',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    splashFactory: InkRipple.splashFactory,
                    onTap: () => Navigator.of(context)
                        .pushNamed(ProfileScreen.routeName),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 3),
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
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 15.5),
                              ),
                            ],
                          ),
                          const Spacer(),
                          CircleAvatar(
                            backgroundColor: kBackgroundColor,
                            child: IconButton(
                              splashRadius: 23,
                              onPressed: () {},
                              icon: const FaIcon(
                                kQRcodeIcon,
                                size: 22,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.5),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      border: Border.all(color: Colors.grey, width: 0.2),
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
                          indent: 64,
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
                    padding: const EdgeInsets.symmetric(vertical: 8.5),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      border: Border.all(color: Colors.grey, width: 0.2),
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
                          indent: 64,
                        ),
                        const OptionSelector(
                          icon: kWhatsapIcon,
                          title: 'Chats',
                          iconContainerColor: Colors.green,
                        ),
                        const Divider(
                          indent: 64,
                        ),
                        OptionSelector(
                          alternateIcon: SizedBox(
                            height: 21,
                            width: 21,
                            child: Image.asset(
                              'assets/icons/notification.png',
                              color: Colors.white,
                            ),
                          ),
                          title: 'Notifications',
                          iconContainerColor: Colors.red,
                        ),
                        const Divider(
                          indent: 64,
                        ),
                        OptionSelector(
                          alternateIcon: SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset(
                              'assets/icons/up-down.png',
                              color: Colors.white,
                            ),
                          ),
                          title: 'Storage and Data',
                          iconContainerColor: Colors.green,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.5),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      border: Border.all(color: Colors.grey, width: 0.2),
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
                          indent: 64,
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
            ],
          ),
        )
      ],
    );
  }
}
