import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/routing/routes.dart';
import 'package:fruit_hub_dashboard/feature/add_product/ui/add_product_view.dart';
import 'package:fruit_hub_dashboard/feature/dashboard/ui/dashboard_view.dart';


class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.addProduct:
        return MaterialPageRoute(builder: (_) => const AddProductView());
      case Routes.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardView());
      default:
        return null;
    }
  }
}
