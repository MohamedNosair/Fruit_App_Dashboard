import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub_dashboard/core/di/get_it.dart';
import 'package:fruit_hub_dashboard/core/routing/app_router.dart';
import 'package:fruit_hub_dashboard/core/utils/bloc_observer.dart';
import 'package:fruit_hub_dashboard/core/utils/constant.dart';
import 'package:fruit_hub_dashboard/firebase_options.dart';
import 'package:fruit_hub_dashboard/fruit_hub_app_dashboard.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   setupGetIt();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  // await SupabaseStorage.initSupabase();
  runApp(FruitAppDashboard(appRouter: AppRouter()));
}
