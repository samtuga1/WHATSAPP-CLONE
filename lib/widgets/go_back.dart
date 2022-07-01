import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoBack extends StatelessWidget {
  const GoBack({
    Key? key,
    required this.backPage,
  }) : super(key: key);
  final String backPage;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
            Text(
              backPage,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.blue,
              ),
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
