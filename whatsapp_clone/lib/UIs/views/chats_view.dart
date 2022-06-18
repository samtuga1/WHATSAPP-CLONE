import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/view_models/chats_view_model.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatsViewModel>.reactive(
      viewModelBuilder: () => ChatsViewModel(),
      builder: (context, model, _) => Scaffold(),
    );
  }
}
