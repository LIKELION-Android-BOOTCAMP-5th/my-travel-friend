import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// [이재은] 앱 전체에서 사용할 아이콘 종류 모음
// -> 사용시 AppIcon.(이름)

class AppIcon {
  AppIcon._();

  // 검색
  static const search = FaIcon(FontAwesomeIcons.magnifyingGlass);

  // 닫기, 거절
  static const close = FaIcon(FontAwesomeIcons.xmark);

  // 수락
  static const okay = FaIcon(FontAwesomeIcons.check);

  // 플러스(작성)
  static const plus = FaIcon(FontAwesomeIcons.plus);

  // 세로 점 세 개
  static const threeDots = FaIcon(FontAwesomeIcons.ellipsisVertical);

  // 삭제(쓰레기통)
  static const delete = FaIcon(FontAwesomeIcons.solidTrashCan);

  // 수정(연필)
  static const edit = FaIcon(FontAwesomeIcons.pencil);

  // 친구 추가, 크루 초대
  static const invite = FaIcon(FontAwesomeIcons.userPlus);

  // 계정 삭제, 친구 삭제
  static const removeUser = FaIcon(FontAwesomeIcons.userXmark);

  // 카메라
  static const camera = FaIcon(FontAwesomeIcons.camera);

  // 이미지, 앨범
  static const image = Icon(FeatherIcons.image);

  // 기본 이미지
  static const defaultImage = FaIcon(FontAwesomeIcons.user);

  // 지도 마커 모양
  static const mapPin = Icon(FeatherIcons.mapPin);

  // 비행기 모양
  static const airplane = FaIcon(FontAwesomeIcons.plane);

  // 이륙하는 비행기 모양
  static const airplaneFly = FaIcon(FontAwesomeIcons.planeDeparture);

  // 크루 숫자 모양
  static const crews = FaIcon(FontAwesomeIcons.userGroup);

  // 홈
  static const home = FaIcon(FontAwesomeIcons.house);

  // 달력 모양
  static const calendar = FaIcon(FontAwesomeIcons.calendar);

  // 체크리스트
  static const checklist = Icon(FeatherIcons.checkSquare);

  // 다이어리
  static const diary = Icon(FeatherIcons.bookOpen);

  // 톡톡
  static const talk = FaIcon(FontAwesomeIcons.comment);

  // 비공개
  static const lock = FaIcon(FontAwesomeIcons.lock);

  // 공개
  static const unlock = FaIcon(FontAwesomeIcons.globe);

  // 알림(종)
  static const alarm = FaIcon(FontAwesomeIcons.bell);

  // 설정
  static const setting = Icon(FeatherIcons.settings);

  // 시스템 (모니터)
  static const system = FaIcon(FontAwesomeIcons.display);

  // 경고 (동그라미)
  static const alert = Icon(FeatherIcons.alertCircle);

  // 경고 (세모)
  static const alertTriangle = Icon(FeatherIcons.alertTriangle);

  // 정렬(위 화살표)
  static const upArrow = FaIcon(FontAwesomeIcons.arrowUp);

  // 정렬(아래 화살표)
  static const downArrow = FaIcon(FontAwesomeIcons.arrowDown);

  // 뒤로 가기(왼쪽 화살표)
  static const back = FaIcon(FontAwesomeIcons.arrowLeft);

  // 아래로 펼치기
  static const openDown = FaIcon(FontAwesomeIcons.chevronDown);

  // 위로 접기
  static const closeUp = FaIcon(FontAwesomeIcons.chevronUp);

  // 하트
  static const heart = FaIcon(FontAwesomeIcons.heart);

  // 별
  static const start = FaIcon(FontAwesomeIcons.star);

  // 소비(돈표시)
  static const money = FaIcon(FontAwesomeIcons.dollarSign);

  // 메모(스티키노트)
  static const memo = FaIcon(FontAwesomeIcons.noteSticky);

  // 업로드
  static const upload = FaIcon(FontAwesomeIcons.arrowUpFromBracket);

  // 시계
  static const clock = FaIcon(FontAwesomeIcons.clock);

  // 쓸만한 표현
  static const phrase = FaIcon(FontAwesomeIcons.language);

  // 편지 모양(친구 요청, 여행 초대)
  static const letter = FaIcon(FontAwesomeIcons.envelope);

  // 테마 설정(라이트)
  static const lightMode = Icon(FeatherIcons.sun);

  // 테마 설정(다크)
  static const darkMode = Icon(FeatherIcons.moon);

  // 권한 설정(방패)
  static const defense = FaIcon(FontAwesomeIcons.shield);

  // 로그아웃
  static const logout = FaIcon(FontAwesomeIcons.arrowRightFromBracket);

  // 카테고리(태그)
  static const tag = Icon(FeatherIcons.tag);
}
