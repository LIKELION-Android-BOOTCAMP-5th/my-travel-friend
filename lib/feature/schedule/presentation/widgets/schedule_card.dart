import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/widget/profile_img.dart';

class ScheduleCard extends StatefulWidget {
  final String title;
  final String dateTime;
  final String place;
  final String tagName;
  final List<String> profileImages; // 유저 프로필 이미지 URL 리스트
  final String? memo; // 메모 (옵셔널)

  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ScheduleCard({
    super.key,
    required this.title,
    required this.dateTime,
    required this.place,
    required this.tagName,
    required this.profileImages,
    required this.onEdit,
    required this.onDelete,
    this.memo,
  });

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  bool showMemo = false;

  @override
  Widget build(BuildContext context) {
    final hasMemo = widget.memo != null && widget.memo!.trim().isNotEmpty;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 태그 + 수정/삭제 버튼
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 태그
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F0FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  widget.tagName,
                  style: const TextStyle(
                    color: Color(0xFF4A73FF),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const Spacer(),

              // 수정 아이콘
              IconButton(
                icon: const Icon(Icons.edit, size: 20),
                onPressed: widget.onEdit,
              ),

              // 삭제 아이콘
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.redAccent,
                ),
                onPressed: widget.onDelete,
              ),
            ],
          ),

          const SizedBox(height: 4),

          // 제목
          Text(
            widget.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 10),

          // 날짜/시간
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 18),
              const SizedBox(width: 8),
              Text(widget.dateTime),
            ],
          ),

          const SizedBox(height: 6),

          // 장소
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 18),
              const SizedBox(width: 8),
              Text(widget.place),
            ],
          ),

          const SizedBox(height: 12),

          // ----- 메모 토글 버튼 -----
          if (hasMemo)
            GestureDetector(
              onTap: () => setState(() => showMemo = !showMemo),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(
                      showMemo ? "메모 숨기기" : "메모 보기",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    Icon(
                      showMemo
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ],
                ),
              ),
            ),

          // 메모 내용
          if (showMemo && hasMemo) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(widget.memo!, style: const TextStyle(height: 1.4)),
            ),
          ],

          const SizedBox(height: 12),

          // 참여자 프로필
          Row(
            children: widget.profileImages.map((img) {
              return Padding(
                padding: const EdgeInsets.only(right: 6),
                child: ProfileImg(imageUrl: img, radius: 30),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

String formatScheduleDateTime(String isoString) {
  final dt = DateTime.parse(isoString).toLocal();
  return DateFormat('yyyy-MM-dd / HH:mm').format(dt);
}
