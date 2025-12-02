import 'package:flutter/material.dart';

import '../../../../theme/app_font.dart';

// [이재은] 다이어리 소비 - 가격 표시 위젯
class CostTag extends StatelessWidget {
  final int cost;

  const CostTag({super.key, required this.cost});

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
          "${_formatCost(cost)}원",
          style: AppFont.regular.copyWith(
            color: isDark
                ? colorScheme.secondary
                : colorScheme.onSecondaryContainer,
          ),
        ),
      ),
    );
  }

  // 비용 포맷팅 (1000 → 1,000)
  String _formatCost(int cost) {
    return cost.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
