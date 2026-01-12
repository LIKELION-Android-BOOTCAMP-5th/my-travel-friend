import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/core/result/result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/result/failures.dart';
import '../../domain/entities/onboarding_entity.dart';
import '../dtos/onboarding_dto.dart';
import 'onboarding_data_source.dart';

// [이재은] 온보딩 datasource 구현체
@LazySingleton(as: OnboardingDataSource)
class OnboardingDataSourceImpl implements OnboardingDataSource {
  final SharedPreferences _sharedPreferences;
  final SupabaseClient _supabaseClient;

  static const String _onboardingCompletedKey = 'onboarding_completed';

  OnboardingDataSourceImpl(this._sharedPreferences, this._supabaseClient);

  @override
  Future<Result<bool>> isOnboardingCompleted() async {
    try {
      final isCompleted =
          _sharedPreferences.getBool(_onboardingCompletedKey) ?? false;
      return Result.success(isCompleted);
    } catch (e) {
      return Result.failure(
        Failure.undefined(message: '온보딩 상태를 불러오는데 실패했어요. ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<void>> setOnboardingCompleted() async {
    try {
      await _sharedPreferences.setBool(_onboardingCompletedKey, true);

      return const Result.success(null);
    } catch (e) {
      return Result.failure(
        Failure.undefined(message: '온보딩 완료 저장에 실패했습니다. ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<void>> resetOnboarding() async {
    try {
      await _sharedPreferences.remove(_onboardingCompletedKey);

      return const Result.success(null);
    } catch (e) {
      return Result.failure(
        Failure.undefined(message: '온보딩 초기화에 실패했습니다: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Result<List<OnboardingEntity>>> getOnboardingPages() async {
    try {
      final res = await _supabaseClient
          .from('onboarding')
          .select()
          .eq('is_active', true)
          .order('index', ascending: true);

      final pages = (res as List)
          .map((json) => OnboardingDTO.fromJson(json).toEntity())
          .toList();

      return Result.success(pages);
    } catch (e) {
      return Result.failure(
        Failure.serverFailure(
          message: '온보딩 페이지를 불러오는데 실패했습니다: ${e.toString()}',
        ),
      );
    }
  }
}
