import 'package:stacked_services/stacked_services.dart';
import '../UIs/views/chats_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: <MaterialRoute>[MaterialRoute(initial: true, page: ChatsView)],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class App_setup {}
