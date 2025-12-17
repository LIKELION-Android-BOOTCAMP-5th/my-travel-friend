import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

// [이재은] UI 디자인에 맞춘 텍스트 필드 컴포넌트
// ===============================================
// 작성 예시
// ===============================================
// 1. 한 줄 입력 텍스트 필드
// TextBox(controller: 컨트롤러, hintText: '힌트 텍스트 내용')
//
// 2. 여러 줄 입력 텍스트 필드 (메모, 다이어리 내용 작성 등)
// TextBox(controller: 컨트롤러, hintText: '힌트 텍스트 내용', maxLines: 5, minLines:3)
//
// 3. 글자수 제한 텍스트 필드 (ex: 닉네임)
// TextBox(controller: 컨트롤러, hintText: '힌트 텍스트 내용', maxLength: 10)
//
// 4. suffix 드롭다운 텍스트 필드 (ex: 돈 단위 선택)
// TextBox(
//   controller: 컨트롤러,
//   hintText: '금액 입력',
//   suffixDropdownItems: ['KRW', 'USD', 'JPY'],
//   suffixDropdownValue: selectedCurrency,
//   onSuffixDropdownChanged: (value) => setState(() => selectedCurrency = value),
// )

class TextBox extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;

  // 크기 관련
  final int maxLines;
  final int minLines; // 여러 줄이면 초기 높이 늘어남
  final int? maxLength;
  final bool expands; // True = 부모 위젯 크기에 맞게 확장

  // 색상 관련
  final Color? backgroundColor;
  final Color? focusedBorderColor;
  final Color? unfocusedBorderColor;
  final Color? textColor;
  final Color? hintColor;

  // 외곽선 관련
  final double borderRadius;
  final double borderWidth;
  final bool showBorder;

  // 기타
  final bool enabled;
  final bool readOnly; // 보이지만 수정불가
  final bool obscureText;
  final bool autofocus; // 자동 포커스
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction; // 키보드 완료 버튼 타입
  final ValueChanged<String>? onChanged; // 텍스트 변경될때 호출 되는 콜백
  final ValueChanged<String>? onSubmitted; // 키보드 완료 버튼 눌렀을 때 콜백
  final VoidCallback? onTap; // 탭했을 때 호출
  final Widget? prefixIcon; // 왼쪽 아이콘
  final Widget? suffixIcon; // 오른쪽 아이콘
  final String? suffix;
  final TextStyle? suffixStyle;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final List<String>? suffixDropdownItems; // 드롭다운 아이템 목록
  final String? suffixDropdownValue; // 현재 선택된 값
  final ValueChanged<String?>? onSuffixDropdownChanged; // 선택 변경 콜백
  final Color? suffixDropdownIconColor; // 드롭다운 아이콘 색상
  final double? suffixDropdownIconSize; // 드롭다운 아이콘 크기
  final List<String>? prefixDropdownItems; // 드롭다운 아이템 목록
  final String? prefixDropdownValue; // 현재 선택된 값
  final ValueChanged<String?>? onPrefixDropdownChanged; // 선택 변경 콜백
  final Color? prefixDropdownIconColor; // 드롭다운 아이콘 색상
  final double? prefixDropdownIconSize; // 드롭다운 아이콘 크기

  const TextBox({
    super.key,
    this.controller,
    this.hintText,

    // 크기 기본값
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength, // 제한 없음
    this.expands = false,

    // 색상 기본값
    this.backgroundColor,
    this.focusedBorderColor,
    this.unfocusedBorderColor,
    this.textColor,
    this.hintColor,

    // 외곽선 기본값
    this.borderRadius = 12.0,
    this.borderWidth = 1.5,
    this.showBorder = true,

    // 기타 기본값
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.autofocus = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.contentPadding,
    this.focusNode,
    this.suffix,
    this.suffixStyle,

    // 드롭다운 기본값(화폐단위)
    this.suffixDropdownItems,
    this.suffixDropdownValue,
    this.onSuffixDropdownChanged,
    this.suffixDropdownIconColor,
    this.suffixDropdownIconSize = 20,

    // 드롭다운 기본값(결제수단)
    this.prefixDropdownItems,
    this.prefixDropdownValue,
    this.onPrefixDropdownChanged,
    this.prefixDropdownIconColor,
    this.prefixDropdownIconSize = 20,
  });

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    // 테마 색상 설정
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = colorScheme.brightness == Brightness.dark;

    // 모드에 따라 색상 변경
    final bgColor = isDark ? AppColors.navy : AppColors.darkerGray;
    final focusBorder = widget.focusedBorderColor ?? colorScheme.primary;
    final unfocusBorder = widget.unfocusedBorderColor ?? Colors.transparent;
    final txtColor = widget.textColor ?? colorScheme.onSurface;
    final hntColor = widget.hintColor ?? colorScheme.onSurfaceVariant;

    // 드롭다운이 있는 경우 Row로 감싸서 처리
    final hasPrefixDropdown =
        widget.prefixDropdownItems != null &&
        widget.prefixDropdownItems!.isNotEmpty;
    final hasSuffixDropdown =
        widget.suffixDropdownItems != null &&
        widget.suffixDropdownItems!.isNotEmpty;

    // 드롭다운이 하나라도 있으면 Row로 감싸서 처리
    if (hasPrefixDropdown || hasSuffixDropdown) {
      return Row(
        children: [
          // prefix 드롭다운
          if (hasPrefixDropdown) ...[
            _buildDropdownButton(
              items: widget.prefixDropdownItems!,
              value: widget.prefixDropdownValue,
              onChanged: widget.onPrefixDropdownChanged,
              iconColor: widget.prefixDropdownIconColor,
              iconSize: widget.prefixDropdownIconSize ?? 20,
              bgColor: bgColor,
              txtColor: txtColor,
              hntColor: hntColor,
            ),
            const SizedBox(width: 8),
          ],

          // TextField 영역
          Expanded(
            child: _buildTextField(
              bgColor: bgColor,
              focusBorder: focusBorder,
              unfocusBorder: unfocusBorder,
              txtColor: txtColor,
              hntColor: hntColor,
              showPrefix: !hasPrefixDropdown,
              showSuffix: !hasSuffixDropdown,
            ),
          ),

          // suffix 드롭다운
          if (hasSuffixDropdown) ...[
            const SizedBox(width: 8),
            _buildDropdownButton(
              items: widget.suffixDropdownItems!,
              value: widget.suffixDropdownValue,
              onChanged: widget.onSuffixDropdownChanged,
              iconColor: widget.suffixDropdownIconColor,
              iconSize: widget.suffixDropdownIconSize ?? 20,
              bgColor: bgColor,
              txtColor: txtColor,
              hntColor: hntColor,
            ),
          ],
        ],
      );
    }

    // 드롭다운 없으면 기존 TextField만
    return _buildTextField(
      bgColor: bgColor,
      focusBorder: focusBorder,
      unfocusBorder: unfocusBorder,
      txtColor: txtColor,
      hntColor: hntColor,
      showSuffix: true,
      showPrefix: true,
    );
  }

  // TextField 위젯 반환
  Widget _buildTextField({
    required Color bgColor,
    required Color focusBorder,
    required Color unfocusBorder,
    required Color txtColor,
    required Color hntColor,
    required bool showSuffix,
    required bool showPrefix,
  }) {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,

      // 줄 수 설정
      maxLines: widget.expands ? null : widget.maxLines,
      minLines: widget.expands ? null : widget.minLines,

      maxLength: widget.maxLength,
      expands: widget.expands,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      obscureText: widget.obscureText,
      autofocus: widget.autofocus,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      onTap: widget.onTap,

      // 텍스트 스타일
      style: TextStyle(color: txtColor, fontSize: 14),

      // 외관 설정
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: hntColor),

        filled: true,
        fillColor: bgColor,

        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        suffixText: widget.suffix,
        suffixStyle: widget.suffixStyle,

        counterStyle: TextStyle(color: hntColor),

        // 내부 여백
        contentPadding:
            widget.contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

        // 기본 테두리
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: widget.showBorder
              ? BorderSide(color: unfocusBorder, width: widget.borderWidth)
              : BorderSide.none,
        ),

        // 활성화 상태 테두리 (포커스 안 되었을 때)
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: widget.showBorder
              ? BorderSide(color: unfocusBorder, width: widget.borderWidth)
              : BorderSide.none,
        ),

        // 포커스 상태 테두리 (입력 중일 때)
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: focusBorder, width: widget.borderWidth),
        ),

        // 비활성화 상태 테두리
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // 드롭다운 버튼 빌드 (prefix/suffix 공용)
  Widget _buildDropdownButton({
    required List<String> items,
    required String? value,
    required ValueChanged<String?>? onChanged,
    required Color? iconColor,
    required double iconSize,
    required Color bgColor,
    required Color txtColor,
    required Color hntColor,
  }) {
    final dropdownIcon = iconColor ?? hntColor;

    final verticalPadding = widget.contentPadding != null
        ? (widget.contentPadding as EdgeInsets).vertical
        : 24.0; // 기본값: 12 * 2
    final textFieldHeight = 22.0 + verticalPadding;

    return Container(
      height: textFieldHeight,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isDense: true,
          icon: Icon(
            Icons.arrow_drop_down,
            color: dropdownIcon,
            size: iconSize,
          ),
          style: TextStyle(color: txtColor, fontSize: 14),
          dropdownColor: bgColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          items: items.map((item) {
            return DropdownMenuItem<String>(value: item, child: Text(item));
          }).toList(),
          onChanged: widget.enabled ? onChanged : null,
        ),
      ),
    );
  }
}
