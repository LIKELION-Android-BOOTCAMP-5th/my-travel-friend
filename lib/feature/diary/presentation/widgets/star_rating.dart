import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';

// [이재은] 다이어리 리뷰 별점 위젯
// - 편집 시 드래그해서 0.5점 단위 0 - 5점 별점 매기기 가능
// - 읽기 전용 (상세 팝업)으로도 출력 가능

class StarRating extends StatefulWidget {
  final double rating;
  final ValueChanged<double>? onRatingChanged;
  final double starSize;
  final double starCount;
  final Color filledColor;
  final Color emptyColor;

  const StarRating({
    super.key,
    required this.rating,
    this.onRatingChanged,
    this.starSize = 40.0,
    this.starCount = 5,
    this.filledColor = AppColors.tertiary,
    this.emptyColor = AppColors.lightGray,
  });

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  double _currentRating = 0;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  @override
  void didUpdateWidget(StarRating oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.rating != widget.rating) {
      _currentRating = widget.rating;
    }
  }

  double _calculateRating(double localX) {
    double totalWidth = widget.starSize * widget.starCount;

    double ratio = (localX / totalWidth).clamp(0.0, 1.0);

    double rawRating = ratio * widget.starCount;

    double res = (rawRating * 2).ceil() / 2;

    return res.clamp(0.0, widget.starCount.toDouble());
  }

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
        children: List.generatqe(
          widget.starCount,
          (index) => _buildStar(index),
        ),
      ),
    );
  }

  Widget _buildStar(int index) {
    double fillAmount = (_currentRating - index).clamp(0.0, 1.0);

    return SizedBox(
      width: widget.starSize,
      height: widget.starSize,
      child: Stack(children: []),
    );
  }
}
