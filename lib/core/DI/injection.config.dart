// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:flutter_local_notifications/flutter_local_notifications.dart'
    as _i163;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../feature/alarm/data/datasources/alarm_data_source.dart' as _i58;
import '../../feature/alarm/data/datasources/alarm_data_source_impl.dart'
    as _i1049;
import '../../feature/alarm/data/repositories/alarm_repository_impl.dart'
    as _i915;
import '../../feature/alarm/domain/repositories/alarm_repository.dart' as _i831;
import '../../feature/alarm/domain/usecases/check_alarms_usecase.dart' as _i889;
import '../../feature/alarm/domain/usecases/check_an_alarm_usecase.dart'
    as _i539;
import '../../feature/alarm/domain/usecases/get_alarm_by_id_usecase.dart'
    as _i820;
import '../../feature/alarm/domain/usecases/get_alarms_usecase.dart' as _i135;
import '../../feature/alarm/presentation/viewmodels/alarm_bloc.dart' as _i693;
import '../../feature/auth/data/datasources/apple_auth_data_source.dart'
    as _i278;
import '../../feature/auth/data/datasources/apple_auth_data_source_impl.dart'
    as _i45;
import '../../feature/auth/data/datasources/google_auth_data_source.dart'
    as _i153;
import '../../feature/auth/data/datasources/google_auth_data_source_impl.dart'
    as _i795;
import '../../feature/auth/data/datasources/supabase_auth_data_source.dart'
    as _i1040;
import '../../feature/auth/data/datasources/supabase_auth_data_source_impl.dart'
    as _i436;
import '../../feature/auth/data/repositories/auth_repository_impl.dart'
    as _i263;
import '../../feature/auth/domain/repositories/auth_repository.dart' as _i488;
import '../../feature/auth/domain/usecases/cancel_oauth_usecase.dart' as _i739;
import '../../feature/auth/domain/usecases/get_current_user_usecase.dart'
    as _i529;
import '../../feature/auth/domain/usecases/sign_out_usecase.dart' as _i858;
import '../../feature/auth/domain/usecases/social_sign_in_usecase.dart'
    as _i420;
import '../../feature/auth/domain/usecases/watch_auth_state_usecase.dart'
    as _i456;
import '../../feature/auth/presentation/viewmodel/auth/auth_bloc.dart' as _i474;
import '../../feature/auth/presentation/viewmodel/auth_profile/auth_profile_bloc.dart'
    as _i387;
import '../../feature/diary/data/datasources/diary_data_source.dart' as _i881;
import '../../feature/diary/data/datasources/diary_data_source_impl.dart'
    as _i663;
import '../../feature/diary/data/repositories/diary_repository_impl.dart'
    as _i148;
import '../../feature/diary/domain/repositories/diary_repository.dart' as _i871;
import '../../feature/diary/domain/usecases/create_diary_usecase.dart' as _i27;
import '../../feature/diary/domain/usecases/delete_diary_usecase.dart' as _i699;
import '../../feature/diary/domain/usecases/get_diary_by_id_usecase.dart'
    as _i236;
import '../../feature/diary/domain/usecases/get_my_diaries_usecase.dart'
    as _i730;
import '../../feature/diary/domain/usecases/get_our_diaries_usecase.dart'
    as _i849;
import '../../feature/diary/domain/usecases/update_diary_usecase.dart'
    as _i1039;
import '../../feature/diary/presentation/viewmodels/diary_bloc.dart' as _i611;
import '../../feature/diary/presentation/viewmodels/edit_diary_bloc.dart'
    as _i703;
import '../../feature/diary/presentation/viewmodels/new_diary_bloc.dart'
    as _i1041;
import '../../feature/trip/data/datasources/trip_data_source.dart' as _i1063;
import '../../feature/trip/data/datasources/trip_data_source_impl.dart'
    as _i386;
import '../../feature/trip/data/repositories/trip_repository_impl.dart'
    as _i840;
import '../../feature/trip/domain/repositories/trip_repository.dart' as _i161;
import '../../feature/trip/domain/usecases/create_trip_usecase.dart' as _i779;
import '../../feature/trip/domain/usecases/delete_trip_usecase.dart' as _i832;
import '../../feature/trip/domain/usecases/edit_trip_usecase.dart' as _i637;
import '../../feature/trip/domain/usecases/get_crew_member_count_usecase.dart'
    as _i267;
import '../../feature/trip/domain/usecases/get_my_trip_usecase.dart' as _i521;
import '../../feature/trip/domain/usecases/give_up_trip_usecase.dart' as _i317;
import '../../feature/trip/domain/usecases/search_trip_usecase.dart' as _i437;
import '../../feature/trip/presentation/viewmodels/trip/trip_bloc.dart'
    as _i616;
import '../service/internal/push_notification_service.dart' as _i737;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i892.FirebaseMessaging>(
      () => registerModule.firebaseMessaging,
    );
    gh.lazySingleton<_i163.FlutterLocalNotificationsPlugin>(
      () => registerModule.localNotificationsPlugin,
    );
    await gh.lazySingletonAsync<_i982.FirebaseApp>(
      () => registerModule.initializeFirebaseApp(),
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i454.SupabaseClient>(
      () => registerModule.initializeSupabaseClient(),
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i116.GoogleSignIn>(
      () => registerModule.initializeGoogleSignIn(),
      preResolve: true,
    );
    gh.lazySingleton<_i278.AppleAuthDataSource>(
      () => _i45.AppleAuthDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i153.GoogleAuthDataSource>(
      () => _i795.SocialAuthDataSourceImpl(gh<_i116.GoogleSignIn>()),
    );
    gh.lazySingleton<_i737.PushNotificationService>(
      () => _i737.PushNotificationService(gh<_i892.FirebaseMessaging>()),
    );
    gh.lazySingleton<_i881.DiaryDataSource>(
      () => _i663.DiaryDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i1063.TripDataSource>(
      () => _i386.TripDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i58.AlarmDataSource>(
      () => _i1049.AlarmDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i871.DiaryRepository>(
      () => _i148.DiaryRepositoryImpl(gh<_i881.DiaryDataSource>()),
    );
    gh.lazySingleton<_i1040.SupabaseAuthDataSource>(
      () => _i436.SupabaseAuthDataSourceImpl(
        gh<_i454.SupabaseClient>(),
        gh<_i737.PushNotificationService>(),
      ),
    );
    gh.singleton<_i488.AuthRepository>(
      () => _i263.AuthRepositoryImpl(
        gh<_i153.GoogleAuthDataSource>(),
        gh<_i278.AppleAuthDataSource>(),
        gh<_i1040.SupabaseAuthDataSource>(),
      ),
    );
    gh.lazySingleton<_i161.TripRepository>(
      () => _i840.TripRepositoryImpl(gh<_i1063.TripDataSource>()),
    );
    gh.lazySingleton<_i779.CreateTripUsecase>(
      () => _i779.CreateTripUsecase(gh<_i161.TripRepository>()),
    );
    gh.lazySingleton<_i832.DeleteTripUsecase>(
      () => _i832.DeleteTripUsecase(gh<_i161.TripRepository>()),
    );
    gh.lazySingleton<_i637.EditTripUsecase>(
      () => _i637.EditTripUsecase(gh<_i161.TripRepository>()),
    );
    gh.lazySingleton<_i267.GetCrewMemberCountUsecase>(
      () => _i267.GetCrewMemberCountUsecase(gh<_i161.TripRepository>()),
    );
    gh.lazySingleton<_i521.GetMyTripUsecase>(
      () => _i521.GetMyTripUsecase(gh<_i161.TripRepository>()),
    );
    gh.lazySingleton<_i317.GiveUpTripUsecase>(
      () => _i317.GiveUpTripUsecase(gh<_i161.TripRepository>()),
    );
    gh.lazySingleton<_i437.SearchTripUsecase>(
      () => _i437.SearchTripUsecase(gh<_i161.TripRepository>()),
    );
    gh.lazySingleton<_i831.AlarmRepository>(
      () => _i915.AlarmRepositoryImpl(gh<_i58.AlarmDataSource>()),
    );
    gh.lazySingleton<_i27.CreateDiaryUseCase>(
      () => _i27.CreateDiaryUseCase(gh<_i871.DiaryRepository>()),
    );
    gh.lazySingleton<_i699.DeleteDiaryUseCase>(
      () => _i699.DeleteDiaryUseCase(gh<_i871.DiaryRepository>()),
    );
    gh.lazySingleton<_i236.GetDiaryByIdUseCase>(
      () => _i236.GetDiaryByIdUseCase(gh<_i871.DiaryRepository>()),
    );
    gh.lazySingleton<_i730.GetMyDiariesUseCase>(
      () => _i730.GetMyDiariesUseCase(gh<_i871.DiaryRepository>()),
    );
    gh.lazySingleton<_i849.GetOurDiariesUseCase>(
      () => _i849.GetOurDiariesUseCase(gh<_i871.DiaryRepository>()),
    );
    gh.lazySingleton<_i1039.UpdateDiaryUseCase>(
      () => _i1039.UpdateDiaryUseCase(gh<_i871.DiaryRepository>()),
    );
    gh.factory<_i611.DiaryBloc>(
      () => _i611.DiaryBloc(
        gh<_i849.GetOurDiariesUseCase>(),
        gh<_i730.GetMyDiariesUseCase>(),
        gh<_i236.GetDiaryByIdUseCase>(),
        gh<_i699.DeleteDiaryUseCase>(),
      ),
    );
    gh.factory<_i616.TripBloc>(
      () => _i616.TripBloc(
        gh<_i521.GetMyTripUsecase>(),
        gh<_i267.GetCrewMemberCountUsecase>(),
        gh<_i832.DeleteTripUsecase>(),
        gh<_i317.GiveUpTripUsecase>(),
        gh<_i437.SearchTripUsecase>(),
      ),
    );
    gh.lazySingleton<_i529.GetCurrentUserUseCase>(
      () => _i529.GetCurrentUserUseCase(gh<_i488.AuthRepository>()),
    );
    gh.lazySingleton<_i858.SignOutUseCase>(
      () => _i858.SignOutUseCase(gh<_i488.AuthRepository>()),
    );
    gh.lazySingleton<_i420.SocialSignInUseCase>(
      () => _i420.SocialSignInUseCase(gh<_i488.AuthRepository>()),
    );
    gh.lazySingleton<_i739.CancelOauthUseCase>(
      () => _i739.CancelOauthUseCase(gh<_i488.AuthRepository>()),
    );
    gh.singleton<_i456.WatchAuthStateUseCase>(
      () => _i456.WatchAuthStateUseCase(gh<_i488.AuthRepository>()),
    );
    gh.factory<_i1041.NewDiaryBloc>(
      () => _i1041.NewDiaryBloc(
        gh<_i27.CreateDiaryUseCase>(),
        gh<_i871.DiaryRepository>(),
      ),
    );
    gh.factory<_i703.EditDiaryBloc>(
      () => _i703.EditDiaryBloc(
        gh<_i1039.UpdateDiaryUseCase>(),
        gh<_i871.DiaryRepository>(),
      ),
    );
    gh.lazySingleton<_i889.CheckAlarmsUseCase>(
      () => _i889.CheckAlarmsUseCase(gh<_i831.AlarmRepository>()),
    );
    gh.lazySingleton<_i539.CheckAnAlarmUseCase>(
      () => _i539.CheckAnAlarmUseCase(gh<_i831.AlarmRepository>()),
    );
    gh.lazySingleton<_i820.GetAlarmByIdUseCase>(
      () => _i820.GetAlarmByIdUseCase(gh<_i831.AlarmRepository>()),
    );
    gh.lazySingleton<_i135.GetAlarmsUseCase>(
      () => _i135.GetAlarmsUseCase(gh<_i831.AlarmRepository>()),
    );
    gh.lazySingleton<_i474.AuthBloc>(
      () => _i474.AuthBloc(
        gh<_i420.SocialSignInUseCase>(),
        gh<_i858.SignOutUseCase>(),
        gh<_i739.CancelOauthUseCase>(),
      ),
    );
    gh.singleton<_i387.AuthProfileBloc>(
      () => _i387.AuthProfileBloc(
        gh<_i456.WatchAuthStateUseCase>(),
        gh<_i529.GetCurrentUserUseCase>(),
        gh<_i858.SignOutUseCase>(),
      ),
    );
    gh.factory<_i693.AlarmBloc>(
      () => _i693.AlarmBloc(
        gh<_i135.GetAlarmsUseCase>(),
        gh<_i820.GetAlarmByIdUseCase>(),
        gh<_i539.CheckAnAlarmUseCase>(),
        gh<_i889.CheckAlarmsUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
