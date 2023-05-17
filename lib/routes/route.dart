import 'package:fashion/routes/path.dart';
import 'package:fashion/src/modules/user/views/login/login_view.dart';
import 'package:fashion/src/modules/user/views/register/register_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  //constructor private
  AppRoutes._();

  static GlobalKey<NavigatorState>? navigator = GlobalKey<NavigatorState>();

  //handle push route
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPath:
        return MaterialPageRoute(builder: (_) => const LoginView());

      case signUpPath:
        return MaterialPageRoute(builder: (_) => const RegisterView());

      // case profilePath:
      //   return MaterialPageRoute(builder: (_) => const ProfileView());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }

  static void pop() => navigator!.currentState!.pop();

  static void pushNamed<T>(String path, {Object? arguments}) {
    navigator!.currentState!.pushNamed<T>(path, arguments: arguments);
  }
}
