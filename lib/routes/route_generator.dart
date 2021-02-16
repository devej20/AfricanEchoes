import 'package:african_echoes/pages/page.dart';
import 'package:african_echoes/routes/routes.dart';

import 'package:african_echoes/widget/see_all_books.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case loginRoute:
        return MaterialPageRoute(
            builder: (_) => LoginPage(
                  userRepository: args,
                ));
        break;
      case registrationRoute:
        return MaterialPageRoute(
            builder: (_) => RegisterPage(
                  userRepository: args,
                ));
        break;

      case landingRoute:
        return MaterialPageRoute(
            builder: (_) => LandingPage(
                  userRepository: args,
                ));
        break;
      case bookRoute:
        return MaterialPageRoute(builder: (_) => SeeAllBooks());
        break;
      default:
    }
  }
}
