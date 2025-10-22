import 'dart:io';

import 'package:fruit_hub_dashboard/core/supabase/supabase_services.dart';
import 'package:fruit_hub_dashboard/core/utils/constant.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorage implements SupabaseServices {
  final supabase = Supabase.instance.client;
  static late Supabase _supabase;

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );

    //!Create new bucket
    // final String bucketId = await _supabase.client.storage.createBucket(
    //   'ahmed',
    // );
  }

  @override
  Future<String> uploadImage(String imagePath, String path) async {
    final file = File(imagePath);
    final storageResponse = await supabase.storage
        .from(path)
        .upload(imagePath, file);

    return storageResponse;
  }
}
