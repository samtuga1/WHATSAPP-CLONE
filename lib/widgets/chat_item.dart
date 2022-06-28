import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsap_clone/constants/themes.dart';

class CupertinoListItem extends StatelessWidget {
  const CupertinoListItem({
    Key? key,
    this.onHover,
    this.leadingWidgetSize,
    this.subtitle,
    this.trailing,
    this.title,
    this.onTap,
  }) : super(key: key);
  final bool? onHover;
  final double? leadingWidgetSize;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final Function()? onTap;

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
                CircleAvatar(
                  radius: leadingWidgetSize,
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
