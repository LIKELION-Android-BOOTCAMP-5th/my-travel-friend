import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_icon.dart';

// [이재은] 다이어리 리뷰 별점 위젯
// - 편집 시 드래그해서 0.5점 단위 0 - 5점 별점 매기기 가능
// - 읽기 전용 (상세 팝업)으로도 출력 가능

class StarRating extends StatefulWidget {
  final double rating; // 별점 (0.0 - 5.0)
  final ValueChanged<double>? onRatingChanged; // 별점 변경(null 읽기 전용)
  final double starSize; // 별 하나 크기 : 기본값 15 (편집용으로는 40으로 잡을 예정)
  final int starCount; // 별 갯수 = 5
  final double starSpacing; // 별간 간격 : 기본값 4.0 (편집용으로는 11.0 잡아볼 예정)
  final Color filledColor; // 채워졌을 때 색상 = tertiary
  final Color emptyColor; // 비어있을 때 색상

  const StarRating({
    super.key,
    required this.rating,
    this.onRatingChanged,
    this.starSize = 15.0,
    this.starCount = 5,
    this.starSpacing = 4.0,
    this.filledColor = AppColors.tertiary,
    this.emptyColor = AppColors.lightGray,
  });

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  // 현재 표시 중인 별점 (드래그 중 실시간 반영)
  double _currentRating = 0;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  @override
  void didUpdateWidget(StarRating oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 외부에서 rating 변경 시 동기화
    if (oldWidget.rating != widget.rating) {
      _currentRating = widget.rating;
    }
  }

  // 터치 위치 (x좌표) 별점으로 전환
  double _calculateRating(double localX) {
    double totalWidth =
        (widget.starSize * widget.starCount) +
        (widget.starSpacing * (widget.starCount - 1));

    double ratio = (localX / totalWidth).clamp(0.0, 1.0);

    double rawRating = ratio * widget.starCount;

    double res = (rawRating * 2).ceil() / 2;

    return res.clamp(0.0, widget.starCount.toDouble());
  }

  // 별점 업데이트 처리
  void _updateRating(double localX) {
    if (widget.onRatingChanged == null) return;
    double newRating = _calculateRating(localX);

    if (newRating != _currentRating) {
      setState(() => _currentRating = newRating);
      widget.onRatingChanged!(newRating);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isInteractive = widget.onRatingChanged != null;

    return GestureDetector(
      onTapDown: isInteractive
          ? (details) => _updateRating(details.localPosition.dx)
          : null,

      onHorizontalDragStart: isInteractive
          ? (details) => _updateRating(details.localPosition.dx)
          : null,

      onHorizontalDragUpdate: isInteractive
          ? (details) => _updateRating(details.localPosition.dx)
          : null,

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.starCount, (index) {
          return Padding(
            padding: EdgeInsets.only(
              right: index < widget.starCount - 1 ? widget.starSpacing : 0,
            ),
            child: _buildStar(index),
          );
        }),
      ),
    );
  }

  Widget _buildStar(int index) {
    double fill = _currentRating - index;
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    // 채워진 별 (full 또는 half)
    IconData? filledIcon;
    if (fill >= 1) {
      filledIcon = AppIcon.fullStar;
    } else if (fill >= 0.5) {
      filledIcon = AppIcon.halfStar;
    }

    return SizedBox(
      width: widget.starSize,
      height: widget.starSize,
      child: Stack(
        children: [
          // 빈 별 (항상 배경에 깔림)
          Icon(
            AppIcon.star,
            size: widget.starSize,
            color: isDark
                ? widget.emptyColor.withOpacity(0.3)
                : AppColors.darkerGray,
          ),

          if (filledIcon != null)
            Icon(filledIcon, size: widget.starSize, color: widget.filledColor),
        ],
      ),
    );
  }
}
