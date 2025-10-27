import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/supabase/supabase_services.dart';
import 'package:fruit_hub_dashboard/core/utils/constant.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorage implements SupabaseServices {
  static late Supabase _supabase;

  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }

  static createBucket(String bucketName) async {
    var response = await _supabase.client.storage.listBuckets();
    bool isBucketExit = false;

    for (var bucket in response) {
      if (bucket.name == bucketName) {
        isBucketExit = true;
        break;
      }
    }
    if (!isBucketExit) {
      return _supabase.client.storage.createBucket(bucketName);
    }
  }

  @override
  Future<String> uploadImage(File file, String path) {
    final fileName = p.basename(file.path);
    final extension = p.extension(file.path);
    var result = _supabase.client.storage
        .from(kBucket)
        .upload("path/$fileName.$extension", file);
    return result;
  }

  // final storageRef = FirebaseStorage.instance.ref();
  // @override
  // Future<String> uploadImage(File file, String path) async {
  //   final fileName = p.basename(file.path);

  //   final extension = p.extension(file.path);
  //   final fileRef = storageRef.child("path/$fileName.$extension");
  //   await fileRef.putFile(file);

  //   var fileUrl = await fileRef.getDownloadURL();
  //   return fileUrl;
  // }
}
