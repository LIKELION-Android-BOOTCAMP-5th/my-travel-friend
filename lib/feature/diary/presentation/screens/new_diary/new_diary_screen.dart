import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_travel_friend/core/widget/text_box.dart';
import 'package:my_travel_friend/feature/diary/presentation/widgets/public_select_box.dart';
import 'package:my_travel_friend/feature/diary/presentation/widgets/schedule_picker_button.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font.dart';
import '../../../../../core/theme/app_icon.dart';
import '../../../../../core/widget/app_bar.dart';
import '../../../../../core/widget/bottom_sheat.dart';
import '../../../../../core/widget/button.dart';
import '../../../../../core/widget/toast_pop.dart';
import '../../viewmodels/new_diary/new_diary_bloc.dart';
import '../../viewmodels/new_diary/new_diary_event.dart';
import '../../viewmodels/new_diary/new_diary_state.dart';
import '../../widgets/schedule_picker_pop_up.dart';
import '../../widgets/star_rating.dart';
import '../../widgets/type_button.dart';

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

  final ImagePicker _imagePicker = ImagePicker();

  static const int _maxWidth = 1024;
  static const int _maxHeight = 1024;
  static const int _quality = 80;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    _priceController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<NewDiaryBloc>().initialize(
          tripId: widget.tripId,
          userId: widget.userId,
        );
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return MultiBlocListener(
      listeners: [
        // 리스너 1: 성공/에러 처리
        BlocListener<NewDiaryBloc, NewDiaryState>(
          listenWhen: (prev, curr) => prev.pageState != curr.pageState,
          listener: (context, state) {
            if (state.pageState == NewDiaryPageState.success) {
              ToastPop.show(state.message ?? '다이어리를 작성했습니다');
              context.pop(true);
            }
            if (state.pageState == NewDiaryPageState.error) {
              ToastPop.show(state.message ?? '오류가 발생했습니다');
            }
          },
        ),
        // 리스너 2: 스케줄 로드 완료 시 팝업 표시
        BlocListener<NewDiaryBloc, NewDiaryState>(
          listenWhen: (prev, curr) =>
              prev.isLoadingSchedules && !curr.isLoadingSchedules,
          listener: (context, state) async {
            final schedule = await SchedulePickerPopup.show(
              context,
              schedules: state.schedules,
            );

            if (schedule != null && mounted) {
              _titleController.text = schedule.title;
              context.read<NewDiaryBloc>().add(
                ChangeTitle(title: schedule.title),
              );
              context.read<NewDiaryBloc>().add(
                ChooseSchedule(scheduleId: schedule.id),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<NewDiaryBloc, NewDiaryState>(
        builder: (context, state) {
          return GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              backgroundColor: isDark ? AppColors.navy : AppColors.darkerGray,
              appBar: CustomButtonAppBar(
                title: '다이어리 작성',
                leading: Button(
                  width: 40,
                  height: 40,
                  icon: Icon(AppIcon.back),
                  contentColor: isDark
                      ? colorScheme.onSurface
                      : AppColors.light,
                  borderRadius: 20,
                  onTap: () => context.pop(),
                ),
                actions: [
                  Button(
                    text: '저장',
                    onTap: state.canSave && !state.isUploading
                        ? () => context.read<NewDiaryBloc>().add(
                            const CreateDiary(),
                          )
                        : null,
                    height: 36,
                    backgroundColor: Colors.transparent,
                    contentColor: AppColors.light,
                    borderRadius: 18,
                    width: 36,
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDark
                          ? colorScheme.surfaceContainerHighest
                          : AppColors.lightGray,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTypeTabs(context, state),
                          const SizedBox(height: 16),
                          _buildTitleSection(context, state),
                          const SizedBox(height: 16),
                          _buildContentSection(context, state),
                          const SizedBox(height: 16),
                          _buildTypeSpecificField(context, state),
                          const SizedBox(height: 24),
                          PublicSelectBox(
                            isPublic: state.isPublic,
                            onChanged: (value) {
                              context.read<NewDiaryBloc>().add(
                                ChangePublic(isPublic: value),
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
          );
        },
      ),
    );
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
            SchedulePickerButton(
              context: context,
              onTap: () async {
                // 먼저 스케줄 로드
                context.read<NewDiaryBloc>().add(const LoadSchedules());
              },
            ),
          ],
        ),
        const SizedBox(height: 8),
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
      children: [
        for (int i = 0; i < types.length; i++) ...[
          Expanded(
            child: TypeButton(
              type: types[i].$1,
              icon: types[i].$2,
              label: types[i].$3,
              color: types[i].$4,
              isSelected: state.type == types[i].$1,
              onTap: () {
                context.read<NewDiaryBloc>().add(
                  NewDiaryEvent.changeType(type: types[i].$1),
                );
              },
            ),
          ),
          if (i < types.length - 1) const SizedBox(width: 6),
        ],
      ],
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
  Widget _buildRatingField(BuildContext context, NewDiaryState state) {
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
  Widget _buildPhotoField(BuildContext context, NewDiaryState state) {
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
          const SizedBox(height: 8),

          // 이미지가 있으면 미리보기, 없으면 업로드 버튼
          if (state.localImgFile != null)
            _buildImagePreview(context, state)
          else
            GestureDetector(
              onTap: () => _showImgPickerSheet(context),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark ? AppColors.navy : AppColors.darkerGray,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                width: 80,
                height: 80,
                child: Center(
                  child: Icon(AppIcon.upload, color: colorScheme.onSurface),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // 이미지 미리보기 + 삭제/변경 버튼
  Widget _buildImagePreview(BuildContext context, NewDiaryState state) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        // 이미지 미리보기
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.file(
            state.localImgFile!,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),

        // 삭제 버튼 (우측 상단)
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: () {
              context.read<NewDiaryBloc>().add(const NewDiaryEvent.removeImg());
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.dark.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(AppIcon.close, color: AppColors.light, size: 20),
            ),
          ),
        ),

        // 변경 버튼 (우측 하단)
        Positioned(
          bottom: 8,
          right: 8,
          child: GestureDetector(
            onTap: () => _showImgPickerSheet(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(AppIcon.camera, color: AppColors.light, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '변경',
                    style: AppFont.small.copyWith(color: AppColors.light),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // 이미지 선택 바텀시트
  void _showImgPickerSheet(context) {
    final colorScheme = Theme.of(context).colorScheme;

    CommonBottomSheet.show(
      context,
      sheetTitle: '사진 업로드',
      actions: [
        BottomSheetAction(
          icon: const Icon(AppIcon.camera),
          iconBgColor: colorScheme.primary,
          title: '새로 찍기',
          onTap: () => _pickImg(ImageSource.camera),
        ),
        BottomSheetAction(
          icon: const Icon(AppIcon.image),
          iconBgColor: colorScheme.secondary,
          title: '앨범에서 선택',
          onTap: () => _pickImg(ImageSource.gallery),
        ),
      ],
    );
  }

  // 이미지 선택 + 압축
  Future<void> _pickImg(ImageSource source) async {
    try {
      final XFile? picked = await _imagePicker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1920,
      );

      if (picked == null) return;

      // 압축
      final compressedFile = await _compressImage(File(picked.path));

      if (compressedFile != null && mounted) {
        context.read<NewDiaryBloc>().add(
          NewDiaryEvent.selectImg(file: compressedFile),
        );
      }
    } catch (e) {
      ToastPop.show('이미지 선택 실패: $e');
    }
  }

  // 이미지 압축
  Future<File?> _compressImage(File file) async {
    try {
      final dir = await getTemporaryDirectory();
      final targetPath = path.join(
        dir.path,
        'compressed_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );

      final Uint8List? compressedBytes =
          await FlutterImageCompress.compressWithFile(
            file.absolute.path,
            minWidth: _maxWidth,
            minHeight: _maxHeight,
            quality: _quality,
            format: CompressFormat.jpeg,
          );

      if (compressedBytes == null) return null;

      final compressedFile = File(targetPath);
      await compressedFile.writeAsBytes(compressedBytes);

      return compressedFile;
    } catch (e) {
      ToastPop.show('이미지 압축 실패');
      return null;
    }
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
            prefixDropdownItems: const ['카드', '현금'],
            prefixDropdownValue: state.payment,
            onPrefixDropdownChanged: (value) {
              if (value != null) {
                context.read<NewDiaryBloc>().add(
                  NewDiaryEvent.changePayment(payment: value),
                );
              }
            },
            suffixDropdownItems: ['원', '엔', '동', '달러', '유로', '위안'],
            suffixDropdownValue: state.currency,
            onSuffixDropdownChanged: (value) {
              if (value != null) {
                context.read<NewDiaryBloc>().add(
                  NewDiaryEvent.changeCurrency(currency: value),
                );
              }
            },
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
