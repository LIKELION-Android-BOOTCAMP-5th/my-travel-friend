// [이재은] DateTime 관련 Extension

extension DateTimeExtension on DateTime {
  // 같은 날인지 비교
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  // 날짜 포맷: yyyy-MM-dd
  String toDateString() {
    final y = year.toString();
    final m = month.toString().padLeft(2, '0');
    final d = day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

  // 시간 포맷: 오전/오후 H:mm
  String toTimeString() {
    final hour = this.hour;
    final minute = this.minute.toString().padLeft(2, '0');
    final period = hour < 12 ? '오전' : '오후';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$period $displayHour:$minute';
  }

  // 시간 포맷 (24시간): HH:mm
  String toTimeString24() {
    final h = hour.toString().padLeft(2, '0');
    final m = minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}
