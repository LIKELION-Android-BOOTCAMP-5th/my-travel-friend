import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_travel_friend/core/widget/text_box.dart';
import 'package:my_travel_friend/feature/diary/presentation/widgets/public_select_box.dart';
import 'package:my_travel_friend/feature/diary/presentation/widgets/schedule_picker_button.dart';
import 'package:my_travel_friend/theme/app_font.dart';

import '../../../../theme/app_colors.dart';
import '../../../../theme/app_icon.dart';
import '../viewmodels/new_diary_bloc.dart';
import '../viewmodels/new_diary_event.dart';
import '../viewmodels/new_diary_state.dart';
import '../widgets/star_rating.dart';
import '../widgets/type_button.dart';

// [이재은] 새로운 다이어리 작성 화면

class NewDiaryScreen extends StatefulWidget {
  final int tripId;
  final int userId;

  const NewDiaryScreen({super.key, required this.tripId, required this.userId});

  @override
  State<NewDiaryScreen> createState() => _NewDiaryScreenState();
}

class _NewDiaryScreenState extends State<NewDiaryScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late TextEditingController _priceController;
  late TextEditingController _imgController;

  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    _priceController = TextEditingController();
    _imgController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<NewDiaryBloc>().initialize(
        tripId: widget.tripId,
        userId: widget.userId,
      );
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _priceController.dispose();
    _imgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return BlocConsumer<NewDiaryBloc, NewDiaryState>(
      listener: _blocListener,
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: Scaffold(
              // 모드에 따른 배경 색 변경
              backgroundColor: isDark ? AppColors.navy : AppColors.darkerGray,
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? colorScheme.surfaceContainerHighest
                          : AppColors.lightGray,
                      borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 타입 버튼
                          _buildTypeTabs(context, state),
                          const SizedBox(height: 16),

                          // 제목
                          _buildTitleSection(context, state),
                          const SizedBox(height: 16),

                          //내용
                          _buildContentSection(context, state),
                          const SizedBox(height: 16),

                          // 타입별 추가 입력필드
                          _buildTypeSpecificField(context, state),
                          SizedBox(height: 16),

                          //공개 비공개 여부
                          PublicSelectBox(
                            isPublic: state.isPublic,
                            onChanged: (value) {
                              context.read<NewDiaryBloc>().add(
                                NewDiaryEvent.changePublic(isPublic: value),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _blocListener(BuildContext context, NewDiaryState state) {
    if (state.pageState == NewDiaryPageState.success) {}
  }

  // 제목 입력 파트
  Widget _buildTitleSection(BuildContext context, NewDiaryState state) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
              child: Text(
                "제목",
                style: AppFont.regularBold.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
            ),
            SchedulePickerButton(onTap: () {}),
          ],
        ),
        SizedBox(height: 8),
        TextBox(
          controller: _titleController,
          hintText: '제목을 입력하세요',
          onChanged: (value) {
            context.read<NewDiaryBloc>().add(
              NewDiaryEvent.changeTitle(title: value),
            );
          },
        ),
      ],
    );
  }

  // 내용 입력 파트
  Widget _buildContentSection(BuildContext context, NewDiaryState state) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
          child: Text(
            "내용",
            style: AppFont.regularBold.copyWith(color: colorScheme.onSurface),
          ),
        ),
        SizedBox(height: 8),
        TextBox(
          controller: _contentController,
          maxLines: 30,
          minLines: 6,
          hintText: '내용을 입력하세요',
          onChanged: (value) {
            context.read<NewDiaryBloc>().add(
              NewDiaryEvent.changeContent(content: value),
            );
          },
        ),
      ],
    );
  }

  // 타입 선택 탭
  Widget _buildTypeTabs(BuildContext context, NewDiaryState state) {
    final colorScheme = Theme.of(context).colorScheme;

    final types = [
      ('MEMO', AppIcon.memo, '메모', AppColors.lightGreen),
      ('REVIEW', AppIcon.star, '리뷰', colorScheme.tertiary),
      ('PHOTO', AppIcon.camera, '사진', colorScheme.primary),
      ('MONEY', AppIcon.money, '소비', colorScheme.secondary),
    ];

    return Row(
      children: types.map((typeData) {
        final (type, icon, label, color) = typeData;
        final isSelected = state.type == type;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: type != 'MONEY' ? 6.0 : 0),
            child: TypeButton(
              type: type,
              icon: icon,
              label: label,
              color: color,
              isSelected: isSelected,
              onTap: () {
                context.read<NewDiaryBloc>().add(
                  NewDiaryEvent.changeType(type: type),
                );
              },
            ),
          ),
        );
      }).toList(),
    );
  }

  // 타입별 추가 입력 필드
  Widget _buildTypeSpecificField(BuildContext context, NewDiaryState state) {
    switch (state.type) {
      case 'REVIEW':
        return _buildRatingField(context, state);
      case 'PHOTO':
        return _buildPhotoField(context, state);
      case 'MONEY':
        return _buildCostField(context, state);
      default:
        return const SizedBox.shrink();
    }
  }

  // 별점 필드
  Widget _buildRatingField(context, state) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "별점",
            style: AppFont.regularBold.copyWith(color: colorScheme.onSurface),
          ),
          SizedBox(height: 8),
          Center(
            child: StarRating(
              rating: state.rating,
              starSize: 45,
              starSpacing: 13,
              onRatingChanged: (rating) {
                context.read<NewDiaryBloc>().add(
                  NewDiaryEvent.changeRating(rating: rating),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 사진 업로드
  Widget _buildPhotoField(context, text) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "사진 업로드",
            style: AppFont.regularBold.copyWith(color: colorScheme.onSurface),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppColors.navy : AppColors.darkerGray,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
              width: 60,
              height: 60,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(AppIcon.upload, color: colorScheme.onSurface),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 금액 입력
  Widget _buildCostField(BuildContext context, NewDiaryState state) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "금액",
            style: AppFont.regularBold.copyWith(color: colorScheme.onSurface),
          ),
          SizedBox(height: 8),
          TextBox(
            hintText: '금액을 입력하세요',
            controller: _priceController,
            keyboardType: TextInputType.number,
            suffix: '원',
            suffixStyle: AppFont.regularBold.copyWith(
              color: colorScheme.onSurface,
            ),
            onChanged: (value) {
              final cost = int.tryParse(value.replaceAll(',', ''));
              context.read<NewDiaryBloc>().add(
                NewDiaryEvent.changeCost(cost: cost),
              );
            },
          ),
        ],
      ),
    );
  }
}
