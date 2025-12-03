import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:my_travel_friend/theme/app_colors.dart';

import '../../../../core/widget/toast_pop.dart';
import '../../../../theme/app_icon.dart';

// [이재은] 이미지 확대 + 다운로드 기능까지 있는 이미지 표시
// - 이미지 상단에 버튼 오버레이
// - 크게보기 : 전체화면 뷰어로 (줌 가능)
// - 다운로드 : 갤러리에 이미지 저장

class ImageWithActions extends StatefulWidget {
  final String imageUrl; // 이미지 Url
  final String? heroTag; // 애니메이션 태그
  final double? height; // 이미지 높이 (기본값 : 200)
  final double? width; // 이미지 가로
  final BorderRadius? borderRadius; // 이미지 모서리 곡률

  const ImageWithActions({
    super.key,
    required this.imageUrl,
    this.heroTag,
    this.height = 200,
    this.width,
    this.borderRadius,
  });

  @override
  State<ImageWithActions> createState() => _ImageWithActionsState();
}

class _ImageWithActionsState extends State<ImageWithActions> {
  // 다운로드 진행 중 여부 (로딩 표시용)
  bool _isDownloading = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      // 이미지 모서리 둥글게 처리
      borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
      child: SizedBox(
        width: widget.width,
        child: Stack(
          children: [
            // 이미지
            Hero(
              // 전체 화면 전환 시 애니메이션 연결용
              tag: widget.heroTag ?? widget.imageUrl,
              child: Image.network(
                widget.imageUrl,
                width: widget.width ?? double.infinity,
                height: widget.height,
                fit: BoxFit.cover, // 이미지가 영역을 꽉 채우도록
                // 이미지 로드 실패시 대체 UI
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: widget.height,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    child: const Center(child: Icon(Icons.broken_image)),
                  );
                },
              ),
            ),

            // 버튼 오버레이
            Positioned(
              top: 8,
              right: 8,
              child: Row(
                children: [
                  // 크게보기 버튼
                  _ActionButton(
                    icon: Icons.open_in_full,
                    size: widget.width != null && widget.width! < 150 ? 14 : 20,
                    onTap: () => _openFullScreen(context),
                  ),
                  const SizedBox(width: 8),
                  // 다운로드 버튼
                  _ActionButton(
                    icon: _isDownloading ? AppIcon.hourGlass : AppIcon.download,
                    size: widget.width != null && widget.width! < 150 ? 14 : 20,
                    onTap: _isDownloading ? null : _downloadImage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openFullScreen(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: AppColors.dark,
        pageBuilder: (context, animation, secondaryAnimation) {
          return _FullScreenImageViewer(
            imageUrl: widget.imageUrl,
            heroTag: widget.heroTag ?? widget.imageUrl,
            onDownload: _downloadImage,
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      ),
    );
  }

  Future<void> _downloadImage() async {
    setState(() => _isDownloading = true);

    try {
      // 권한 요청 (Gal 내장 메서드 사용)
      final hasAccess = await Gal.hasAccess(toAlbum: true);
      if (!hasAccess) {
        final granted = await Gal.requestAccess(toAlbum: true);
        if (!granted) {
          ToastPop.show('갤러리 접근 권한이 필요합니다');
          return;
        }
      }

      // 이미지 다운로드
      final response = await Dio().get(
        widget.imageUrl,
        options: Options(responseType: ResponseType.bytes),
      );

      // 갤러리에 저장
      await Gal.putImageBytes(
        Uint8List.fromList(response.data),
        name: 'diary_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );

      ToastPop.show('이미지가 갤러리에 저장되었습니다');
    } on GalException catch (e) {
      ToastPop.show('저장에 실패했습니다: ${e.type.name}');
    } catch (e) {
      ToastPop.show('다운로드 실패: $e');
    } finally {
      if (mounted) {
        setState(() => _isDownloading = false);
      }
    }
  }
}

// 액션 버튼 위젯
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final double size;

  const _ActionButton({required this.icon, this.onTap, this.size = 20});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(size < 18 ? 4 : 8),
        decoration: BoxDecoration(
          color: AppColors.dark,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.light, size: 20),
      ),
    );
  }
}

// 전체화면 이미지 뷰어
class _FullScreenImageViewer extends StatelessWidget {
  final String imageUrl;
  final String heroTag;
  final VoidCallback onDownload;

  const _FullScreenImageViewer({
    required this.imageUrl,
    required this.heroTag,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Stack(
          children: [
            // 이미지 (확대/축소 가능)
            Center(
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 4.0,
                child: Hero(
                  tag: heroTag,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.broken_image,
                        color: AppColors.light,
                        size: 64,
                      );
                    },
                  ),
                ),
              ),
            ),

            // 상단 버튼들
            Positioned(
              top: 8,
              right: 8,
              child: SafeArea(
                child: Row(
                  children: [
                    // 다운로드 버튼
                    _ActionButton(icon: AppIcon.download, onTap: onDownload),
                    const SizedBox(width: 8),
                    // 닫기 버튼
                    _ActionButton(
                      icon: AppIcon.close,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
