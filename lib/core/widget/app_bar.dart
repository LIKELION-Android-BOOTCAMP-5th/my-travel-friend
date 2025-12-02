import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/widget/button.dart';
import 'package:my_travel_friend/theme/app_colors.dart';
import 'package:my_travel_friend/theme/app_font.dart';

// 신강현
// 앱바 완성했습니다
class CustomButtonAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  //앱바 화면 제목
  final String title;

  //뒤로가기 버튼
  final Button? leading;

  //오른쪽에 나올 버튼 -> 리스트로 여러개 표현 가능
  final List<Button> actions;

  const CustomButtonAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions = const [], // 기본값: 빈 리스트(버튼 없음)
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height, // AppBar 높이 고정
        color: AppColors.primaryLight,
        padding: const EdgeInsets.symmetric(horizontal: 12), // 좌우 여백
        child: Row(
          // 가로 배치
          children: [
            //사용자가 버튼 넣어주면 출력
            if (leading != null) leading!,

            if (leading != null) const SizedBox(width: 8), // 버튼 & 타이틀 간격
            Expanded(
              child: Text(
                title,
                style: AppFont.hugeBold.copyWith(color: AppColors.light),
              ),
            ),

            //actions에 있는 버튼들 랜더링
            ...actions.map(
              (btn) => Padding(
                padding: const EdgeInsets.only(left: 6), // 버튼 사이 간격
                child: btn,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 앱바 높이를 플러터로 전달하기 위해서 미리 준비한 것
  @override
  Size get preferredSize => const Size.fromHeight(56);
}
