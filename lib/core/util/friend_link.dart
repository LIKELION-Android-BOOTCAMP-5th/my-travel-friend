// 친구 추가 링크 만들기
const String kLandingBaseUrl = 'https://my-travel-friend1113.netlify.app';

String createInviteLink(int myUserId) {
  // 문자열 더하기보다 Uri로 만들면 실수(// 누락) 방지됨
  final base = Uri.parse(kLandingBaseUrl);

  final uri = base.replace(
    path: '/', // 루트 보장
    queryParameters: {'from': '$myUserId'},
  );

  return uri.toString();
}
