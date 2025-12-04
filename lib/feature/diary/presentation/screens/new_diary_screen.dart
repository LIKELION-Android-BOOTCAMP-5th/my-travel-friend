// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_travel_friend/core/widget/text_box.dart';
// import 'package:my_travel_friend/feature/diary/presentation/widgets/schedule_picker_button.dart';
// import 'package:my_travel_friend/theme/app_font.dart';
//
// import '../../../../theme/app_colors.dart';
// import '../viewmodels/diary_bloc.dart';
//
// // [이재은] 새로운 다이어리 작성 화면
//
// class NewDiaryScreen extends StatefulWidget {
//   final TextEditingController? controller1;
//   final TextEditingController? controller2;
//   final TextEditingController? controller3;
//   final TextEditingController? controller4;
//
//   final int diaryId;
//   final int tripId;
//   final int userId;
//
//   const NewDiaryScreen({
//     super.key,
//     required this.diaryId,
//     required this.tripId,
//     required this.userId,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final diaryBloc = BlocProvider.of<DiaryBloc>(context);
//     final colorScheme = Theme.of(context).colorScheme;
//     final isDark = colorScheme.brightness == Brightness.dark;
//
//     return SafeArea(
//       child: Scaffold(
//         // 모드에 따른 배경 색 변경
//         backgroundColor: isDark ? AppColors.navy : AppColors.lessLight,
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // 타입 버튼
//               _buildTypeTabs(context, diaryBloc),
//               const SizedBox(height: 32),
//               // 제목, 내용
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "제목",
//                     style: AppFont.regularBold.copyWith(
//                       color: colorScheme.onSurface,
//                     ),
//                   ),
//                   SchedulePickerButton(onTap: () {}),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "내용",
//                     style: AppFont.regularBold.copyWith(
//                       color: colorScheme.onSurface,
//                     ),
//                   ),
//                   SizedBox(height: 8),
//                   TextBox(),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
