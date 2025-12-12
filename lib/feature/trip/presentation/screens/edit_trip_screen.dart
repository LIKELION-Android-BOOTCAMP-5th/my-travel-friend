import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_travel_friend/core/widget/bottom_sheat.dart';
import 'package:my_travel_friend/core/widget/text_box.dart';
import 'package:my_travel_friend/feature/trip/domain/entities/trip_entity.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/edit_trip/edit_trip_bloc.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/edit_trip/edit_trip_event.dart';
import 'package:my_travel_friend/feature/trip/presentation/viewmodels/edit_trip/edit_trip_state.dart';
import 'package:my_travel_friend/feature/trip/presentation/widgets/date_picker.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font.dart';
import '../../../../core/theme/app_icon.dart';
import '../../../../core/widget/app_bar.dart';
import '../../../../core/widget/button.dart';

class EditTripScreen extends StatefulWidget {
  final TripEntity trip;

  const EditTripScreen({super.key, required this.trip});

  @override
  State<EditTripScreen> createState() => _EditTripScreenState();
}

class _EditTripScreenState extends State<EditTripScreen> {
  final _titleController = TextEditingController();
  final _placeController = TextEditingController();
  bool _initialized = false;

  String _two(int n) => n.toString().padLeft(2, "0");

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      final state = context.read<EditTripBloc>().state;
      _titleController.text = state.title;
      _placeController.text = state.place;
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return BlocConsumer<EditTripBloc, EditTripState>(
      listener: (context, state) {
        if (state.pageState == EditTripPageState.success) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message ?? "수정 완료!")));
          context.pop(true);
        }

        if (state.pageState == EditTripPageState.error) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message ?? "오류 발생")));
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
            title: "여행 계획 수정하기",
            actions: [
              Button(
                width: 40,
                height: 40,
                icon:
                    state.isUploading ||
                        state.pageState == EditTripPageState.loading
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
                    ? () => context.read<EditTripBloc>().add(
                        const EditTripEvent.saveTrip(),
                      )
                    : null,
              ),
            ],
          ),
          body: state.pageState == EditTripPageState.loading
              ? const Center(child: CircularProgressIndicator())
              : _editForm(context, state),
        );
      },
    );
  }

  Widget _editForm(BuildContext context, EditTripState state) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Container(
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
                    onChanged: (text) => context.read<EditTripBloc>().add(
                      EditTripEvent.changeTitle(title: text),
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Text("여행 장소", style: AppFont.regular),
                  TextBox(
                    controller: _placeController,
                    prefixIcon: const Icon(Icons.place, color: Colors.grey),
                    onChanged: (text) => context.read<EditTripBloc>().add(
                      EditTripEvent.changePlace(place: text),
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text("여행 날짜", style: AppFont.regular),
                  Row(
                    children: [
                      Expanded(
                        child: DatePickerBox(
                          label: "시작일",
                          value: formatDate(state.startAt),
                          onTap: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.parse(state.startAt),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              final formatted =
                                  "${picked.year}-${_two(picked.month)}-${_two(picked.day)}";
                              context.read<EditTripBloc>().add(
                                EditTripEvent.changeStartAt(startAt: formatted),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DatePickerBox(
                          label: "종료일",
                          value: formatDate(state.endAt),
                          onTap: () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.parse(state.endAt),
                              firstDate: DateTime.parse(state.startAt),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              final formatted =
                                  "${picked.year}-${_two(picked.month)}-${_two(picked.day)}";
                              context.read<EditTripBloc>().add(
                                EditTripEvent.changeEndAt(endAt: formatted),
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
                      _typeTab(context, "COLOR", state.coverStyle == "COLOR"),
                      const SizedBox(width: 12),
                      _typeTab(context, "IMAGE", state.coverStyle == "IMAGE"),
                    ],
                  ),
                  const SizedBox(height: 14),

                  if (state.coverStyle == "COLOR") ...[
                    const Text(
                      "커버 색상",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    _colorPickSection(context, state),
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
    );
  }

  Widget _typeTab(BuildContext context, String style, bool selected) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Expanded(
      child: GestureDetector(
        onTap: () => context.read<EditTripBloc>().add(
          EditTripEvent.changeCoverStyle(style: style),
        ),
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

  Widget _colorPickSection(BuildContext context, EditTripState state) {
    final bloc = context.read<EditTripBloc>();
    final selectedColor = state.coverType;
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
          onTap: () => bloc.add(EditTripEvent.changeCoverColor(color: key)),
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

  Widget _imagePickSection(BuildContext context, EditTripState state) {
    final bloc = context.read<EditTripBloc>();
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    if (state.localImgFile == null && (state.coverImg?.isEmpty ?? true)) {
      return GestureDetector(
        onTap: () => _showPicker(context),
        child: Container(
          width: double.infinity,
          height: 180,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.onSurfaceVariant),
            borderRadius: BorderRadius.circular(10),
          ),
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
        ),
      );
    }

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: state.localImgFile != null
              ? Image.file(
                  state.localImgFile!,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  state.coverImg!,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
        ),
        Positioned(
          top: 6,
          right: 6,
          child: GestureDetector(
            onTap: () => bloc.add(const EditTripEvent.removeCoverImg()),
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

  void _showPicker(BuildContext context) {
    CommonBottomSheet.show(
      context,
      sheetTitle: "이미지 선택",
      actions: [
        BottomSheetAction(
          icon: const Icon(Icons.camera_alt),
          iconBgColor: AppColors.primaryLight,
          title: "카메라",
          onTap: () async {
            final picker = ImagePicker();
            final picked = await picker.pickImage(source: ImageSource.camera);
            if (picked != null) {
              context.read<EditTripBloc>().add(
                EditTripEvent.selectCoverImg(file: File(picked.path)),
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
              context.read<EditTripBloc>().add(
                EditTripEvent.selectCoverImg(file: File(picked.path)),
              );
            }
          },
        ),
      ],
    );
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
      child: Row(
        children: [
          Icon(AppIcon.crews, color: colorScheme.primary, size: 24),
          SizedBox(width: 24),
          Expanded(
            child: Text(
              "수정 후 저장하면 크루에게도 변경 사항이 공유돼요!",
              overflow: TextOverflow.visible,
              style: AppFont.regular.copyWith(
                color: isDark ? AppColors.light : AppColors.dark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String formatDate(String dateStr) {
  try {
    final date = DateTime.parse(dateStr);
    return "${date.year}/${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}";
  } catch (_) {
    return dateStr;
  }
}
