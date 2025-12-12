import 'package:flutter/material.dart';

import '../../../../core/extension/datetime_string_extension.dart';

// [이재은] 날짜 구분선 위젯

class ChatDateDivider extends StatelessWidget {
  final String? dateString;

  const ChatDateDivider({super.key, required this.dateString});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              dateString?.toDateOnly() ?? '',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[500],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
        ],
      ),
    );
  }
}
