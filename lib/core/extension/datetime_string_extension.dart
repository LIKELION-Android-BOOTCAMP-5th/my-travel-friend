// [이재은] 날짜/시간 문자열 Extension

extension DateTimeStringExtension on String {
  // yyyy-MM-dd만 남기기
  String toDateOnly() {
    return split('T').first;
  }

  // 시간만 남기기
  String toTimeOnly() {
    try {
      final dt = DateTime.parse(this);
      final h = dt.hour.toString().padLeft(2, '0');
      final m = dt.minute.toString().padLeft(2, '0');
      return '$h:$m';
    } catch (e) {
      return '';
    }
  }

  // 같은 날인지 비교
  bool isSameDayAs(String other) {
    return toDateOnly() == other.toDateOnly();
  }
}
