import 'package:flutter/material.dart';

class PopUpBox extends StatelessWidget {
  final String title; // 팝업 제목
  final String message; // 팝업 내용

  final String leftText; // 왼쪽 버튼 텍스트
  final String rightText; // 오른쪽 버튼 텍스트

  final VoidCallback? onLeft; // 왼쪽 버튼 콜백
  final VoidCallback? onRight; // 오른쪽 버튼 콜백

  final bool showIcon;
  final Color iconColor;
  final IconData icon;

  final Color leftButtonColor;
  final Color? rightButtonColor;
  final Color? leftTextColor;
  final Color? rightTextColor;

  const PopUpBox({
    super.key,
    this.title = '제목',
    this.message = '내용',
    this.leftText = '취소',
    this.rightText = '확인',
    this.onLeft,
    this.onRight,

    // 아이콘 관련
    this.showIcon = true,
    this.iconColor = const Color(0xfff27b7b),
    this.icon = Icons.abc,

    // 버튼 색상 관련
    this.leftButtonColor = const Color(0xffF3F4F6),
    this.rightButtonColor = const Color(0xfff27b7b),
    this.leftTextColor = const Color(0xff030303),
    this.rightTextColor = const Color(0xff030303),
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 340, minWidth: 260),
        child: Material(
          color: colorScheme.surface, //배경 컬러
          elevation: 12,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showIcon) ...[
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: iconColor.withOpacity(0.15), //아이콘 배경
                    ),
                    child: Icon(
                      icon,
                      color: iconColor, //아이콘 컬러
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                /// 제목
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12),

                /// 내용
                Text(
                  message,
                  style: const TextStyle(
                    fontFamily: 'Pretendard',
                    height: 1.4,
                    color: Color(0xff2e2e2e),
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 24),

                /// 버튼 2개
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            onLeft?.call();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: leftButtonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            leftText,
                            style: TextStyle(
                              color: leftTextColor,
                              fontFamily: 'Pretendard',
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: SizedBox(
                        height: 44,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            onRight?.call();
                          },

                          style: TextButton.styleFrom(
                            backgroundColor: rightButtonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),

                          child: Text(
                            rightText,
                            style: TextStyle(
                              color: rightTextColor,
                              fontFamily: 'Pretendard',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
