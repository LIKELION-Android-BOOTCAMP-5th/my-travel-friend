import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/DI/injection.dart';
import '../../domain/entities/diary_entity.dart';
import '../viewmodels/edit_diary_bloc.dart';
import 'edit_diary_screen.dart';

// [이재은] 다이어리 수정 화면을 감싸는 위젯
// - EditDiaryBloc 제공
// - 생성 성공 시 true 반환하여 호출한 쪽에서 목록 새로고침

class EditDiaryBlocWidget extends StatelessWidget {
  final DiaryEntity diary; // DiaryEntity 전체를 받음

  const EditDiaryBlocWidget({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<EditDiaryBloc>(),
      child: EditDiaryScreen(diary: diary),
    );
  }
}
