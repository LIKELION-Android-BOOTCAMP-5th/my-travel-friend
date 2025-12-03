import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_icon.dart';
import '../viewmodels/diary_bloc.dart';

// [이재은] 새로운 다이어리 작성 화면

class NewDiaryScreen extends StatelessWidget {
  final int diaryId;

  const NewDiaryScreen({super.key, required this.diaryId});

  static const List<String> _diaryTypes = ['MEMO', 'REVIEW', 'PHOTO', 'MONEY'];

  static const List<String> _typeLabels = ['메모', '리뷰', '사진', '소비'];

  static const List<Icon> _typeIcons = [
    Icon(AppIcon.memo),
    Icon(AppIcon.star),
    Icon(AppIcon.camera),
    Icon(AppIcon.money),
  ];

  @override
  Widget build(BuildContext context) {
    final diaryBloc = BlocProvider.of<DiaryBloc>(context);
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        // 모드에 따른 배경 색 변경
        backgroundColor: isDark ? AppColors.navy : AppColors.lessLight,
        body: Padding(padding: const EdgeInsets.all(16.0), child: Column()),
      ),
    );
  }
}
