import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/text_box.dart';
import '../../../../theme/app_font.dart';
import '../viewmodels/profile_bloc.dart';
import '../viewmodels/profile_event.dart';
import '../viewmodels/profile_state.dart';
import 'nickname_extension.dart';

// [이재은] 닉네임 카드 위젯
class NicknameBox extends StatefulWidget {
  const NicknameBox({super.key});

  @override
  State<NicknameBox> createState() => _NicknameBoxState();
}

class _NicknameBoxState extends State<NicknameBox> {
  final TextEditingController _controller = TextEditingController();
  bool _isUserEditing = false;

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
          prev.nickname != curr.nickname ||
          prev.nicknameStatus != curr.nicknameStatus,
      builder: (context, state) {
        final status = state.nicknameStatus;

        // 사용자가 직접 입력 중이 아닐 때만 컨트롤러 업데이트
        if (!_isUserEditing && _controller.text != state.nickname) {
          _controller.text = state.nickname;
          _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: _controller.text.length),
          );
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
                '닉네임',
                style: AppFont.regularBold.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 12),
              TextBox(
                controller: _controller,
                hintText: '닉네임을 입력해주세요',
                maxLength: 10,
                onChanged: (value) {
                  context.read<ProfileBloc>().add(
                    ProfileEvent.changeNickname(nickname: value),
                  );
                },
                focusedBorderColor: status.hasError
                    ? colorScheme.error
                    : colorScheme.primary,
                suffixIcon: state.nicknameStatus == NicknameStatus.checking
                    ? const Padding(
                        padding: EdgeInsets.all(12),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      )
                    : null,
              ),
              const SizedBox(height: 4),
              // 에러 메시지
              if (status.hasError)
                Text(
                  status.errorMessage!,
                  style: AppFont.small.copyWith(color: colorScheme.secondary),
                ),
            ],
          ),
        );
      },
    );
  }
}
