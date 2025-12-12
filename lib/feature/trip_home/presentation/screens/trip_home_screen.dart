import 'package:flutter/material.dart';
import 'package:my_travel_friend/core/widget/app_bar.dart';
import 'package:my_travel_friend/core/widget/bottom_navigation.dart';

class TripHomeScreen extends StatelessWidget {
  const TripHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomButtonAppBar(
        title: "오사카 여행",
        subtitle: "2024.12.15 ~ 12.18 (4일)",
      ),

      bottomNavigationBar: BottomNavigation(currentIndex: 0, onTap: (i) {}),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              _buildCrewSection(),
              const SizedBox(height: 16),
              _buildWeekCalendar(),
              const SizedBox(height: 16),
              _buildDayScheduleTitle(),
              const SizedBox(height: 12),
              _buildScheduleList(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  /// ---- [위젯들] ----

  Widget _buildCrewSection() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: _boxDeco(),
      child: Row(
        children: const [
          Icon(Icons.group, size: 22),
          SizedBox(width: 6),
          Expanded(
            child: Text(
              "크루 멤버 (4명)",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }

  Widget _buildWeekCalendar() {
    final days = ["일", "월", "화", "수", "목", "금", "토"];
    final dates = [9, 10, 11, 12, 13, 14, 15];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: _boxDeco(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(days.length, (i) {
          final isSelected = i == 1;
          return Column(
            children: [
              Text(days[i], style: const TextStyle(fontSize: 12)),
              const SizedBox(height: 4),
              Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  dates[i].toString(),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildDayScheduleTitle() {
    return Row(
      children: const [
        Icon(Icons.access_time, size: 18, color: Colors.blue),
        SizedBox(width: 6),
        Text(
          "2월 10일의 일정",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildScheduleList() {
    final plans = [
      ["08:00", "공항 출발", "인천국제공항"],
      ["10:30", "간사이 공항 도착", "간사이 국제공항"],
      ["13:00", "도톤보리 탐방", "도톤보리"],
      ["15:30", "오코노미야키 맛집", "미즈노"],
    ];

    return Column(
      children: List.generate(plans.length, (i) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(14),
          decoration: _boxDeco(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                plans[i][0],
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                plans[i][1],
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.place, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    plans[i][2],
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  BoxDecoration _boxDeco() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}
