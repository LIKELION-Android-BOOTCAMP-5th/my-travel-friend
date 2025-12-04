// [이재은] URL에서 storage path 추출
extension ExtractUrlPathExtension on String {
  String? extractStoragePath(String bucketName) {
    try {
      final uri = Uri.parse(this);
      final segments = uri.pathSegments;

      final bucketIndex = segments.indexOf(bucketName);
      if (bucketIndex == -1 || bucketIndex >= segments.length - 1) {
        return null;
      }

      return segments.sublist(bucketIndex + 1).join('/');
    } catch (e) {
      return null;
    }
  }
}
