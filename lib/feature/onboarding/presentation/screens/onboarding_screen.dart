import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_travel_friend/core/theme/app_colors.dart';
import 'package:my_travel_friend/core/theme/app_font.dart';

import '../viewmodels/onboarding_bloc.dart';
import '../viewmodels/onboarding_event.dart';
import '../viewmodels/onboarding_state.dart';
import '../widgets/onboarding_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    context.read<OnboardingBloc>().add(const OnboardingEvent.initialize());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    return BlocConsumer<OnboardingBloc, OnboardingState>(
      listenWhen: (prev, curr) =>
          prev.currentPage != curr.currentPage ||
          prev.shouldNavigateToLogin != curr.shouldNavigateToLogin,
      listener: (context, state) {
        if (_pageController.hasClients &&
            _pageController.page?.round() != state.currentPage) {
          _pageController.animateToPage(
            state.currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
        if (state.shouldNavigateToLogin) {
          context.go('/home');
        }
      },
      builder: (context, state) {
        if (state.pageState == OnboardingPageState.initial ||
            state.pageState == OnboardingPageState.loading) {
          return Scaffold(
            backgroundColor: colorScheme.surface,
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (state.pageState == OnboardingPageState.error) {
          return Scaffold(
            backgroundColor: Color(0xffEEF5FA),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: colorScheme.error),
                  const SizedBox(height: 16),
                  Text(
                    state.errorMessage ?? '오류가 발생했습니다',
                    style: TextStyle(color: colorScheme.error),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      context.read<OnboardingBloc>().add(
                        const OnboardingEvent.initialize(),
                      );
                    },
                    child: const Text('다시 시도'),
                  ),
                ],
              ),
            ),
          );
        }

        return Scaffold(
          backgroundColor: Color(0xffEEF5FA),
          body: Stack(
            children: [
              // 1. 배경: 풀스크린 이미지 PageView
              PageView.builder(
                controller: _pageController,
                itemCount: state.pages.length,
                onPageChanged: (index) {
                  context.read<OnboardingBloc>().add(
                    OnboardingEvent.goToPage(pageIndex: index),
                  );
                },
                itemBuilder: (context, index) {
                  final page = state.pages[index];

                  return _buildFullScreenImage(page.imagePath);
                },
              ),

              // 2. 오버레이: 건너뛰기 버튼 (상단)
              Positioned(
                top: MediaQuery.of(context).padding.top + 16,
                right: 16,
                child: _buildSkipButton(context, state),
              ),

              // 3. 오버레이: 인디케이터 + 버튼 (하단)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _buildBottomOverlay(context, state),
              ),
            ],
          ),
        );
      },
    );
  }

  // 풀스크린 이미지 빌드
  Widget _buildFullScreenImage(String imagePath) {
    // 네트워크 이미지 (Supabase Storage URL)
    if (imagePath.startsWith('http')) {
      return Image.network(
        imagePath,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.white,
            child: const Center(
              child: Icon(Icons.error_outline, size: 64, color: Colors.grey),
            ),
          );
        },
      );
    }

    // 로컬 이미지
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (context, error, stackTrace) => Container(
        color: Colors.white,
        child: const Center(
          child: Icon(Icons.error_outline, size: 64, color: Colors.grey),
        ),
      ),
    );
  }

  // 건너뛰기 버튼
  Widget _buildSkipButton(BuildContext context, OnboardingState state) {
    // 마지막 페이지에서는 숨김
    if (state.isLastPage) {
      return const SizedBox.shrink();
    }

    return TextButton(
      onPressed: () {
        context.read<OnboardingBloc>().add(const OnboardingEvent.skip());
      },
      style: TextButton.styleFrom(
        backgroundColor: AppColors.primaryDark.withOpacity(0.5),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        '건너뛰기',
        style: AppFont.regular.copyWith(color: AppColors.light),
      ),
    );
  }

  // 하단 오버레이 (인디케이터 + 버튼)
  Widget _buildBottomOverlay(BuildContext context, OnboardingState state) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        24,
        24,
        24,
        MediaQuery.of(context).padding.bottom + 32,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 인디케이터
          OnboardingIndicator(
            currentPage: state.currentPage,
            pageCount: state.totalPages,
            activeColor: AppColors.primaryLight,
            inactiveColor: AppColors.primaryLight.withOpacity(0.3),
          ),

          const SizedBox(height: 24),

          // 다음/시작하기 버튼
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: state.pageState == OnboardingPageState.completing
                  ? null
                  : () {
                      context.read<OnboardingBloc>().add(
                        const OnboardingEvent.nextPage(),
                      );
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryLight,
                foregroundColor: Colors.black87,
                disabledBackgroundColor: Colors.white.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: state.pageState == OnboardingPageState.completing
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      state.isLastPage ? '시작하기' : '다음',
                      style: AppFont.regular.copyWith(color: AppColors.light),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
