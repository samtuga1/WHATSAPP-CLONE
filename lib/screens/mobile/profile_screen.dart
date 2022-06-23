import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = 'profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new),
          label: const Text('Settings'),
        ),
        title: const Text('Edit Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
                const Text(
                  'Enter your name and add an optional profile picture',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
