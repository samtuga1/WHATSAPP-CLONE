import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
      child: Row(children: [
        Row(
          children: [
            const CircleAvatar(),
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
                Text('How are you doing ?',
                    style: TextStyle(color: Colors.grey))
              ],
            )
          ],
        ),
        const Spacer(),
        Column(
          children: const [
            Text('29/08/22'),
            Chip(
              label: Text('221'),
            ),
          ],
        )
      ]),
    );
  }
}
