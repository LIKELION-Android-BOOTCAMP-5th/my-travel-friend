<img width="1440" height="510" alt="Surface Pro 8 - 6" src="https://nuojusvxtcsxvvvmblkq.supabase.co/storage/v1/object/sign/readme/1113_Readme.png?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV84NmZmZDhmMi0xMjM0LTQ2YjktYTc2ZS01ZDkyMGUwMmNlM2QiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJyZWFkbWUvMTExM19SZWFkbWUucG5nIiwiaWF0IjoxNzY3OTU3Mjk3LCJleHAiOjE4NjI1NjUyOTd9.12zZpNIGfoUubdQHnlgZnK8c484ZQc-enBI5rRdvi4A" />


# 프로젝트 소개

> **여행 계획부터 기록까지, 여행의 모든 순간을 함께 ✈️**
<br>나의 여행 친구와 즐거운 여행 되세요

# 앱 설치
| PlayStore | AppStore | 
|:----:|:----:|
|[🔗 바로가기](https://play.google.com/store/apps/details?id=com.team1113.mytravelfriend) | [🔗 바로가기](https://apps.apple.com/kr/app/%EB%82%98%EC%9D%98-%EC%97%AC%ED%96%89-%EC%B9%9C%EA%B5%AC/id6756408487) | 

<!-- TODO 기획 의도나 앱 개발 목적 추가? -->

<br>

# 개발 기간

**🗓️ 2025.11.24 ~ 2026.1.12**

<br>

# 기술 스택
- **언어**: Dart
- **프레임워크**:Flutter
- **상태관리**: BLoC Provider
- **DI**: Get_it
- **라우팅**: Go_Router
- **백엔드/DB**: Supabase
- **Auth**:google_sign_in, sign_in_with_apple
- **Networkd**:Dio
- **알림**:Firebase Cloud Messaging(FCM)
- **로컬알림**:flutter_local_notifications
- **로컬저장소**:shared_preferences
- **이미지처리**: image_picker
- **권한관리**: permission_handler
- **유틸리티**: lottie, intl, fluttertoast, tutorial_coach_mark, home_widget, google_maps_flutter

<br>

# 아키텍처

### 시스템 아키텍처
<img width="1531" height="1042" alt="Frame 120" src="https://nuojusvxtcsxvvvmblkq.supabase.co/storage/v1/object/sign/readme/1113_sa.png?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV84NmZmZDhmMi0xMjM0LTQ2YjktYTc2ZS01ZDkyMGUwMmNlM2QiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJyZWFkbWUvMTExM19zYS5wbmciLCJpYXQiOjE3Njc5NTczMzgsImV4cCI6MTg2MjU2NTMzOH0.ky4L1Ie2OrvAu750mM2CjHR2O-ojJbRMeUwZh1sKTcM" />

- Supabase를 중심으로 백엔드 구성
    - Auth로 소셜 로그인을 사용하며 구글/애플/카카오 로그인 지원
    - 기본적으로 로컬 알림과 FCM 사용
    - home_widget과 Kotlin, Swift를 사용한 기기 홈 화면 위젯 지원

### 앱 내 아키텍처 (Clean Architecture)
<img width="1531" height="1042" alt="Frame 120" src="https://nuojusvxtcsxvvvmblkq.supabase.co/storage/v1/object/sign/readme/1113_ca.png?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV84NmZmZDhmMi0xMjM0LTQ2YjktYTc2ZS01ZDkyMGUwMmNlM2QiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJyZWFkbWUvMTExM19jYS5wbmciLCJpYXQiOjE3Njc5NTc0MDQsImV4cCI6MTg2MjU2NTQwNH0.BHxodx7-ZV7Ki7Q0gy1AOUXQzgrhygUglJkrDPTH80w" />

### CA 기반의 앱 파일 구조
<img width="1531" height="1042" alt="Frame 120" src="https://nuojusvxtcsxvvvmblkq.supabase.co/storage/v1/object/sign/readme/1113_fa.png?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV84NmZmZDhmMi0xMjM0LTQ2YjktYTc2ZS01ZDkyMGUwMmNlM2QiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJyZWFkbWUvMTExM19mYS5wbmciLCJpYXQiOjE3Njc5NTczODEsImV4cCI6MTg2MjU2NTM4MX0.QsNzfvXl7cVpVDuK05tDuB-rB7GZ_b9Ih3sZFHVm2TM" />

<br>

# 주요 기능

| 섹션 | 주요 기능 |
|---|---|
| 온보딩 | • 앱 소개 <br>   - 앱 설치 후 첫 실행 시에만 제공 |
| 인증 | • 소셜 로그인 : 구글, 애플, 카카오 |
| 코치마크 | • 유저의 처음 앱 사용에 대한 가이드 제공 <br>   -앱 첫 실행 시에만 제공 |
| 앱 홈 | • 유저가 참여하는 여행 목록 제공 ; 클릭 시 여행 상세 페이지로 이동<br>• 여행 검색 기능 제공<br>• 알림리스트 화면으로 연결<br>• 설정 화면으로 이동 |
| 알림 리스트 | • 친구 요청 / 여행 초대 / 여행 일정 변동 / 여행 톡톡 / 여행 디데이 알림 확인 가능 |
| 설정 | • 프로필 변경 - 닉네임, 프로필 사진 변경 및 계정 삭제<br>• 친구 목록 조회 및 친구 추가 / 삭제 <br>• 받은 여행 초대 조회 및 수락 / 거절<br>• 위젯 / 푸시 알림 / 테마 / 권한 설정<br>• 문의하기 및 개인 정보 처리 방침 조회<br>• 로그아웃 |
| 여행 홈 | • 여행 참석 크루 확인 및 초대<br>• 여행 스케줄 간단 조회 |
| 여행 스케줄 | • 여행 내 일정 등록 및 조회 / 수정 / 삭제 |
| 여행 체크리스트 | • 여행 전 해야할 일 / 챙겨야 할 물품 체크리스트 생성 / 조회 / 삭제 가능 |
| 여행 다이어리 | • 여행 참석 크루와 공유할 기록 / 개인적인 기록<br>• 메모 / 리뷰 / 사진 / 소비로 나누어 기록 가능 |
| 여행 톡톡 | • 여행 참석 크루와 실시간 채팅 |
| 기기 홈 위젯 | • 여행 D-day 위젯<br>• 오늘의 여행 일정 위젯 |

<br>


<br>

## 시연 영상
<p align="center">
  <a href="">
    <img src="" alt="[시연 영상]()" width="800">
  </a>
</p>

<br>

# 팀원 소개
| 총괄팀장 | 부팀장 | 개발팀장 | 오락팀장 |
|:----:|:----:|:----:|:----:|
|<img width=150 src="https://nuojusvxtcsxvvvmblkq.supabase.co/storage/v1/object/sign/readme/jaeeun.png?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV84NmZmZDhmMi0xMjM0LTQ2YjktYTc2ZS01ZDkyMGUwMmNlM2QiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJyZWFkbWUvamFlZXVuLnBuZyIsImlhdCI6MTc2Nzk1NzQ1NSwiZXhwIjoxODYyNTY1NDU1fQ.O9gsnu9uy6ioyeAYHx52RqjKOTY8kdUYSlL1qBjwgms"/>|<img width=150 src="https://nuojusvxtcsxvvvmblkq.supabase.co/storage/v1/object/sign/readme/kanghyun.png?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV84NmZmZDhmMi0xMjM0LTQ2YjktYTc2ZS01ZDkyMGUwMmNlM2QiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJyZWFkbWUva2FuZ2h5dW4ucG5nIiwiaWF0IjoxNzY3OTU3NDc4LCJleHAiOjE4NjI1NjU0Nzh9.trfOUWTjAtZTkzCjSLE9zGNu4cKdkkzMYLexV4HatKM"/>|<img width=150 src="https://nuojusvxtcsxvvvmblkq.supabase.co/storage/v1/object/sign/readme/jaemin.png?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV84NmZmZDhmMi0xMjM0LTQ2YjktYTc2ZS01ZDkyMGUwMmNlM2QiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJyZWFkbWUvamFlbWluLnBuZyIsImlhdCI6MTc2Nzk1NzQ5OCwiZXhwIjoxODYyNTY1NDk4fQ.hbYZmPqswZz1PJkQ3FVMk4L8yK3LcwHGTWDHwGraHuk">|<img width=150 src="https://nuojusvxtcsxvvvmblkq.supabase.co/storage/v1/object/sign/readme/subin.png?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV84NmZmZDhmMi0xMjM0LTQ2YjktYTc2ZS01ZDkyMGUwMmNlM2QiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJyZWFkbWUvc3ViaW4ucG5nIiwiaWF0IjoxNzY3OTU3NTIwLCJleHAiOjE4NjI1NjU1MjB9.8hqk3J71n4P-c186LQJ-xH02xXQymNpEM6EqAlxmD_M"/>|
|[이재은](https://github.com/zzeneeee)|[신강현](https://github.com/ENKH123)|[전재민](https://github.com/paul0127-dev)|[엄수빈](https://github.com/EomSB)

<br>

## 담당 역할
| 팀원 | 역할 |
|---|---|
| 이재은 | •  앱 전체 디자인<br>• 테마(컬러, 폰트, 아이콘) 설정<br>• 애플 로그인 기능 구현<br>• 알림 리스트 화면 및 기능 구현<br>• 설정 화면 및 기능 구현<br>• 여행 체크리스트 화면 및 기능 구현<br>• 여행 다이어리 화면 및 기능 구현<br>• 여행 톡톡 화면 및 기능 구현<br>• 기기 홈 위젯 기능 구현<br>• 온보딩 기능 구현<br>• 코치마크 기능 구현<br>• 발표자료(PPT, 시연 영상) 제작<br>• 앱 출시 관련 작업 전반 |
| 신강현 | •  앱 홈 화면(여행 생성, 목록 조회, 수정) 및 기능 구현<br>• 여행 홈 화면 및 기능 구현<br>• 여행 스케줄 화면 및 기능 구현<br>• AI 활용(장소 해석, 장소 및 일정 추천, 검색) 기능 구현<br>• 기능 명세서 최종 편집 |
| 전재민 | •  아키텍처 구조 설계<br>• 라우터 설정<br>• 구글 / 카카오 로그인 기능 구현<br>• 인증 구조 설계<br>• 딥링크 구현<br>• FCM 푸시 알람 기능 구현<br>• 백엔드 자동화(유저 생성 및 알림 업데이트)<br>• 스케줄링을 활용한 D-day 알림 기능 구현<br>• API 명세서 작성 |
| 엄수빈 | •  친구 화면 및 기능 구현<br>• 링크를 통해 친구 추가하기 기능 구현<br>• 화면 명세서 최종 편집<br>• 기능 명세서 최종 편집 |

### 공동작업
- 기획 및 MVP 정의, 기능정의 및 기능명세 작성, 데이터 정의, DB 및 ERD 설계, IA 작성, 플로우 차트 작성
