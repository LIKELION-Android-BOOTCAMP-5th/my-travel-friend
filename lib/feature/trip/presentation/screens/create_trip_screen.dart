import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_travel_friend/core/widget/bottom_sheat.dart';
import 'package:my_travel_friend/core/widget/text_box.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/create_trip/create_trip_bloc.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/create_trip/create_trip_event.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/create_trip/create_trip_state.dart';
import 'package:my_travel_friend/feature/trip/presentation/widgets/date_picker.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/button.dart';

class CreateTripScreen extends StatelessWidget {
  final int userId;
  final int? friendId;

  CreateTripScreen({super.key, required this.userId, this.friendId});

  final _titleController = TextEditingController();
  final _placeController = TextEditingController();

  String _two(int num) => num.toString().padLeft(2, "0");

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return BlocConsumer<CreateTripBloc, CreateTripState>(
      listener: (context, state) {
        // 생성 성공 처리
        if (state.pageState == CreateTripPageState.success) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message ?? "여행 생성 완료")));
          context.pop(true);
        }

        // 에러 처리
        if (state.pageState == CreateTripPageState.error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message ?? "")));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
          appBar: CustomButtonAppBar(
            leading: Button(
              width: 40,
              height: 40,
              icon: Icon(AppIcon.back),
              contentColor: isDark ? colorScheme.onSurface : AppColors.light,
              borderRadius: 20,
              onTap: () => context.pop(),
            ),
            title: "여행 계획 만들기",
            actions: [
              Button(
                width: 40,
                height: 40,
                icon:
                    state.isUploading ||
                        state.pageState == CreateTripPageState.loading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: state.isValid
                              ? Colors.white
                              : Colors.white.withOpacity(0.4),
                        ),
                      )
                    : AppIcon.save,
                contentColor: isDark ? colorScheme.onSurface : AppColors.light,
                borderRadius: 20,
                onTap: state.isValid
                    ? () => context.read<CreateTripBloc>().add(
                        const CreateTripEvent.createTrip(),
                      )
                    : null,
              ),
            ],
          ),
          body: Container(
            color: isDark ? AppColors.navy : AppColors.darkGray,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("여행 제목", style: AppFont.regular),
                        TextBox(
                          controller: _titleController,
                          hintText: "예: 제주도 힐링 여행",
                          onChanged: (text) {
                            context.read<CreateTripBloc>().add(
                              CreateTripEvent.changeTitle(title: text),
                            );
                          },
                        ),
                        const SizedBox(height: 16),

                        const Text("여행 장소", style: AppFont.regular),
                        TextBox(
                          controller: _placeController,
                          hintText: "예: 전주 한옥마을",
                          prefixIcon: const Icon(
                            Icons.place,
                            color: Colors.grey,
                          ),
                          onChanged: (text) {
                            context.read<CreateTripBloc>().add(
                              CreateTripEvent.changePlace(place: text),
                            );
                          },
                        ),
                        const SizedBox(height: 16),

                        const Text("여행 날짜", style: AppFont.regular),
                        Row(
                          children: [
                            Expanded(
                              child: DatePickerBox(
                                label: "시작일",
                                value: state.startAt,
                                // 시작일 선택
                                onTap: () async {
                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );

                                  if (picked != null) {
                                    final formatted =
                                        "${picked.year}-${_two(picked.month)}-${_two(picked.day)}";
                                    context.read<CreateTripBloc>().add(
                                      CreateTripEvent.changeStartAt(
                                        startAt: formatted,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: DatePickerBox(
                                label: "종료일",
                                value: state.endAt,
                                // 종료일 선택
                                onTap: () async {
                                  final startDate = state.startAt.isNotEmpty
                                      ? DateTime.parse(state.startAt)
                                      : DateTime.now();

                                  final DateTime? picked = await showDatePicker(
                                    context: context,
                                    initialDate: startDate,
                                    firstDate: startDate,
                                    lastDate: DateTime(2100),
                                  );

                                  if (picked != null) {
                                    final formatted =
                                        "${picked.year}-${_two(picked.month)}-${_two(picked.day)}";
                                    context.read<CreateTripBloc>().add(
                                      CreateTripEvent.changeEndAt(
                                        endAt: formatted,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        const Text("커버 타입", style: AppFont.regular),
                        Row(
                          children: [
                            _typeTab(
                              context,
                              "COLOR",
                              state.coverStyle == "COLOR",
                            ),
                            const SizedBox(width: 12),
                            _typeTab(
                              context,
                              "IMAGE",
                              state.coverStyle == "IMAGE",
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),

                        if (state.coverStyle == "COLOR") ...[
                          const Text(
                            "커버 색상",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          _colorPickSection(context),
                        ],

                        if (state.coverStyle == "IMAGE") ...[
                          const Text(
                            "커버 이미지",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          _imagePickSection(context, state),
                        ],

                        const SizedBox(height: 20),

                        _InfoBox(),
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

  Widget _typeTab(BuildContext context, String style, bool selected) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<CreateTripBloc>().add(
            CreateTripEvent.changeCoverStyle(style: style),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: selected
                ? colorScheme.primary
                : isDark
                ? AppColors.navy
                : AppColors.darkGray,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            style == "COLOR" ? "색상" : "이미지",
            style: AppFont.regular.copyWith(
              color: selected
                  ? colorScheme.onSurface
                  : isDark
                  ? AppColors.light
                  : AppColors.dark,
            ),
          ),
        ),
      ),
    );
  }

  Widget _colorPickSection(BuildContext context) {
    final bloc = context.read<CreateTripBloc>();
    final selectedColor = bloc.state.coverType;

    final colors = [
      {"key": "BLUE", "name": "스카이 블루"},
      {"key": "RED", "name": "코랄 레드"},
      {"key": "YELLOW", "name": "골드 옐로우"},
      {"key": "GREEN", "name": "그린"},
      {"key": "VIOLET", "name": "퍼플"},
      {"key": "PINK", "name": "핑크"},
    ];

    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 2.0,
      children: colors.map((item) {
        final key = item["key"] as String;
        final name = item["name"] as String;
        final selected = key == selectedColor;

        return GestureDetector(
          onTap: () {
            bloc.add(CreateTripEvent.changeCoverColor(color: key));
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            decoration: BoxDecoration(
              color: _convertColor(key),
              borderRadius: BorderRadius.circular(20),
              border: selected
                  ? Border.all(color: Colors.white, width: 2)
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.09),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _imagePickSection(BuildContext context, CreateTripState state) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      height: 180,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.onSurfaceVariant),
        borderRadius: BorderRadius.circular(10),
      ),
      child: state.localImgFile == null
          ? GestureDetector(
              onTap: () => _showImagePickerBottomSheet(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    AppIcon.image,
                    size: 32,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "이미지 선택",
                    style: AppFont.small.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            )
          : Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    state.localImgFile!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),

                /// ❌ 버튼 (이미지 제거)
                Positioned(
                  top: 6,
                  right: 6,
                  child: GestureDetector(
                    onTap: () {
                      context.read<CreateTripBloc>().add(
                        const CreateTripEvent.removeCoverImg(),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.navy : AppColors.darkGray,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Icon(
                        AppIcon.close,
                        size: 18,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Color _convertColor(String color) {
    switch (color) {
      case "BLUE":
        return AppColors.primaryLight;
      case "RED":
        return AppColors.secondary;
      case "YELLOW":
        return AppColors.tertiary;
      case "GREEN":
        return AppColors.lightGreen;
      case "VIOLET":
        return AppColors.lightPurple;
      case "PINK":
        return AppColors.lightPink;
      default:
        return AppColors.primaryLight;
    }
  }
}

class _InfoBox extends StatelessWidget {
  const _InfoBox();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.primary.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(AppIcon.crews, color: colorScheme.primary, size: 24),
            SizedBox(width: 24),
            Expanded(
              child: Text(
                "여행을 만들고 나서 크루를 초대하면 함께 일정을 계획할 수 있어요!",
                overflow: TextOverflow.visible,
                style: AppFont.regular.copyWith(
                  color: isDark ? AppColors.light : AppColors.dark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showImagePickerBottomSheet(BuildContext context) {
  CommonBottomSheet.show(
    context,
    sheetTitle: "이미지 선택 방식",
    actions: [
      BottomSheetAction(
        icon: const Icon(Icons.camera_alt),
        iconBgColor: AppColors.primaryLight,
        title: "사진 촬영",
        onTap: () async {
          final picker = ImagePicker();
          final picked = await picker.pickImage(source: ImageSource.camera);
          if (picked != null) {
            context.read<CreateTripBloc>().add(
              CreateTripEvent.selectCoverImg(file: File(picked.path)),
            );
          }
        },
      ),
      BottomSheetAction(
        icon: const Icon(Icons.photo_library),
        iconBgColor: AppColors.secondary,
        title: "앨범에서 선택",
        onTap: () async {
          final picker = ImagePicker();
          final picked = await picker.pickImage(source: ImageSource.gallery);
          if (picked != null) {
            context.read<CreateTripBloc>().add(
              CreateTripEvent.selectCoverImg(file: File(picked.path)),
            );
          }
        },
      ),
    ],
  );
}
