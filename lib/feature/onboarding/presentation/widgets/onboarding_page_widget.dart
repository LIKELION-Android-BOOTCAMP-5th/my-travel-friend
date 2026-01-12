import 'package:flutter/material.dart';

import '../../domain/entities/onboarding_entity.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingEntity page;

  final bool isCurrentPage;

  const OnboardingPageWidget({
    super.key,
    required this.page,
    this.isCurrentPage = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildAsset()],
      ),
    );
  }

  Widget _buildAsset() {
    return Image.asset(
      page.imagePath,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return _buildPlaceholder();
      },
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Icon(Icons.image_outlined, size: 64, color: Colors.grey),
      ),
    );
  }
}
