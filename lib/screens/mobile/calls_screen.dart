import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MobileCallScreen extends StatelessWidget {
  const MobileCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            leading:
                CupertinoButton(child: const Text('Edit'), onPressed: () {}),
          )
        ],
      ),
    );
  }
}
