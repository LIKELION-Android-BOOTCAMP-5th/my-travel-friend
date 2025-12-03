import 'package:flutter/material.dart';

// [이재은] 다이어리 탭 화면
// - 다이어리 리스트 확인 가능 (공유 / 개인, 혹은 타입별 - 메모 / 리뷰 / 사진 / 소비)
// - 리스트 내 박스 클릭 시 다이어리 상세보기 팝업 오픈
// - 우측 하단 플로팅 버튼 클릭을 통해 작성 화면 오픈

class DiaryListScreen extends StatelessWidget {
  final int tripId;

  const DiaryListScreen({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container());
  }
}
