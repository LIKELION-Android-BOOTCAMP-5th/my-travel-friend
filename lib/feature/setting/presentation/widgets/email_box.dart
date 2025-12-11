import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/text_box.dart';
import '../../../../theme/app_font.dart';
import '../viewmodels/profile/profile_bloc.dart';
import '../viewmodels/profile/profile_state.dart';

// [이재은] 이메일 박스 위젯 (읽기 전용)
class EmailBox extends StatefulWidget {
  const EmailBox({super.key});

  @override
  State<EmailBox> createState() => _EmailBoxState();
}

class _EmailBoxState extends State<EmailBox> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (prev, curr) =>
          prev.originalProfile?.email != curr.originalProfile?.email,
      builder: (context, state) {
        // 이메일 업데이트
        final email = state.originalProfile?.email ?? '';
        if (_controller.text != email) {
          _controller.text = email;
        }

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '이메일',
                style: AppFont.regularBold.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 12),
              TextBox(
                controller: _controller,
                hintText: '이메일 없음',
                readOnly: true,
                enabled: false,
              ),
              const SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: Text(
                  '이메일은 변경할 수 없습니다',
                  style: AppFont.small.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
