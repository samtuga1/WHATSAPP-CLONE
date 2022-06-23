import 'package:flutter/material.dart';
import 'package:whatsap_clone/screens/home.dart';
import 'package:whatsap_clone/screens/mobile/profile_screen.dart';

class CustomPageRouter extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  CustomPageRouter({
    required this.child,
    required this.direction,
    RouteSettings? settings,
  }) : super(
            transitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) => child,
            settings: settings);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: getBeginOffset(),
          end: Offset.zero,
        ).animate(animation),
      );

  Offset getBeginOffset() {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ProfileScreen.routeName:
        return CustomPageRouter(
          child: const ProfileScreen(),
          direction: AxisDirection.left,
          settings: settings,
        );
      default:
        return CustomPageRouter(
          child: const HomeScreen(),
          direction: AxisDirection.right,
          settings: settings,
        );
    }
  }
}
