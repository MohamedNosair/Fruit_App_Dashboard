import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruit_hub_dashboard/core/supabase/supabase_services.dart';
import 'package:path/path.dart' as p;

class SupabaseStorage implements SupabaseServices {
  final storageRef = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadImage(File file, String path) async {
    final fileName = p.basename(file.path);

    final extension = p.extension(file.path);
    final fileRef = storageRef.child("path/$fileName.$extension");
    await fileRef.putFile(file);

    var   fileUrl = await fileRef.getDownloadURL();
    return fileUrl;
  }
}
