import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsap_clone/firebase_options.dart';
import 'package:whatsap_clone/providers/mobile/about_provider.dart';
import 'package:whatsap_clone/screens/home.dart';
import 'package:whatsap_clone/screens/mobile/about_screen.dart';
import 'package:whatsap_clone/screens/mobile/profile_screen.dart';
import 'package:whatsap_clone/screens/mobile/story_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AboutScreenProvider(),
        ),
      ],
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          DefaultMaterialLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
        ],
        title: 'WhatsApp',
        theme: const CupertinoThemeData(
          barBackgroundColor: CupertinoDynamicColor.withBrightness(
            color: CupertinoColors.white,
            darkColor: CupertinoColors.black,
          ),
          brightness: Brightness.light,
        ),
        home: const HomeScreen(),
        routes: {
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          MobileAboutScreen.routeName: (context) => const MobileAboutScreen(),
          StoryScreen.routeName: (context) => const StoryScreen(),
        },
      ),
    );
  }
}
