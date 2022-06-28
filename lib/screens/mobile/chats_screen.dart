import 'package:cupertino_lists/cupertino_lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsap_clone/constants/icons.dart';
import 'package:whatsap_clone/constants/themes.dart';
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
      backgroundColor: CupertinoColors.white,
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
                height: 5,
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (context, index) => Column(
                  children: [
                    CupertinoListItem(
                      onTap: () {},
                      trailing: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('29/08/22'),
                          Row(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Text('1'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      leadingWidgetSize: 26,
                      title: const Text(
                        'Sam',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      subtitle: const Text(
                        'How are you doing ?',
                        style: TextStyle(color: CupertinoColors.systemGrey),
                      ),
                    ),
                    const Divider(
                      indent: 66,
                      thickness: 0.4,
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
