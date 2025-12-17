import 'package:flutter/material.dart';

import '../../../../core/extension/cost_format_extension.dart';
import '../../../../core/theme/app_font.dart';

// [이재은] 다이어리 소비 - 가격 표시 위젯
class CostTag extends StatelessWidget {
  final int cost;
  final String? currency;

  const CostTag({super.key, required this.cost, this.currency});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.secondary.withOpacity(0.25),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Text(
          _formatCost(),
          style: AppFont.regular.copyWith(
            color: isDark
                ? colorScheme.secondary
                : colorScheme.onSecondaryContainer,
          ),
        ),
      ),
    );
  }

  String _formatCost() {
    // currency가 없거나 '원'이면 toWon() 사용
    if (currency == null || currency == '원') {
      return cost.toWon();
    }

    // 다른 통화면 숫자 + 통화 단위
    final formatted = cost.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
    return '$formatted $currency';
  }
}
