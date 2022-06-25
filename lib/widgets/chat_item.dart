import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:whatsap_clone/constants/icons.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({Key? key, this.onHover}) : super(key: key);
  final bool? onHover;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
      child: Row(children: [
        Row(
          children: [
            const Material(
              child: CircleAvatar(
                radius: 26,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Samuel',
                  style: TextStyle(),
                ),
                Text(
                  'How are you doing ?',
                  style: TextStyle(color: CupertinoColors.systemGrey),
                )
              ],
            )
          ],
        ),
        const Spacer(),
        Column(
          children: [
            const Text('29/08/22'),
            Row(
              children: [
                const Material(
                  child: Chip(
                    backgroundColor: Colors.blue,
                    visualDensity: VisualDensity(horizontal: -3.0, vertical: 0),
                    label: Text('21'),
                  ),
                ),
                if (onHover ?? false) const FaIcon(kDropdownIcon)
              ],
            ),
          ],
        )
      ]),
    );
  }
}
