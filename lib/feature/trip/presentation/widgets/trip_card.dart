import 'package:flutter/material.dart';
import 'package:my_travel_friend/theme/app_colors.dart';

//신강현
//여행 리스트 목록에 넣은 카드 컴포넌트 완선
//디비에서 데이터 꺼내오는 로직이 생기면 수정 필요할 수 있음
//쓰는 곳에서 해당 여행페이지로 가는 함수와 바텀시트로 수정삭제 보여주는 함수 넣어야함

class TripCard extends StatelessWidget {
  final String title;
  final String startDate;
  final String endDate;
  final int peopleCount;
  final Color? backgroundColor;
  final String? backgroundImageUrl;
  final VoidCallback? onTap;
  final VoidCallback? onMenu;

  const TripCard({
    super.key,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.peopleCount,
    this.backgroundColor,
    this.backgroundImageUrl,
    this.onTap,
    this.onMenu,
  });

  //색 하나 넣어으면 그색으로 그라데이션 넣어주기
  List<Color> makeGradient() {
    Color base = backgroundColor ?? const Color(0xFFFF8A80);
    return [base.withOpacity(0.95), base.withOpacity(0.65)];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 364,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          //이미지 우선 -> 이미지가 있다면 이미지로 표시 아니라면 색으로 표시
          image: backgroundImageUrl != null
              ? DecorationImage(
                  image: NetworkImage(backgroundImageUrl!),
                  fit: BoxFit.cover,
                )
              : null,
          gradient: backgroundImageUrl == null
              ? LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: makeGradient(),
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: AppColors.dark.withOpacity(0.15),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            //원형 이미지 ui 디테일 챙기기
            Positioned(
              bottom: -60,
              left: -60,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.light.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              top: -40,
              right: -40,
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.light.withOpacity(0.1),
                ),
              ),
            ),

            // 마커 아이콘, 사람 인수체크
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.light,
                        size: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.light.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.people,
                              size: 23,
                              color: AppColors.light,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "$peopleCount",
                              style: const TextStyle(
                                fontSize: 17,
                                color: AppColors.light,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  //여행 제목
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 30,
                      color: AppColors.light,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  //날짜 표기
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: AppColors.light,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        "$startDate - $endDate",
                        style: TextStyle(color: AppColors.light, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 여행 바텀시트 꺼내는 메뉴
            Positioned(
              bottom: 12,
              right: 12,
              child: GestureDetector(
                onTap: onMenu,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.light.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.more_vert,
                    color: AppColors.light,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
