import 'package:flutter/material.dart';
import 'package:fruit_hub_dashboard/core/routing/app_router.dart';
import 'package:fruit_hub_dashboard/core/supabase/supabase_storage.dart';
import 'package:fruit_hub_dashboard/fruit_hub_app_dashboard.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseStorage.initSupabase();
  runApp(FruitAppDashboard(appRouter: AppRouter()));
}
