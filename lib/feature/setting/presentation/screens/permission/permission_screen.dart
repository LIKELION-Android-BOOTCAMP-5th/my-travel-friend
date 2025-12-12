import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/theme/app_font.dart';

import '../../../../../core/service/internal/permission_service.dart';
import '../../../../../core/widget/app_bar.dart';
import '../../../../../core/widget/button.dart';
import '../../../../../core/widget/pop_up_box.dart';
import '../../../../../theme/app_colors.dart';
import '../../../../../theme/app_icon.dart';
import '../../viewmodels/permission/permission_bloc.dart';
import '../../viewmodels/permission/permission_event.dart';
import '../../viewmodels/permission/permission_state.dart';
import '../../widgets/permission_box.dart';

// [이재은] 권한 설정 화면
class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // 시스템 설정에서 돌아왔을 때 새로고침
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!mounted) return;

    if (state == AppLifecycleState.resumed) {
      context.read<PermissionBloc>().add(const Refresh());
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppColors.navy : AppColors.darkGray,
      appBar: CustomButtonAppBar(
        title: '권한 설정',
        leading: Button(
          width: 40,
          height: 40,
          icon: Icon(AppIcon.back),
          contentColor: isDark ? colorScheme.onSurface : AppColors.light,
          borderRadius: 20,
          onTap: () => context.pop(),
        ),
      ),
      body: BlocBuilder<PermissionBloc, PermissionState>(
        builder: (context, state) {
          if (state.pageState == PermissionPageState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.pageState == PermissionPageState.error) {
            return Center(child: Text(state.message ?? '오류가 발생했습니다'));
          }

          return _buildSettingList(context, state);
        },
      ),
    );
  }

  // 설정 화면
  Widget _buildSettingList(BuildContext context, PermissionState state) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        AppIcon.defense,
                        color: colorScheme.primary.withOpacity(0.6),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "앱 사용에 필요한 권한을 관리할 수 있어요",
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style: AppFont.small.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "권한은 언제든지 변경 가능합니다",
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style: AppFont.small.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (state.getPermission(AppPermissionType.notification) !=
                        null)
                      _buildItem(
                        permission: state.getPermission(
                          AppPermissionType.notification,
                        )!,
                        context: context,
                        onToggle: () => _handleToggle(
                          context,
                          state.getPermission(AppPermissionType.notification)!,
                        ),
                      ),
                    SizedBox(height: 8),
                    if (state.getPermission(AppPermissionType.camera) != null)
                      _buildItem(
                        permission: state.getPermission(
                          AppPermissionType.camera,
                        )!,
                        context: context,
                        onToggle: () => _handleToggle(
                          context,
                          state.getPermission(AppPermissionType.camera)!,
                        ),
                      ),
                    SizedBox(height: 8),
                    if (state.getPermission(AppPermissionType.photo) != null)
                      _buildItem(
                        permission: state.getPermission(
                          AppPermissionType.photo,
                        )!,
                        context: context,
                        onToggle: () => _handleToggle(
                          context,
                          state.getPermission(AppPermissionType.photo)!,
                        ),
                        isLast: true,
                      ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => {
              context.read<PermissionBloc>().add(const OpenSystem()),
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          AppIcon.setting,
                          color: isDark
                              ? AppColors.light.withOpacity(0.6)
                              : AppColors.dark.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "시스템 설정에서 전체 관리",
                                softWrap: true,
                                overflow: TextOverflow.visible,
                                style: AppFont.medium.copyWith(
                                  color: isDark
                                      ? AppColors.light
                                      : AppColors.dark,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "기기 설정에서 앱 권한을 관리해요",
                                softWrap: true,
                                overflow: TextOverflow.visible,
                                style: AppFont.small.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: Column(children: [SizedBox(width: 3)])),
        ],
      ),
    );
  }

  // 개별 아이템 + Divier(마지막이 아닐때만)
  Widget _buildItem({
    required BuildContext context,
    required PermissionInfo permission,
    required VoidCallback onToggle,
    bool isLast = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return Column(
      children: [
        PermissionBox(
          permission: permission,
          onToggle: onToggle,
          isLast: isLast,
        ),
        if (!isLast)
          Divider(
            height: 0.5,
            color: colorScheme.outlineVariant.withOpacity(0.3),
          ),
      ],
    );
  }

  void _handleToggle(BuildContext context, PermissionInfo permission) {
    if (permission.isGranted) {
      // 켜져있을때의 확인 팝업
      _showDisableConfirmDialog(context, permission);
    } else {
      // 꺼져있을 때 확인 팝업
      _showAbleConfirmDialog(context, permission);
    }
  }

  // 권한 제한 확인 다이얼로그
  void _showDisableConfirmDialog(
    BuildContext context,
    PermissionInfo permission,
  ) {
    showDialog(
      context: context,
      builder: (_) => PopUpBox(
        icon: AppIcon.defense,
        iconColor: Theme.of(context).colorScheme.primary,
        title: '${permission.title} 권한 제한',
        message: '기능을 제한하시겠어요?\n권한을 끄려면 시스템 설정에서 변경해야 해요.',
        leftText: '취소',
        rightText: '설정으로 이동',
        rightButtonColor: Theme.of(context).colorScheme.primary,
        rightTextColor: AppColors.light,
        onLeft: () {
          // 취소 - 아무것도 안 함 (PopUpBox 내부에서 pop 처리함)
        },
        onRight: () {
          // 시스템 설정으로 이동
          context.read<PermissionBloc>().add(const OpenSystem());
        },
      ),
    );
  }

  // 권한 활성화 확인 다이얼로그
  void _showAbleConfirmDialog(BuildContext context, PermissionInfo permission) {
    showDialog(
      context: context,
      builder: (_) => PopUpBox(
        icon: AppIcon.defense,
        iconColor: Theme.of(context).colorScheme.primary,
        title: '${permission.title} 권한 활성화',
        message: '기능을 활성화하시겠어요?\n권한을 켜려면 시스템 설정에서 변경해야 해요.',
        leftText: '취소',
        rightText: '설정으로 이동',
        rightButtonColor: Theme.of(context).colorScheme.primary,
        rightTextColor: AppColors.light,
        onLeft: () {
          // 취소 - 아무것도 안 함 (PopUpBox 내부에서 pop 처리함)
        },
        onRight: () {
          // 시스템 설정으로 이동
          context.read<PermissionBloc>().add(const OpenSystem());
        },
      ),
    );
  }
}
