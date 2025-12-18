import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';

import '../../../../core/theme/app_icon.dart';

// [이재은] 다이어리 소비 - 결제 수단 표시 위젯
class PaymentTag extends StatelessWidget {
  final String? payment;

  const PaymentTag({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    final isCard = payment == '카드';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Icon(
        isCard ? AppIcon.creditCard : AppIcon.cash,
        size: 14,
        color: isDark
            ? (isCard ? AppColors.light : colorScheme.tertiary)
            : (isCard ? AppColors.dark : AppColors.dark),
      ),
    );
  }
}
