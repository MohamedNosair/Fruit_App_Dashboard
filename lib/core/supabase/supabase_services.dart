import 'dart:io';

abstract class SupabaseServices {
  Future<String> uploadImage(File file, String path);
}
