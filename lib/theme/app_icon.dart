import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// [이재은] 앱 전체에서 사용할 아이콘 종류 모음
// -> 사용시 AppIcon.(이름)

class AppIcon {
  AppIcon._();

  // 검색
  static const search = FontAwesomeIcons.magnifyingGlass;

  // 닫기, 거절
  static const close = FontAwesomeIcons.xmark;

  // 수락
  static const okay = FontAwesomeIcons.check;

  // 플러스(작성)
  static const plus = FontAwesomeIcons.plus;

  // 세로 점 세 개
  static const threeDots = FontAwesomeIcons.ellipsisVertical;

  // 삭제(쓰레기통)
  static const delete = FontAwesomeIcons.solidTrashCan;

  // 수정(연필)
  static const edit = FontAwesomeIcons.pencil;

  // 친구 추가, 크루 초대
  static const invite = FontAwesomeIcons.userPlus;

  // 계정 삭제, 친구 삭제
  static const removeUser = FontAwesomeIcons.userXmark;

  // 카메라
  static const camera = FontAwesomeIcons.camera;

  // 이미지, 앨범
  static const image = FeatherIcons.image;

  // 기본 이미지
  static const defaultImage = FontAwesomeIcons.user;

  // 지도 마커 모양
  static const mapPin = FeatherIcons.mapPin;

  // 비행기 모양
  static const airplane = FontAwesomeIcons.plane;

  // 이륙하는 비행기 모양
  static const airplaneFly = FontAwesomeIcons.planeDeparture;

  // 크루 숫자 모양
  static const crews = FontAwesomeIcons.userGroup;

  // 홈
  static const home = FontAwesomeIcons.house;

  // 달력 모양
  static const calendar = FontAwesomeIcons.calendar;

  // 체크리스트
  static const checklist = FeatherIcons.checkSquare;

  // 다이어리
  static const diary = FeatherIcons.bookOpen;

  // 톡톡
  static const talk = FontAwesomeIcons.comment;

  // 비공개
  static const lock = FontAwesomeIcons.lock;

  // 공개
  static const unlock = FontAwesomeIcons.globe;

  // 알림(종)
  static const alarm = FontAwesomeIcons.bell;

  // 설정
  static const setting = FeatherIcons.settings;

  // 시스템 (모니터)
  static const system = FontAwesomeIcons.display;

  // 경고 (동그라미)
  static const alert = FeatherIcons.alertCircle;

  // 경고 (세모)
  static const alertTriangle = FeatherIcons.alertTriangle;

  // 정렬(위 화살표)
  static const upArrow = FontAwesomeIcons.arrowUp;

  // 정렬(아래 화살표)
  static const downArrow = FontAwesomeIcons.arrowDown;

  // 뒤로 가기(왼쪽 화살표)
  static const back = FontAwesomeIcons.arrowLeft;

  // 아래로 펼치기
  static const openDown = FontAwesomeIcons.chevronDown;

  // 위로 접기
  static const closeUp = FontAwesomeIcons.chevronUp;

  // 하트
  static const heart = FontAwesomeIcons.heart;

  // 별
  static const star = FontAwesomeIcons.star;

  static const halfStar = FontAwesomeIcons.solidStarHalf;

  static const fullStar = FontAwesomeIcons.solidStar;

  // 소비(돈표시)
  static const money = FontAwesomeIcons.dollarSign;

  // 메모(스티키노트)
  static const memo = FontAwesomeIcons.noteSticky;

  // 업로드
  static const upload = FontAwesomeIcons.arrowUpFromBracket;

  // 다운로드
  static const download = FeatherIcons.download;

  // 시계
  static const clock = FontAwesomeIcons.clock;

  // 쓸만한 표현
  static const phrase = FontAwesomeIcons.language;

  // 편지 모양(친구 요청, 여행 초대)
  static const letter = FontAwesomeIcons.envelope;

  // 테마 설정(라이트)
  static const lightMode = Icon(FeatherIcons.sun);

  // 테마 설정(다크)
  static const darkMode = Icon(FeatherIcons.moon);

  // 권한 설정(방패)
  static const defense = FontAwesomeIcons.shield;

  // 로그아웃
  static const logout = FontAwesomeIcons.arrowRightFromBracket;

  // 카테고리(태그)
  static const tag = Icon(FeatherIcons.tag);

  // 모래시계
  static const hourGlass = FontAwesomeIcons.hourglass;

  // 저장
  static const save = Icon(FeatherIcons.save);
}
