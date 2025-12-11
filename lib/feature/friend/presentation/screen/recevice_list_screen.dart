// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_travel_friend/core/widget/button.dart';
//
// import '../../../../core/widget/app_bar.dart';
// import '../../../../theme/app_colors.dart';
// import '../../../../theme/app_icon.dart';
// import '../../domain/entities/friend_entity.dart';
// import '../viewmodel/friend_bloc.dart';
// import '../viewmodel/friend_event.dart';
// import '../viewmodel/friend_state.dart';
// import '../widget/friend_widget.dart';
//
// /// [엄수빈] 친구 목록 화면 (UI 전용)
// /// - BlocProvider / 리스너는 FriendBlocWidget 에서 처리
// /// - 여기서는 BlocBuilder 로 상태를 읽어서 화면만 그림
// class FriendListScreen extends StatelessWidget {
//   final int userId;
//
//   const FriendListScreen({super.key, required this.userId});
//
//   @override
//   Widget build(BuildContext context) {
//     final cs = Theme.of(context).colorScheme;
//
//     return SafeArea(
//       child: Scaffold(
//         appBar: CustomButtonAppBar(
//           title: "친구 목록",
//           leading: Button(
//             onTap: () {},
//             width: 40,
//             height: 40,
//             icon: Icon(AppIcon.back),
//             contentColor: AppColors.lessLight,
//             borderRadius: 20,
//           ),
//           actions: [
//             Button(
//               onTap: () {},
//               width: 40,
//               height: 40,
//               contentColor: AppColors.lessLight,
//               borderRadius: 20,
//               icon: Icon(AppIcon.search),
//             ),
//             Button(
//               onTap: () {},
//               width: 40,
//               height: 40,
//               contentColor: AppColors.lessLight,
//               borderRadius: 20,
//               icon: Icon(AppIcon.invite),
//             ),
//           ],
//         ),
//
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: BlocBuilder<FriendBloc, FriendState>(
//             builder: (context, state) {
//               // 에러 상태일 때만 별도 에러 화면
//               if (state.pageState == FriendPageState.error) {
//                 return Center(
//                   child: Text(state.message ?? '친구 목록을 불러오지 못했어요.'),
//                 );
//               }
//
//               // 나머지 상태(initial / loading / loaded / success)는
//               // 모두 현재 friends 리스트를 그대로 보여줌
//               // (loading 시에는 BlocWidget에서 반투명 로딩 레이어가 위에 뜸)
//               return _FriendListBody(
//                 friends: state.friends,
//                 myUserId: state.userId,
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// /// 친구 리스트를 실제로 그려주는 위젯
// class _FriendListBody extends StatelessWidget {
//   final List<FriendEntity> friends;
//   final int myUserId;
//
//   const _FriendListBody({
//     super.key,
//     required this.friends,
//     required this.myUserId,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final cs = Theme.of(context).colorScheme;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         /// 상단 친구 수 표시
//         Text("친구 ${friends.length}명"),
//         const SizedBox(height: 12),
//
//         Expanded(
//           child: friends.isEmpty
//               ? Center(
//                   child: Text(
//                     "친구 목록이 비어있어요",
//                     style: Theme.of(
//                       context,
//                     ).textTheme.bodyLarge?.copyWith(color: cs.onSurfaceVariant),
//                   ),
//                 )
//               : Material(
//                   color: cs.surface,
//                   elevation: 3,
//                   borderRadius: BorderRadius.circular(24),
//                   clipBehavior: Clip.antiAlias,
//                   child: ListView.separated(
//                     itemCount: friends.length,
//                     separatorBuilder: (_, __) => Divider(
//                       indent: 16,
//                       endIndent: 16,
//                       height: 1,
//                       color: cs.primaryContainer.withOpacity(0.3),
//                     ),
//                     itemBuilder: (context, index) {
//                       final friend = friends[index];
//
//                       final int? rawFriendUserId = friend.userId1 == myUserId
//                           ? friend.userId2
//                           : friend.userId1;
//
//                       if (rawFriendUserId == null) {
//                         return const SizedBox.shrink();
//                       }
//
//                       final int friendUserId = rawFriendUserId;
//
//                       return FriendWidget(
//                         name: '친구 $friendUserId',
//                         profileImg: null,
//                         onMoreGoTravel: () {
//                           context.read<FriendBloc>().add(
//                             FriendEvent.goTravel(
//                               myUserId: myUserId,
//                               friendUserId: friendUserId,
//                             ),
//                           );
//                         },
//                         onMoreDeleteFriend: () {
//                           context.read<FriendBloc>().add(
//                             FriendEvent.deleteFriend(
//                               myUserId: myUserId,
//                               friendUserId: friendUserId,
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//         ),
//       ],
//     );
//   }
// }
