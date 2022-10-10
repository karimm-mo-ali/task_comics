import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task/features/CurrentComic/presentation/pages/current_comic_screen.dart';
import 'package:task/features/splash_screen.dart';
import '../../features/NextComic/presentation/pages/next_comic_screen.dart';
import '../../features/PreviousComic/presentation/pages/previous_comic_screen.dart';

////////////// features keys //////////////////////
const splashScreen = 'splashScreen';
const currentComicScreen = 'currentComicScreen';
const nextComicScreen = 'nextComicScreen';
const previousComicScreen = 'previousComicScreen';

class AppRoutes {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static Route<dynamic>? generatedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return createPageBuilder(const SplashScreen());
      case currentComicScreen:
        return createPageBuilder(const CurrentComicScreen());
      case nextComicScreen:
        return createPageBuilder(NextComicScreen(
          num: settings.arguments as int,
        ));
      case previousComicScreen:
        return createPageBuilder(PreviousComicScreen(
          num: settings.arguments as int,
        ));

      default:
        return null;
    }
  }

  static PageRouteBuilder createPageBuilder(Widget widget) {
    return PageTransition(
      child: widget,
      type: PageTransitionType.fade,
    );
  }
}
