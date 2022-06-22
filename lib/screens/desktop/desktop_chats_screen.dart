import 'package:flutter/material.dart';

import '../../widgets/chat_item.dart';

class ChatsDesktopView extends StatelessWidget {
  const ChatsDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(children: [
              Container(
                color: Colors.grey.withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    const CircleAvatar(),
                    const Spacer(),
                    SizedBox(
                      width: 120,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              'assets/icons/status.png',
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Container(
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(width: 0.3, color: Colors.grey),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      label: Text('Search or start a new chat'),
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 0.4,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) => Column(
                    children: const [
                      ChatItem(),
                      Divider(
                        indent: 50,
                        thickness: 0.4,
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            flex: 8,
            child: Container(
              color: Colors.grey.withOpacity(0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/no-connection.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Text(
                    'Keep your phone connected',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'WhatsApp connects to your phone to sync messages. To reduce data usage, connect your phone to Wi-Fi.',
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
