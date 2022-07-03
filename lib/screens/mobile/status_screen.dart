import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsap_clone/constants/themes.dart';
import 'package:whatsap_clone/screens/mobile/story_screen.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              leading: CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                child: const Text(
                  'Privacy',
                  style: TextStyle(color: Colors.blue, fontSize: 17.5),
                ),
              ),
              backgroundColor: Colors.grey.shade50,
              largeTitle: const Text(
                'Settings',
              ),
              border: const Border(
                bottom: BorderSide.none,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: CupertinoSearchTextField(),
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  // My status
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.4),
                    ),
                    height: 80,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 14, right: 10),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushNamed(StoryScreen.routeName),
                            child: const CircleAvatar(
                              radius: 30,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'My Status',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              '14h ago',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17.5,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: kBackgroundColor,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                splashRadius: 23,
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.camera_fill,
                                  size: 22,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 18,
                            ),
                            CircleAvatar(
                              backgroundColor: kBackgroundColor,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                splashRadius: 23,
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.pen,
                                  size: 30,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 17,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // My status
                  const Text('RECENT UPDATES')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
