import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/routing/routes.dart';
import 'package:fruit_hub_dashboard/feature/dashboard/ui/dashboard.dart';


class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => const Dashboard());
      default:
        return null;
    }
  }
}
