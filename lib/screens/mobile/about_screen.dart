import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsap_clone/constants/themes.dart';
import 'package:whatsap_clone/providers/mobile/about_provider.dart';
import 'package:whatsap_clone/widgets/go_back.dart';

class MobileAboutScreen extends StatelessWidget {
  static const routeName = '/MobileAboutScreen';
  const MobileAboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final abouts = Provider.of<AboutScreenProvider>(context, listen: false);
    return Material(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: const Text('About'),
          centerTitle: true,
          leadingWidth: 115,
          leading: Container(
            margin: const EdgeInsets.only(left: 10),
            child: const GoBack(backPage: 'Edit Profile'),
          ),
          elevation: 0,
          backgroundColor: kBackgroundColor,
          actions: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Text('Edit'),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, bottom: 10, top: 30),
                child: const Text(
                  'CURRENTLY SET TO',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                height: 45,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.black38, width: 0.5),
                    bottom: BorderSide(color: Colors.black38, width: 0.5),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: StatusOption(
                  title: abouts.currentStatusOption,
                  onTap: () {},
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, bottom: 10),
                child: const Text(
                  'SELECT YOUR ABOUT',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.black38, width: 0.5),
                    bottom: BorderSide(color: Colors.black38, width: 0.5),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: List.generate(
                    3,
                    (i) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StatusOption(
                          title: abouts.statusOptions[i],
                          onTap: () {},
                        ),
                        if (i != 2) const Divider()
                      ],
                    ),
                  ).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StatusOption extends StatelessWidget {
  const StatusOption({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
