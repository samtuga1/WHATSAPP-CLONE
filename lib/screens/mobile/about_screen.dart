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
                child: StatusOption(
                  title: abouts.currentStatusOption,
                  onTap: () {},
                  loading: false,
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
                child: Column(
                  children: List.generate(
                    abouts.statusOptions.length,
                    (i) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StatusOption(
                          title: abouts.statusOptions[i],
                          onTap: () => abouts.fakeDelay(
                            abouts.statusOptions[i],
                          ),
                          loading: abouts.loading,
                        ),
                        if (i != abouts.statusOptions.length - 1)
                          const Divider(
                            height: 8,
                            indent: 20,
                            thickness: 0.8,
                          ),
                      ],
                    ),
                  ).toList(),
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
    required this.loading,
  }) : super(key: key);
  final String title;
  final Function() onTap;
  final bool loading;

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
            loading
                ? const CupertinoActivityIndicator()
                : const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
          ],
        ),
      ),
    );
  }
}
