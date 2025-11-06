import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:onway/ui/features/auth/widgets/auth_page.dart';

class UtilNavigation {
  static int transitionMillisecondsDebug = 500;
  static int transitionMillisecondsRelease = 500;
  static Route nextPageFromBottom({
    required Widget page,
    RouteSettings? settings,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: kDebugMode
          ? Duration(milliseconds: transitionMillisecondsDebug)
          : Duration(milliseconds: transitionMillisecondsRelease),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: page,
        );
      },
    );
  }

  static Route nextPageFromTop({
    required Widget page,
    RouteSettings? settings,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: kDebugMode
          ? Duration(milliseconds: transitionMillisecondsDebug)
          : Duration(milliseconds: transitionMillisecondsRelease),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, -1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: page,
        );
      },
    );
  }

  static Route nextPageFromRight({
    required Widget page,
    RouteSettings? settings,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: kDebugMode
          ? Duration(milliseconds: transitionMillisecondsDebug)
          : Duration(milliseconds: transitionMillisecondsRelease),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: page,
        );
      },
    );
  }

  static Route nextPageFromLeft({
    required Widget page,
    RouteSettings? settings,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: kDebugMode
          ? Duration(milliseconds: transitionMillisecondsDebug)
          : Duration(milliseconds: transitionMillisecondsRelease),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const end = Offset.zero;
        const begin = Offset(-1.0, 0.0);
        const curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: page,
        );
      },
    );
  }

  static Future<void> goToHome(
    BuildContext context, {
    bool veioDaTelaLogin = false,
  }) async {
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
        settings: const RouteSettings(name: '/home'),
      ),
      (route) => false,
    );
  }
}
