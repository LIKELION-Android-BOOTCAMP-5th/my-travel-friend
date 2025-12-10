import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_travel_friend/feature/setting/presentation/viewmodels/profile_bloc.dart';
import 'package:my_travel_friend/feature/setting/presentation/viewmodels/profile_state.dart';

import '../../../../core/widget/bottom_sheat.dart';
import '../../../../core/widget/profile_img.dart';
import '../../../../theme/app_icon.dart';
import '../viewmodels/profile_event.dart';

// [이재은] 프로필 이미지 설정 박스
class ProfileImgBox extends StatefulWidget {
  const ProfileImgBox({super.key});

  @override
  State<ProfileImgBox> createState() => _ProfileImgBoxState();
}

class _ProfileImgBoxState extends State<ProfileImgBox> {
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (prev, curr) =>
          prev.displayImage != curr.displayImage ||
          prev.isUploading != curr.isUploading,
      builder: (context, state) {
        final displayImage = state.displayImage;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 32),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Stack(
              children: [
                // 프로필 이미지
                ProfileImg(
                  imageUrl: displayImage is String ? displayImage : null,
                  imageFile: displayImage is File ? displayImage : null,
                  radius: 60,
                ),
                // 카메라 버튼
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () => _showImgOptions(context, state),
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            AppIcon.camera,
                            color: colorScheme.onPrimary,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 이미지 옵션 바텀시트
  void _showImgOptions(BuildContext context, ProfileState state) {
    final colorScheme = Theme.of(context).colorScheme;
    final hasImage = state.displayImage != null;

    final actions = <BottomSheetAction>[
      BottomSheetAction(
        icon: const Icon(Icons.photo_library_outlined),
        iconBgColor: colorScheme.primary,
        title: '갤러리에서 선택',
        onTap: () => _pickImage(ImageSource.gallery),
      ),
      BottomSheetAction(
        icon: const Icon(Icons.camera_alt_outlined),
        iconBgColor: colorScheme.secondary,
        title: '카메라로 촬영',
        onTap: () => _pickImage(ImageSource.camera),
      ),
      if (hasImage)
        BottomSheetAction(
          icon: const Icon(Icons.delete_outline),
          iconBgColor: colorScheme.tertiary,
          title: '이미지 삭제',
          onTap: () {
            context.read<ProfileBloc>().add(const ProfileEvent.removeImg());
          },
        ),
    ];

    CommonBottomSheet.show(context, sheetTitle: '프로필 사진', actions: actions);
  }

  // 이미지 선택
  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: source,
        maxWidth: 800,
        maxHeight: 800,
        imageQuality: 85,
      );

      if (picked != null && mounted) {
        context.read<ProfileBloc>().add(
          ProfileEvent.selectImg(file: File(picked.path)),
        );
      }
    } catch (e) {
      debugPrint('이미지 선택 오류: $e');
    }
  }
}
