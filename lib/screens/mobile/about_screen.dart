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
    final abouts = Provider.of<AboutScreenProvider>(context);
    return Material(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: CupertinoNavigationBar(
          automaticallyImplyLeading: true,
          previousPageTitle: 'Edit Profile',
          border: const Border(bottom: BorderSide.none),
          middle: const Text('About'),
          backgroundColor: kBackgroundColor,
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Text('Edit'),
            onPressed: () {},
          ),
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
                child: StatusOption(
                  title: abouts.currentStatusOption,
                  onTap: () {},
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
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
              // Start
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.black38, width: 0.5),
                    bottom: BorderSide(color: Colors.black38, width: 0.5),
                  ),
                ),
                child: Column(
                  children: List.generate(
                    abouts.statusOptions.length,
                    (i) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          StatusOption(
                            i: i,
                            title: abouts.statusOptions[i],
                            onTap: () =>
                                abouts.fakeDelay(abouts.statusOptions[i], i),
                            trailing: abouts.loading == i
                                ? const CupertinoActivityIndicator()
                                : abouts.currentStatusOption ==
                                        abouts.statusOptions[i]
                                    ? const Icon(
                                        CupertinoIcons.check_mark,
                                        size: 20,
                                        color: Colors.blueAccent,
                                      )
                                    : const Icon(
                                        Icons.arrow_forward_ios,
                                        size: 16,
                                        color: Colors.grey,
                                      ),
                          ),
                          if (i != abouts.statusOptions.length - 1)
                            const Divider(
                              height: 8,
                              indent: 20,
                              thickness: 0.8,
                            ),
                        ],
                      );
                    },
                  ),
                  //
                ),
              ),
              const SizedBox(
                height: 30,
              ),
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
    required this.trailing,
    this.i,
  }) : super(key: key);
  final String title;
  final Function() onTap;
  final Widget trailing;
  final int? i;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
