// [이재은] 가격 표시에 대한 extension
extension NumberFormatExtension on int {
  // 천 단위 콤마 추가 (1000 → "1,000")
  String toCommaString() {
    return toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  // 원화 표시 (1000 → "1,000원")
  String toWon() {
    return '${toCommaString()}원';
  }
}
