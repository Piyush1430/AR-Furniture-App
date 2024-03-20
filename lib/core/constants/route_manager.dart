import 'package:flutter/material.dart';
import 'package:new_app/core/constants/string_manager.dart';
import 'package:new_app/features/home/presentation_layer/pages/deatils.dart';
import 'package:new_app/features/home/presentation_layer/pages/home_page.dart';

class RouteStringManager {
  static const String routeToHomePage = "/home-page";
  static const String routeToDeatilsPage = "/deatils-page";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteStringManager.routeToHomePage:
        {
          var screenSize = routeSettings.arguments as Size;
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) => HomePage(screenSize: screenSize),
          );
        }
      case RouteStringManager.routeToDeatilsPage:
        {
          final arg = routeSettings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            settings: routeSettings,
            builder: (_) =>
                DeatilsPage(pageHeight: arg["pH"], pageWidth: arg["pW"] ,product: arg["product"],),
          );
        }

      default:
        {
          return unDefinedRoute(routeSettings);
        }
    }
  }

  static Route<dynamic> unDefinedRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Scaffold(
              body: Center(
                child: Text(
                  AppStringManager.noRouteFound,
                  style: Theme.of(_).textTheme.headlineMedium,
                ),
              ),
            ));
  }
}
