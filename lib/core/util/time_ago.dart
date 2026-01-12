// [이재은] 날짜와 시간 관련 어플
// -> 현재 시각으로부터 n분전, n시간 전, n일 전,
// -> 4일이 넘어간 순간부터는 날짜(yyyy-MM-dd)로 표기

class TimeAgo {
  static String getTimeAgo(String timestampzString) {
    DateTime timestamp = DateTime.parse(timestampzString);
    timestamp = timestamp.toLocal();

    final DateTime now = DateTime.now();

    final Duration difference = now.difference(timestamp);

    if (difference.inDays >= 4) {
      // 4일 이상이면 날짜로 표시
      return '${timestamp.year}.${timestamp.month.toString().padLeft(2, '0')}.${timestamp.day.toString().padLeft(2, '0')}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}일 전';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}시간 전';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}분 전';
    } else {
      return '방금 전';
    }
  }
}
