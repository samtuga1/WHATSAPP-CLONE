import 'dart:async';
import 'dart:developer';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:whatsap_clone/constants/themes.dart';

class StoryScreen extends StatefulWidget {
  static const routeName = '/story_screen';
  const StoryScreen({Key? key}) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  List<Container> pages = [
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.pink,
    ),
  ];
  int currentPageIndex = 0;
  late Timer time;
  void startTimer() {
    Timer.periodic(
      const Duration(milliseconds: 50),
      (timer) {
        if (mounted) {
          setState(
            () {
              time = timer;
              if (percentCompletedList[currentPageIndex] < 0.99) {
                percentCompletedList[currentPageIndex] += 0.01;
              } else {
                percentCompletedList[currentPageIndex] = 1;
                timer.cancel();
                if (currentPageIndex < pages.length - 1) {
                  currentPageIndex++;
                  startTimer();
                } else {
                  Navigator.of(context).pop();
                }
              }
            },
          );
        }
      },
    );
  }

  void onTapDown(TapDownDetails ontapDown) {
    swipedUp = false;
    final screenWidth = MediaQuery.of(context).size.width;
    double dx = ontapDown.globalPosition.dx;
    if (mounted) {
      if (dx < screenWidth / 2) {
        setState(() {
          if (currentPageIndex == 0) {
            percentCompletedList[currentPageIndex] = 0;
          }
          if (currentPageIndex > 0) {
            percentCompletedList[currentPageIndex - 1] = 0;
            percentCompletedList[currentPageIndex] = 0;
            currentPageIndex--;
          }
        });
      } else {
        setState(() {
          if (currentPageIndex < pages.length - 1) {
            percentCompletedList[currentPageIndex] = 1;
            currentPageIndex++;
          } else {
            percentCompletedList[currentPageIndex] = 1;
          }
        });
      }
    }
  }

  void swipeUp(TapDownDetails ontapDown) {}

  double backgroundOpacity = 0;
  List<double> percentCompletedList = [];
  bool swipedUp = false;

  @override
  void initState() {
    for (int i = 0; i < pages.length; i++) {
      percentCompletedList.add(0);
    }
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    time.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: DismissiblePage(
        backgroundColor: Colors.black.withOpacity(backgroundOpacity),
        onDragUpdate: (DismissiblePageDragUpdateDetails details) {
          backgroundOpacity = 1;
          if (details.overallDragValue == 0) {
            backgroundOpacity = 0;
          }
        },
        maxRadius: 1000,
        minRadius: 0,
        onDismissed: () {
          Navigator.of(context).pop();
        },
        direction: DismissiblePageDismissDirection.down,
        maxTransformValue: 1,
        isFullScreen: true,
        child: GestureDetector(
          onTapDown: (details) => onTapDown(details),
          onPanStart: (details) {
            if (details.globalPosition.direction > 1) {
              swipedUp = true;
            }
          },
          child: Hero(
            tag: 'story_screen',
            child: Stack(
              children: [
                Stack(
                  children: [
                    pages[currentPageIndex],
                    SafeArea(
                      child: Container(
                        margin: const EdgeInsets.only(top: 1, bottom: 0),
                        child: Row(
                          children: List.generate(
                            pages.length,
                            (index) => Expanded(
                              child: LinearPercentIndicator(
                                lineHeight: 4,
                                backgroundColor: Colors.grey.shade300,
                                barRadius: const Radius.circular(3),
                                percent: percentCompletedList[index],
                                progressColor: Colors.white,
                              ),
                            ),
                          ).toList(),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 55,
                      child: Row(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const CircleAvatar(),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Samuel',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.5,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '8:43 AM',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 55,
                      right: 0,
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: const [
                            Icon(
                              CupertinoIcons.arrow_up,
                              color: Colors.white,
                            ),
                            Text(
                              'Reply',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                if (swipedUp) StatusMessageBox(swipedUp: swipedUp)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatusMessageBox extends StatelessWidget {
  const StatusMessageBox({
    Key? key,
    required this.swipedUp,
  }) : super(key: key);

  final bool swipedUp;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: Colors.grey.shade300,
          height: 52,
          width: double.infinity,
          child: Row(children: [
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Samuel • Status',
                    style: TextStyle(color: Colors.purpleAccent),
                  ),
                  Row(
                    children: const [
                      Icon(
                        CupertinoIcons.camera_fill,
                        size: 18,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Photo',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(right: 5),
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(5),
              ),
            )
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          height: 45,
          width: double.infinity,
          color: kBackgroundColor,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: const Icon(CupertinoIcons.add),
              ),
              Expanded(
                child: TextField(
                  autofocus: swipedUp,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                child: const Icon(CupertinoIcons.camera),
              ),
              Container(
                margin: const EdgeInsets.only(right: 6),
                child: const Icon(CupertinoIcons.mic),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
