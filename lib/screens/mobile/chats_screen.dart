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
      navigationBar: CupertinoNavigationBar(
        border: const Border(bottom: BorderSide.none),
        middle: showChatTitle ? const Text('Chats') : null,
        padding: const EdgeInsetsDirectional.only(start: 6),
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
      child: CustomScrollView(
        controller: controller,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: const EdgeInsets.only(left: 15.0, bottom: 5),
                child: const Text(
                  'Chats',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
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
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (context, index) => Column(
                  children: const [
                    ChatItem(),
                    Divider(
                      indent: 50,
                      thickness: 0.4,
                    )
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
