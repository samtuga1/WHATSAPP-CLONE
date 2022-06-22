import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsap_clone/constants/icons.dart';
import '../../widgets/chat_item.dart';

class MobileChatsScreen extends StatefulWidget {
  const MobileChatsScreen({Key? key}) : super(key: key);

  @override
  State<MobileChatsScreen> createState() => _MobileChatsScreenState();
}

class _MobileChatsScreenState extends State<MobileChatsScreen> {
  final controller = ScrollController();
  double searchBarHeight = 30;
  double searchBarHeight2 = 30;
  bool showSearchBar = true;
  bool pinChatText = true;
  double textColorOpacity = 1;
  bool showChatTitle = false;

  void onListenableCall() {}

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        if (controller.hasClients) {
          final offset = controller.offset;
          final scrollDirection = controller.position.userScrollDirection;
          if (scrollDirection == ScrollDirection.reverse) {
            pinChatText = true;
            searchBarHeight -= offset * 0.7;
            textColorOpacity -= 0.05;
            if (controller.position.extentBefore > 32) {
              showChatTitle = true;
            }
            if (textColorOpacity < 0.3) {
              textColorOpacity = 0;
            }
            if (searchBarHeight < 2) {
              pinChatText = false;
              searchBarHeight = 0;
            }
          }
          if (scrollDirection == ScrollDirection.forward && offset < 50) {
            searchBarHeight += offset - 3;
            textColorOpacity += 0.3;
            if (textColorOpacity > 0.8) {
              textColorOpacity = 1;
            }
            if (controller.position.extentBefore < 32) {
              showChatTitle = false;
            }
            if (searchBarHeight > 25) {
              searchBarHeight = 30;
              pinChatText = false;
            }
            if (controller.position.extentBefore < 2) {
              searchBarHeight = 30;
              textColorOpacity = 1;
            }
          }
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverAppBar(
            toolbarHeight: 40,
            centerTitle: true,
            title: showChatTitle
                ? const Text(
                    'Chats',
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  )
                : null,
            pinned: true,
            floating: true,
            elevation: 0,
            backgroundColor: Colors.grey.shade50,
            leading: Container(
              margin: const EdgeInsets.only(left: 14, top: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontWeight: FontWeight.w400),
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft),
                onPressed: () {},
                child: const Text(
                  'Edit',
                  style: TextStyle(color: Colors.blue, fontSize: 13.5),
                ),
              ),
            ),
            actions: [
              IconButton(
                splashRadius: 2,
                onPressed: () {},
                icon: const FaIcon(
                  kEditNoteIcon,
                  color: Colors.blue,
                  size: 17,
                ),
              ),
            ]),
        SliverAppBar(
          toolbarHeight: 45,
          elevation: 0,
          pinned: pinChatText,
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey.withOpacity(0.002),
          title: const Text(
            'Chats',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          sliver: SliverAppBar(
              toolbarHeight: searchBarHeight,
              floating: false,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              foregroundColor: Colors.black,
              backgroundColor: Colors.grey.withOpacity(0.15),
              title: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.withOpacity(textColorOpacity),
                  ),
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.search,
                        color: Colors.grey.withOpacity(textColorOpacity),
                        size: 17,
                      ),
                    ),
                    const TextSpan(
                      text: ' Search',
                    )
                  ],
                ),
              )),
        ),
        SliverList(
            delegate: SliverChildListDelegate(
          [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10),
              child: Row(children: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontWeight: FontWeight.w400),
                    padding: const EdgeInsets.only(left: 4, bottom: 0),
                    alignment: Alignment.centerLeft,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Broadcast Lists',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontWeight: FontWeight.w400),
                    padding: const EdgeInsets.only(right: 4, bottom: 0),
                    alignment: Alignment.centerRight,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'New Group',
                    style: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                )
              ]),
            ),
            const Divider(
              thickness: 0.35,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) => Column(
                children: const [
                  ChatItem(),
                  Divider(
                    indent: 50,
                    thickness: 0.4,
                  )
                ],
              ),
            ),
          ],
        ))
      ],
    );
  }
}
