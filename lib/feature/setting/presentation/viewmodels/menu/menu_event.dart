import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_event.freezed.dart';

// [이재은] 설정 메뉴 event
@freezed
abstract class MenuEvent with _$MenuEvent {
  // 메뉴 데이터 로드 (받은 요청 개수 표시 등)
  const factory MenuEvent.load() = LoadMenu;

  // 새로고침
  const factory MenuEvent.refresh() = RefreshMenu;
}
