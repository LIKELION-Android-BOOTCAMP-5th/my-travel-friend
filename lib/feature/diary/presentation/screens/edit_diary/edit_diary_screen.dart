import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_travel_friend/core/widget/text_box.dart';
import 'package:my_travel_friend/feature/diary/presentation/widgets/public_select_box.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_font.dart';
import '../../../../../core/theme/app_icon.dart';
import '../../../../../core/widget/app_bar.dart';
import '../../../../../core/widget/bottom_sheat.dart';
import '../../../../../core/widget/button.dart';
import '../../../../../core/widget/toast_pop.dart';
import '../../../domain/entities/diary_entity.dart';
import '../../viewmodels/edit_diary/edit_diary_bloc.dart';
import '../../viewmodels/edit_diary/edit_diary_event.dart';
import '../../viewmodels/edit_diary/edit_diary_state.dart';
import '../../widgets/star_rating.dart';
import '../../widgets/type_tag.dart';

// [이재은] 다이어리 수정 화면

class EditDiaryScreen extends StatefulWidget {
  final DiaryEntity diary;

  const EditDiaryScreen({super.key, required this.diary});

  @override
  State<EditDiaryScreen> createState() => _EditDiaryScreenState();
}

class _EditDiaryScreenState extends State<EditDiaryScreen> {
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

    // 기존 데이터로 컨트롤러 초기화
    _titleController = TextEditingController(text: widget.diary.title ?? '');
    _contentController = TextEditingController(
      text: widget.diary.content ?? '',
    );
    _priceController = TextEditingController(
      text: widget.diary.cost?.toString() ?? '',
    );

    // Bloc에 기존 다이어리 로드
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EditDiaryBloc>().add(
        EditDiaryEvent.loadDiary(diary: widget.diary),
      );
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

    return BlocConsumer<EditDiaryBloc, EditDiaryState>(
      listener: _blocListener,
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            // 모드에 따른 배경 색 변경
            backgroundColor: isDark ? AppColors.navy : AppColors.darkerGray,
            appBar: CustomButtonAppBar(
              title: '다이어리 수정',
              leading: Button(
                width: 40,
                height: 40,
                icon: Icon(AppIcon.back),
                contentColor: isDark ? colorScheme.onSurface : AppColors.light,
                borderRadius: 20,
                onTap: () => context.pop(),
              ),
              actions: [
                Button(
                  text: '저장',
                  onTap: state.canSave && !state.isUploading
                      ? () => context.read<EditDiaryBloc>().add(
                          const EditDiaryEvent.updateDiary(),
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
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 제목
                        _buildTitleSection(context, state),
                        const SizedBox(height: 16),

                        // 내용
                        _buildContentSection(context, state),
                        const SizedBox(height: 16),

                        // 타입별 추가 입력필드
                        _buildTypeSpecificField(context, state),
                        const SizedBox(height: 24),

                        // 공개 비공개 여부
                        PublicSelectBox(
                          isPublic: state.isPublic,
                          onChanged: (value) {
                            context.read<EditDiaryBloc>().add(
                              EditDiaryEvent.changePublic(isPublic: value),
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
    );
  }

  void _blocListener(BuildContext context, EditDiaryState state) {
    if (state.pageState == EditDiaryPageState.success) {
      ToastPop.show(state.message ?? '다이어리가 수정되었습니다');
      context.pop(true); // 성공 시 true 반환
    }

    if (state.pageState == EditDiaryPageState.error) {
      ToastPop.show(state.message ?? '오류가 발생했습니다');
    }
  }

  // 제목 입력 파트
  Widget _buildTitleSection(BuildContext context, EditDiaryState state) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "제목",
                style: AppFont.regularBold.copyWith(
                  color: colorScheme.onSurface,
                ),
              ),
              TypeTag(diary: widget.diary),
            ],
          ),
        ),
        SizedBox(height: 8),
        TextBox(
          controller: _titleController,
          hintText: '제목을 입력하세요',
          onChanged: (value) {
            context.read<EditDiaryBloc>().add(
              EditDiaryEvent.changeTitle(title: value),
            );
          },
        ),
      ],
    );
  }

  // 내용 입력 파트
  Widget _buildContentSection(BuildContext context, EditDiaryState state) {
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
            context.read<EditDiaryBloc>().add(
              EditDiaryEvent.changeContent(content: value),
            );
          },
        ),
      ],
    );
  }

  // 타입별 추가 입력 필드
  Widget _buildTypeSpecificField(BuildContext context, EditDiaryState state) {
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
  Widget _buildRatingField(BuildContext context, EditDiaryState state) {
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
                context.read<EditDiaryBloc>().add(
                  EditDiaryEvent.changeRating(rating: rating),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 사진 업로드
  Widget _buildPhotoField(BuildContext context, EditDiaryState state) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    // 표시할 이미지가 있는지 확인
    final hasLocalImg = state.localImgFile != null;
    final hasServerImg = state.imgUrl != null && state.imgUrl!.isNotEmpty;

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

          if (hasLocalImg)
            _buildLocalImagePreview(context, state)
          else if (hasServerImg)
            _buildServerImagePreview(context, state)
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

  // 로컬 이미지 미리보기
  Widget _buildLocalImagePreview(BuildContext context, EditDiaryState state) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.file(
            state.localImgFile!,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        ..._buildImageButtons(context, colorScheme),
      ],
    );
  }

  // 서버 이미지 미리보기
  Widget _buildServerImagePreview(BuildContext context, EditDiaryState state) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            state.imgUrl!,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: double.infinity,
                height: 200,
                color: AppColors.darkerGray,
                child: const Center(child: CircularProgressIndicator()),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: double.infinity,
                height: 200,
                color: AppColors.darkerGray,
                child: const Center(child: Icon(AppIcon.alert)),
              );
            },
          ),
        ),
        ..._buildImageButtons(context, colorScheme),
      ],
    );
  }

  // 이미지 삭제/변경 버튼
  List<Widget> _buildImageButtons(
    BuildContext context,
    ColorScheme colorScheme,
  ) {
    return [
      // 삭제 버튼 (우측 상단)
      Positioned(
        top: 8,
        right: 8,
        child: GestureDetector(
          onTap: () {
            context.read<EditDiaryBloc>().add(const EditDiaryEvent.removeImg());
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
    ];
  }

  // 이미지 선택 바텀시트
  void _showImgPickerSheet(BuildContext context) {
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

      final compressedFile = await _compressImage(File(picked.path));

      if (compressedFile != null && mounted) {
        context.read<EditDiaryBloc>().add(
          EditDiaryEvent.selectImg(file: compressedFile),
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
  Widget _buildCostField(BuildContext context, EditDiaryState state) {
    final colorScheme = Theme.of(context).colorScheme;

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
          const SizedBox(height: 8),
          TextBox(
            hintText: '금액을 입력하세요',
            controller: _priceController,
            keyboardType: TextInputType.number,
            prefixDropdownItems: const ['카드', '현금'],
            prefixDropdownValue: state.payment,
            onPrefixDropdownChanged: (value) {
              if (value != null) {
                context.read<EditDiaryBloc>().add(
                  EditDiaryEvent.changePayment(payment: value),
                );
              }
            },
            suffixDropdownItems: const ['원', '엔', '동', '달러', '유로', '위안'],
            suffixDropdownValue: state.currency,
            onSuffixDropdownChanged: (value) {
              if (value != null) {
                context.read<EditDiaryBloc>().add(
                  EditDiaryEvent.changeCurrency(currency: value),
                );
              }
            },
            onChanged: (value) {
              final cost = int.tryParse(value.replaceAll(',', ''));
              context.read<EditDiaryBloc>().add(
                EditDiaryEvent.changeCost(cost: cost),
              );
            },
          ),
        ],
      ),
    );
  }
}
