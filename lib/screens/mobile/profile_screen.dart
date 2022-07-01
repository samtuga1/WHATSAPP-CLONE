import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsap_clone/constants/themes.dart';
import 'package:whatsap_clone/screens/mobile/about_screen.dart';

import '../../widgets/go_back.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = 'profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: kBackgroundColor,
      navigationBar: CupertinoNavigationBar(
        leading: const GoBack(
          backPage: 'Settings',
        ),
        border: Border.all(
          color: Colors.transparent,
          width: 0.0,
          style: BorderStyle.none,
        ),
        middle: const Text('Edit Profile'),
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                decoration: const BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const CircleAvatar(
                            radius: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        const Expanded(
                          child: Text(
                            'Enter your name and add an optional profile picture',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 6),
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: const Text(
                          'Edit',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 22,
                      thickness: 1,
                    ),
                    const Material(
                      child: SizedBox(
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Ask Me',
                            hintStyle:
                                TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 8,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, bottom: 8),
                child: const Text(
                  'PHONE NUMBER',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(color: Colors.grey, width: 0.5),
                ),
                child: const Text('+233 55 509 3397'),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, bottom: 8),
                child: const Text(
                  'ABOUT',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              Material(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(MobileAboutScreen.routeName);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 13),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      border: Border.all(color: Colors.grey, width: 0.5),
                    ),
                    child: Row(
                      children: const [
                        Text('Available'),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 300,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
