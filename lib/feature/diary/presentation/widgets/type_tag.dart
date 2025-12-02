import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_colors.dart';
import 'package:my_travel_friend/theme/app_font.dart';

class TypeTag extends StatelessWidget {
  final String type;

  const TypeTag({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final Color tagColor = switch (type) {
      "MEMO" => AppColors.lightGreen.withOpacity(0.6),
      "MONEY" => AppColors.secondary.withOpacity(0.6),
      "PHOTO" => colorScheme.primary.withOpacity(0.6),
      "REVIEW" => colorScheme.tertiary.withOpacity(0.6),
      String() => throw UnimplementedError(),
    };

    return Container(
      decoration: BoxDecoration(
        color: tagColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(8.0),
        child: Text(type, style: AppFont.tiny),
      ),
    );
  }
}
