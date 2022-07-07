import 'package:dashed_color_circle/dashed_color_circle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsap_clone/constants/themes.dart';
import 'package:whatsap_clone/screens/mobile/story_screen.dart';

import '../../widgets/chat_item.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: kBackgroundColor,
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
                      border: Border.all(color: Colors.grey, width: 0.2),
                    ),
                    height: 80,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 14, right: 10),
                          child: GestureDetector(
                            onTap: () => Navigator.of(context)
                                .pushNamed(StoryScreen.routeName),
                            child: Center(
                              child: Hero(
                                tag: 'story_screen',
                                child: Stack(
                                  children: const [
                                    DashedColorCircle(
                                      dashes: 4,
                                      emptyColor: Colors.grey,
                                      filledColor: Colors.blue,
                                      fillCount: 1,
                                      size: 60.0,
                                      gapSize: 6.0,
                                      strokeWidth: 3.0,
                                    ),
                                    Positioned(
                                      left: 3.9,
                                      top: 3.7,
                                      child: CircleAvatar(
                                        radius: 26,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
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
                  Container(
                    margin:
                        const EdgeInsets.only(left: 14, top: 25, bottom: 10),
                    child: const Text(
                      'RECENT UPDATES',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 0.2),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 1,
                      itemBuilder: (context, index) => Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CupertinoListItem(
                              isStory: true,
                              leadingWidgetSize: 30,
                              title: Text(
                                'Samuel',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Text('just now',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 17.5,
                                    color: Colors.grey,
                                  )),
                              trailing: Text(''),
                            ),
                          ),
                          Divider(
                            thickness: 0.95,
                            height: 7,
                            indent: 80,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
