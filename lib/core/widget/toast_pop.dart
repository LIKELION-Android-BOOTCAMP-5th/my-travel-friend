import 'package:fluttertoast/fluttertoast.dart';

import '../theme/app_colors.dart';

// [이재은] 토스트 팝업 디자인

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
