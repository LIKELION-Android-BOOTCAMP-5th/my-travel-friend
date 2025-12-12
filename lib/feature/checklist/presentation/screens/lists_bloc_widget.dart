import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/DI/injection.dart';
import '../../../../core/widget/toast_pop.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart';
import '../../../auth/presentation/viewmodel/auth_profile/auth_profile_state.dart';
import '../viewmodels/lists_bloc.dart';
import '../viewmodels/lists_event.dart';
import '../viewmodels/lists_state.dart';
import 'lists_screen.dart';

// [이재은] 체크리스트/투두리스트를 감싸는 위젯
// - BlocProvider로 ListsBloc 제공
// - BlocConsumer로 상태 변화 감지

class ListsBlocWidget extends StatelessWidget {
  final int tripId;

  const ListsBlocWidget({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthProfileBloc>().state;

    if (authState is! AuthProfileAuthenticated) {
      return const Center(child: Text("로그인이 필요합니다"));
    }

    final userId = authState.userInfo.id!;

    return BlocProvider(
      create: (_) {
        final bloc = sl<ListsBloc>();
        bloc.add(ListsEvent.load(tripId: tripId, userId: userId));
        return bloc;
      },
      child: _ListsBlocConsumer(tripId: tripId, userId: userId),
    );
  }
}

class _ListsBlocConsumer extends StatelessWidget {
  final int tripId;
  final int userId;

  const _ListsBlocConsumer({required this.tripId, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListsBloc, ListsState>(
      listener: (context, state) {
        // 에러 메시지 표시
        if (state.message != null && state.message!.isNotEmpty) {
          ToastPop.show(state.message!);
        }
      },
      builder: (context, state) {
        // 초기 로딩 중
        if (state.isLoading && state.pageState == ListsPageState.initial) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListsScreen(tripId: tripId, userId: userId);
      },
    );
  }
}
