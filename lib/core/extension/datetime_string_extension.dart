// [이재은] 날짜/시간 문자열 Extension

extension DateTimeStringExtension on String {
  // yyyy-MM-dd만 남기기
  String toDateOnly() {
    try {
      final dt = DateTime.parse(this).toLocal();
      return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')}';
    } catch (e) {
      return split('T').first;
    }
  }

  // 시간만 남기기
  String toTimeOnly() {
    try {
      final dt = DateTime.parse(this).toLocal();
      final h = dt.hour.toString().padLeft(2, '0');
      final m = dt.minute.toString().padLeft(2, '0');
      return '$h:$m';
    } catch (e) {
      return '';
    }
  }

  // 같은 날인지 비교
  bool isSameDayAs(String other) {
    try {
      final d1 = DateTime.parse(this).toLocal();
      final d2 = DateTime.parse(other).toLocal();
      return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
    } catch (e) {
      return toDateOnly() == other.toDateOnly();
    }
  }
}
