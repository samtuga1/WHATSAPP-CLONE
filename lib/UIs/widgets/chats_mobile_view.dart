import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsap_clone/UIs/widgets/chat_item.dart';

class ChatsMobileView extends StatefulWidget {
  const ChatsMobileView({Key? key}) : super(key: key);

  @override
  State<ChatsMobileView> createState() => _ChatsMobileViewState();
}

class _ChatsMobileViewState extends State<ChatsMobileView> {
  final controller = ScrollController();
  double searchBarHeight = 30;
  double searchBarHeight2 = 30;
  bool showSearchBar = true;
  bool pinChatText = true;
  double textColorOpacity = 1;

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
            searchBarHeight -= offset * 0.5;
            textColorOpacity - 0.05;
            if (textColorOpacity < 0.3) {
              textColorOpacity = 0;
            }
            if (searchBarHeight < 2) {
              pinChatText = false;
              searchBarHeight = 0;
            }
          }
          if (scrollDirection == ScrollDirection.forward && offset < 50) {
            searchBarHeight += offset * 0.2;
            textColorOpacity + 0.05;
            if (textColorOpacity > 0.8) {
              textColorOpacity = 1;
            }
            if (searchBarHeight > 25) {
              searchBarHeight = 30;
              pinChatText = false;
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
        SliverPadding(
          padding: const EdgeInsets.only(left: 2),
          sliver: SliverAppBar(
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
              backgroundColor: Colors.grey.withOpacity(0.2),
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
                    TextSpan(
                      text: ' Search',
                    )
                  ],
                ),
              )
              //  Row(
              //   children: [
              //     const Icon(
              //       Icons.search,
              //       color: Colors.grey,
              //       size: 20,
              //     ),
              //     const SizedBox(
              //       width: 8,
              //     ),
              //     Container(
              //       margin: const EdgeInsets.only(bottom: 3),
              //       child: const Text(
              //         'Search',
              //         style: TextStyle(color: Colors.grey, fontSize: 15),
              //       ),
              //     ),
              //   ],
              // ),
              ),
        ),
        SliverList(
            delegate: SliverChildListDelegate(
          [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 15),
              child: Row(children: const [
                Text(
                  'Broadcast Lists',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
                Spacer(),
                Text(
                  'New Group',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                )
              ]),
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
