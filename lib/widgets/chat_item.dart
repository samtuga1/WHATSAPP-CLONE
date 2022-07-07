import 'package:dashed_color_circle/dashed_color_circle.dart';
import 'package:flutter/material.dart';

class CupertinoListItem extends StatelessWidget {
  const CupertinoListItem({
    Key? key,
    this.onHover,
    this.leadingWidgetSize,
    this.subtitle,
    this.trailing,
    this.title,
    this.onTap,
    required this.isStory,
  }) : super(key: key);
  final bool? onHover;
  final double? leadingWidgetSize;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final Function()? onTap;
  final bool isStory;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
          child: Row(children: [
            Row(
              children: [
                Stack(
                  children: [
                    if (isStory)
                      const DashedColorCircle(
                        dashes: 4,
                        emptyColor: Colors.grey,
                        filledColor: Colors.blue,
                        fillCount: 1,
                        size: 60.0,
                        gapSize: 6.0,
                        strokeWidth: 2.0,
                      ),
                    Positioned(
                      left: isStory ? 4 : null,
                      top: isStory ? 3.9 : null,
                      child: const CircleAvatar(
                        radius: 26,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title!,
                    const SizedBox(
                      height: 4,
                    ),
                    subtitle!,
                  ],
                )
              ],
            ),
            const Spacer(),
            trailing!,
          ]),
        ),
      ),
    );
  }
}
