import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  final SupabaseClient client;

  SupabaseStorageService(this.client);

  Future<String> uploadImage(File file, {required String bucketName}) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = '$timestamp.jpg';

    await client.storage.from(bucketName).upload(fileName, file);

    return client.storage.from(bucketName).getPublicUrl(fileName);
  }

  Future<void> deleteImage(
    String publicUrl, {
    required String bucketName,
  }) async {
    final baseUrl =
        'https://${client.storage.url.split('https://')[1]}/storage/v1/object/public/$bucketName/';
    final filePath = publicUrl.replaceFirst(baseUrl, '');

    await client.storage.from(bucketName).remove([filePath]);
  }
}
