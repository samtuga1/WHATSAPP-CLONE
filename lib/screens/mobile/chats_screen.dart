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
  bool showChatTitle = false;

  void onListenableCall() {
    setState(() {
      if (controller.hasClients) {
        final offset = controller.offset;
        final scrollDirection = controller.position.userScrollDirection;
        if (scrollDirection == ScrollDirection.reverse) {
          if (offset > 27) {
            showChatTitle = true;
          }
        }
        if (scrollDirection == ScrollDirection.forward && offset < 50) {
          if (offset < 27) {
            showChatTitle = false;
          }
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(onListenableCall);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(onListenableCall);
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        controller: controller,
        slivers: [
          CupertinoSliverNavigationBar(
            middle: showChatTitle ? const Text('Chats') : null,
            padding: const EdgeInsetsDirectional.only(start: 6),
            largeTitle: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Chats',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const CupertinoSearchTextField(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: const Text('Broadcast Lists'),
                        onPressed: () {},
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: const Text('New Group'),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
            leading: CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              child: const Text(
                'Edit',
                style: TextStyle(color: Colors.blue, fontSize: 17.3),
              ),
            ),
            trailing: CupertinoButton(
              onPressed: () {},
              padding: EdgeInsets.zero,
              child: const FaIcon(
                kEditNoteIcon,
                color: Colors.blue,
                size: 21,
              ),
            ),
          ),
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
