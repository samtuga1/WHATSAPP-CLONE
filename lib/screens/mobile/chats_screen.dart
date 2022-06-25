import 'package:flutter/cupertino.dart';
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
  //double searchBarHeight = 15;
  //bool showSearchBar = true;
  //bool pinChatText = true;
  //double textColorOpacity = 1;
  //bool showChatTitle = false;

  void onListenableCall() {}

  @override
  void initState() {
    super.initState();
    // controller.addListener(() {
    //   setState(() {
    //     if (controller.hasClients) {
    //       final offset = controller.offset;
    //       final scrollDirection = controller.position.userScrollDirection;
    //       if (scrollDirection == ScrollDirection.reverse) {
    //         pinChatText = true;
    //         searchBarHeight -= offset * 0.7;
    //         textColorOpacity -= 0.05;
    //         if (controller.position.extentBefore > 25) {
    //           showChatTitle = true;
    //         }
    //         if (textColorOpacity < 0.3) {
    //           textColorOpacity = 0;
    //         }
    //         if (searchBarHeight < 2) {
    //           pinChatText = false;
    //           searchBarHeight = 0;
    //         }
    //       }
    //       if (scrollDirection == ScrollDirection.forward && offset < 50) {
    //         searchBarHeight += offset - 3;
    //         textColorOpacity += 0.3;
    //         if (textColorOpacity > 0.8) {
    //           textColorOpacity = 1;
    //         }
    //         if (controller.position.extentBefore < 25) {
    //           showChatTitle = false;
    //         }
    //         if (searchBarHeight > 12) {
    //           searchBarHeight = 15;
    //           pinChatText = false;
    //         }
    //         if (controller.position.extentBefore < 2) {
    //           searchBarHeight = 15;
    //           textColorOpacity = 1;
    //         }
    //       }
    //     }
    //   });
    // });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        controller: controller,
        slivers: [
          CupertinoSliverNavigationBar(
            //middle: const Text('Chats'),
            padding: EdgeInsetsDirectional.zero,
            largeTitle: const Text(
              'Chats',
              //style: TextStyle(fontSize: 13, color: Colors.black),
            ),
            //backgroundColor: Colors.grey.shade50,
            leading: CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              child: const Text(
                'Edit',
                style: TextStyle(color: Colors.blue, fontSize: 13.5),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(left: 14, top: 10),
            //   child: TextButton(
            //     style: TextButton.styleFrom(
            //         textStyle: const TextStyle(fontWeight: FontWeight.w400),
            //         padding: EdgeInsets.zero,
            //         alignment: Alignment.centerLeft),
            //     onPressed: () {},
            //     child: const Text(
            //       'Edit',
            //       style: TextStyle(color: Colors.blue, fontSize: 13.5),
            //     ),
            //   ),
            // ),
            trailing: CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              child: const FaIcon(
                kEditNoteIcon,
                color: Colors.blue,
                size: 17,
              ),
            ),
          ),
          // SliverPadding(
          //   padding: const EdgeInsets.only(bottom: 12),
          //   sliver: SliverAppBar(
          //     toolbarHeight: 17,
          //     elevation: 0,
          //     pinned: pinChatText,
          //     foregroundColor: Colors.black,
          //     backgroundColor: Colors.grey.withOpacity(0.002),
          //     title: const Text(
          //       'Chats',
          //       style: TextStyle(
          //         fontSize: 25,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ),
          // ),
          // SliverPadding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   sliver: SliverAppBar(
          //     toolbarHeight: searchBarHeight,
          //     floating: false,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //     backgroundColor: Colors.grey.withOpacity(0.15),
          //     flexibleSpace: Container(
          //       margin: const EdgeInsets.only(left: 10, top: 10),
          //       child: Text.rich(
          //         TextSpan(
          //           style: TextStyle(
          //             fontSize: 15,
          //             color: Colors.grey.withOpacity(textColorOpacity),
          //           ),
          //           children: [
          //             WidgetSpan(
          //               child: Icon(
          //                 Icons.search,
          //                 color: Colors.grey.withOpacity(textColorOpacity),
          //                 size: 17,
          //               ),
          //             ),
          //             const TextSpan(
          //               text: ' Search',
          //             )
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Material(
          //   child: SliverAppBar(
          //     backgroundColor: Colors.grey.withOpacity(0.002),
          //     toolbarHeight: 30,
          //     title: Column(
          //       children: [
          //         Row(children: [
          //           TextButton(
          //             style: TextButton.styleFrom(
          //               textStyle: const TextStyle(fontWeight: FontWeight.w400),
          //               padding: const EdgeInsets.only(left: 4, bottom: 0),
          //               alignment: Alignment.centerLeft,
          //             ),
          //             onPressed: () {},
          //             child: const Text(
          //               'Broadcast Lists',
          //               style: TextStyle(
          //                 color: Colors.blueAccent,
          //               ),
          //             ),
          //           ),
          //           const Spacer(),
          //           TextButton(
          //             style: TextButton.styleFrom(
          //               textStyle: const TextStyle(fontWeight: FontWeight.w400),
          //               padding: const EdgeInsets.only(right: 4, bottom: 0),
          //               alignment: Alignment.centerRight,
          //             ),
          //             onPressed: () {},
          //             child: const Text(
          //               'New Group',
          //               style: TextStyle(
          //                 color: Colors.blueAccent,
          //               ),
          //             ),
          //           )
          //         ]),
          //         const Divider(
          //           thickness: 7,
          //           color: Colors.black,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Column(
                children: const [
                  ChatItem(),
                  Divider(
                    indent: 50,
                    thickness: 0.4,
                  )
                ],
              ),
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
