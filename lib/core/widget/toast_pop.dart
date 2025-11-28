import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_travel_friend/theme/app_colors.dart';

// [이재은] 토스트 팝업 디자인
// -> 추후에 테마 관련 해서 색상 변경 해야 할 수도 있음

class ToastPop {
  static void show(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.navyOutline,
      fontSize: 14.0,
      textColor: AppColors.light,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
