import 'package:url_launcher/url_launcher.dart';

// [이재은] 외부 앱 실행 유틸
class Launcher {
  Launcher._();

  // 이메일 보내기
  static Future<void> sendEmail({
    required String email,
    String? subject,
    String? body,
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: _buildQuery(subject: subject, body: body),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    }
  }

  // URL 열기
  static Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  // 쿼리 빌드
  static String? _buildQuery({String? subject, String? body}) {
    final params = <String, String>{};
    if (subject != null) params['subject'] = subject;
    if (body != null) params['body'] = body;

    if (params.isEmpty) return null;

    return params.entries
        .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
