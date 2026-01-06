// 친구 추가 링크 만들기
const String kLandingBaseUrl = 'https://my-travel-friend1113.netlify.app';

String createInviteLink(int myUserId) {
  final base = Uri.parse(kLandingBaseUrl);

  final uri = base.replace(
    path: '/', // 루트 보장
    queryParameters: {'from': '$myUserId'},
  );

  return uri.toString();
}
