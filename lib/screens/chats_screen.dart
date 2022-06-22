import 'package:flutter/material.dart';
import '../widgets/chats_desktop_view.dart';
import '../widgets/chats_mobile_view.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LayoutBuilder(
      builder: (context, constraints) => constraints.maxWidth > 500
          ? const ChatsDesktopView()
          : const ChatsMobileView(),
    )

        //Row(
        //   children: [
        //     Expanded(
        //       flex: model.windows ? 3 : 1,
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           model.windows == true
        //               ? Container(
        //                   color: Colors.grey.withOpacity(0.2),
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(8.0),
        //                     child: Row(children: [
        //                       const CircleAvatar(),
        //                       const Spacer(),
        //                       SizedBox(
        //                         width: 120,
        //                         child: Row(
        //                           children: [
        //                             IconButton(
        //                               onPressed: () {},
        //                               icon: Image.asset(
        //                                 'assets/icons/status.png',
        //                               ),
        //                             ),
        //                             IconButton(
        //                               onPressed: () {},
        //                               icon: const Icon(Icons.add),
        //                             ),
        //                             IconButton(
        //                               onPressed: () {},
        //                               icon: const Icon(Icons.more_horiz),
        //                             )
        //                           ],
        //                         ),
        //                       ),
        //                     ]),
        //                   ),
        //                 )
        //               : Padding(
        //                   padding:
        //                       const EdgeInsets.symmetric(horizontal: 10.0),
        //                   child: Row(children: [
        //                     const Text(
        //                       'Edit',
        //                       style: TextStyle(color: Colors.blueAccent),
        //                     ),
        //                     const Spacer(),
        //                     IconButton(
        //                       onPressed: () {},
        //                       icon: const Icon(
        //                         Icons.edit_calendar,
        //                         color: Colors.blueAccent,
        //                       ),
        //                     )
        //                   ]),
        //                 ),
        //           if (model.mobile)
        //             const Padding(
        //               padding: EdgeInsets.symmetric(horizontal: 10.0),
        //               child: Text(
        //                 'Chats',
        //                 style: TextStyle(
        //                     fontSize: 25, fontWeight: FontWeight.bold),
        //               ),
        //             ),
        //           Padding(
        //             padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        //             child: Container(
        //               height: model.windows ? 38 : 28,
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(6),
        //                 border: Border.all(width: 0.3, color: Colors.grey),
        //               ),
        //               child: TextField(
        //                 decoration: InputDecoration(
        //                     label: model.windows
        //                         ? const Text('Search or start a new chat')
        //                         : const Text('Search'),
        //                     prefixIcon: const Icon(Icons.search),
        //                     border: InputBorder.none),
        //               ),
        //             ),
        //           ),
        //           model.windows == true
        //               ? const Divider(
        //                   thickness: 0.4,
        //                 )
        //               : Padding(
        //                   padding: const EdgeInsets.only(
        //                       left: 8.0, right: 8, top: 15),
        //                   child: Row(children: const [
        //                     Text(
        //                       'Broadcast Lists',
        //                       style: TextStyle(
        //                         color: Colors.blueAccent,
        //                       ),
        //                     ),
        //                     Spacer(),
        //                     Text(
        //                       'New Group',
        //                       style: TextStyle(
        //                         color: Colors.blueAccent,
        //                       ),
        //                     )
        //                   ]),
        //                 ),
        //           if (model.mobile)
        //             const Divider(
        //               thickness: 0.4,
        //             ),
        //           Expanded(
        //             child: ListView.builder(
        //               itemCount: 20,
        //               itemBuilder: (context, index) => Column(
        //                 children: const [
        //                   ChatItem(),
        //                   Divider(
        //                     indent: 50,
        //                     thickness: 0.4,
        //                   )
        //                 ],
        //               ),
        //             ),
        //           )
        //         ],
        //       ),
        //     ),
        //     if (model.windows)
        //       Expanded(
        //         flex: model.windows ? 8 : 0,
        //         child: Container(
        //           color: Colors.grey.withOpacity(0.05),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Container(
        //                 height: 250,
        //                 width: 250,
        //                 decoration: const BoxDecoration(
        //                   image: DecorationImage(
        //                     image: AssetImage(
        //                       'assets/images/no-connection.png',
        //                     ),
        //                     fit: BoxFit.cover,
        //                   ),
        //                 ),
        //               ),
        //               const Text(
        //                 'Keep your phone connected',
        //                 style: TextStyle(fontSize: 30),
        //               ),
        //               const SizedBox(
        //                 height: 20,
        //               ),
        //               const Text(
        //                 'WhatsApp connects to your phone to sync messages. To reduce data usage, connect your phone to Wi-Fi.',
        //                 style: TextStyle(fontSize: 15, color: Colors.grey),
        //                 textAlign: TextAlign.center,
        //               ),
        //             ],
        //           ),
        //         ),
        //       )
        //   ],
        // ),
        );
  }
}
