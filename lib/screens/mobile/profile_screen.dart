import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsap_clone/constants/themes.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = 'profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: kBackgroundColor,
      navigationBar: CupertinoNavigationBar(
        border: Border.all(
          color: Colors.transparent,
          width: 0.0,
          style: BorderStyle.none,
        ),
        middle: const Text('Edit Profile'),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          CircleAvatar(
                            radius: 30,
                          ),
                          Text(
                            'Edit',
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      const Expanded(
                        child: Text(
                          'Enter your name and add an optional profile picture',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  const Divider(
                    indent: 50,
                    height: 10,
                  ),
                  const CupertinoTextField(),
                  const Divider(
                    indent: 50,
                    height: 10,
                  ),
                ],
              ),
            ),

            // Text('PHONE NUMBER'),
            // Container(
            //   width: double.infinity,
            //   decoration: BoxDecoration(border: Border.all(color: Colors.grey),),
            //   child: Text('+233 55 509 3397'),
            // )
          ],
        ),
      ),
    );
  }
}
