import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:whatsap_clone/constants/icons.dart';
import 'package:cupertino_tabbar/cupertino_tabbar.dart' as ctb;
import 'package:whatsap_clone/providers/call_screen_provider.dart';
import 'package:whatsap_clone/widgets/chat_item.dart';

class MobileCallScreen extends StatelessWidget {
  const MobileCallScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            body: CustomScrollView(
      slivers: [
        SliverAppBar(
          elevation: 0,
          pinned: true,
          title: SizedBox(
            height: 33.5,
            width: 160,
            child: ctb.CupertinoTabBar(
              Colors.grey.withOpacity(0.2),
              CupertinoColors.white,
              const [
                Padding(
                  padding: EdgeInsets.only(right: 6),
                  child: Text(
                    "All",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  "Missed",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              Provider.of<CallScreenProvider>(context)
                  .cupertinoTabBarValueGetter,
              (index) => Provider.of<CallScreenProvider>(context, listen: false)
                  .changeCupertinoValue(index),
              borderRadius: BorderRadius.circular(5),
              useShadow: false,
            ),
          ),
          backgroundColor: Colors.grey.shade50,
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Text('Edit'),
            onPressed: () {},
          ),
          actions: [
            CupertinoButton(
              child: const Icon(kPhonePlus),
              onPressed: () {},
            )
          ],
          centerTitle: true,
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                margin: const EdgeInsets.only(left: 15.0, bottom: 5),
                child: const Text(
                  'Calls',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: CupertinoSearchTextField(),
              ),
              const SizedBox(
                height: 8,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (context, index) => Column(
                  children: [
                    const Divider(
                      indent: 65,
                    ),
                    CupertinoListItem(
                      isStory: false,
                      onTap: () {},
                      leadingWidgetSize: 24,
                      title: const Text(
                        'Babess❤',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Row(
                        children: const [
                          FaIcon(
                            FontAwesomeIcons.phone,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Incoming',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      trailing: Row(
                        children: [
                          const Text('Yesterday'),
                          const SizedBox(
                            width: 3,
                          ),
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 1.5,
                                ),
                              ),
                              child: const Center(
                                child: FaIcon(
                                  kinfoIcon,
                                  size: 15,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    )));
  }
}
