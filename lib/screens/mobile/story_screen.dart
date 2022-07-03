import 'dart:async';
import 'dart:developer';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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

  double backgroundOpacity = 0;

  List<double> percentCompletedList = [];

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
      body: GestureDetector(
        onTapDown: (details) => onTapDown(details),
        child: DismissiblePage(
          backgroundColor: Colors.black.withOpacity(backgroundOpacity),
          onDragUpdate: (details) {
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
          direction: DismissiblePageDismissDirection.multi,
          isFullScreen: false,
          child: Hero(
              tag: 'story_screen',
              child: Stack(
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
                    top: 45,
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
                    top: 48,
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
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onVerticalDragUpdate: (details) {
                        print(details.globalPosition.dy);
                      },
                      child: const Icon(
                        CupertinoIcons.arrow_up,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
