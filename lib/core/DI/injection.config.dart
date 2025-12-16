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
import 'package:shared_preferences/shared_preferences.dart' as _i460;
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
import '../../feature/alarm/domain/usecases/unsubscribe_alarms_usecase.dart'
    as _i1067;
import '../../feature/alarm/domain/usecases/watch_alarms_usecase.dart' as _i25;
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
import '../../feature/chat/data/datasources/chat_data_source.dart' as _i888;
import '../../feature/chat/data/datasources/chat_data_source_impl.dart' as _i96;
import '../../feature/chat/data/repositories/chat_repository_impl.dart'
    as _i269;
import '../../feature/chat/domain/repositories/chat_repository.dart' as _i167;
import '../../feature/chat/domain/usecases/get_chat_usecase.dart' as _i91;
import '../../feature/chat/domain/usecases/get_read_status_usecase.dart'
    as _i38;
import '../../feature/chat/domain/usecases/get_trip_crew_usecase.dart' as _i285;
import '../../feature/chat/domain/usecases/get_unread_count_usecase.dart'
    as _i562;
import '../../feature/chat/domain/usecases/send_chat_usecase.dart' as _i239;
import '../../feature/chat/domain/usecases/subscribe_chat_usecase.dart'
    as _i284;
import '../../feature/chat/domain/usecases/update_read_status_usecase.dart'
    as _i383;
import '../../feature/chat/presentation/viewmodels/chat_bloc.dart' as _i663;
import '../../feature/checklist/data/datasources/checklist_data_source.dart'
    as _i877;
import '../../feature/checklist/data/datasources/checklist_data_source_impl.dart'
    as _i694;
import '../../feature/checklist/data/datasources/todo_list_data_source.dart'
    as _i540;
import '../../feature/checklist/data/datasources/todo_list_data_source_impl.dart'
    as _i79;
import '../../feature/checklist/data/repositories/checklist_repository_impl.dart'
    as _i418;
import '../../feature/checklist/data/repositories/todo_list_repository_impl.dart'
    as _i438;
import '../../feature/checklist/domain/repositories/checklist_repository.dart'
    as _i181;
import '../../feature/checklist/domain/repositories/todo_list_repository.dart'
    as _i579;
import '../../feature/checklist/domain/usecases/create_checklist_usecase.dart'
    as _i622;
import '../../feature/checklist/domain/usecases/create_todo_list_usecase.dart'
    as _i1051;
import '../../feature/checklist/domain/usecases/delete_checklist_usecase.dart'
    as _i95;
import '../../feature/checklist/domain/usecases/delete_todo_list_usecase.dart'
    as _i311;
import '../../feature/checklist/domain/usecases/get_my_checklist_usecase.dart'
    as _i979;
import '../../feature/checklist/domain/usecases/get_my_todo_list_usecase.dart'
    as _i30;
import '../../feature/checklist/domain/usecases/toggle_checklist_usecase.dart'
    as _i349;
import '../../feature/checklist/domain/usecases/toggle_todo_list_usecase.dart'
    as _i57;
import '../../feature/checklist/presentation/viewmodels/lists_bloc.dart'
    as _i130;
import '../../feature/diary/data/datasources/diary_data_source.dart' as _i881;
import '../../feature/diary/data/datasources/diary_data_source_impl.dart'
    as _i663;
import '../../feature/diary/data/repositories/diary_repository_impl.dart'
    as _i148;
import '../../feature/diary/domain/repositories/diary_repository.dart' as _i871;
import '../../feature/diary/domain/usecases/create_diary_usecase.dart' as _i27;
import '../../feature/diary/domain/usecases/delete_diary_img_usecase.dart'
    as _i55;
import '../../feature/diary/domain/usecases/delete_diary_usecase.dart' as _i699;
import '../../feature/diary/domain/usecases/get_diary_by_id_usecase.dart'
    as _i236;
import '../../feature/diary/domain/usecases/get_my_diaries_usecase.dart'
    as _i730;
import '../../feature/diary/domain/usecases/get_our_diaries_usecase.dart'
    as _i849;
import '../../feature/diary/domain/usecases/update_diary_usecase.dart'
    as _i1039;
import '../../feature/diary/domain/usecases/upload_diary_img_usecase.dart'
    as _i998;
import '../../feature/diary/presentation/viewmodels/diary/diary_bloc.dart'
    as _i27;
import '../../feature/diary/presentation/viewmodels/edit_diary/edit_diary_bloc.dart'
    as _i935;
import '../../feature/diary/presentation/viewmodels/new_diary/new_diary_bloc.dart'
    as _i885;
import '../../feature/friend/data/datasources/friend_data_source.dart' as _i297;
import '../../feature/friend/data/datasources/friend_data_source_impl.dart'
    as _i845;
import '../../feature/friend/data/datasources/friend_request_data_source.dart'
    as _i340;
import '../../feature/friend/data/datasources/friend_request_data_source_impl.dart'
    as _i920;
import '../../feature/friend/data/repositories/friend_repository_impl.dart'
    as _i1001;
import '../../feature/friend/data/repositories/friend_request_repository_impl.dart'
    as _i742;
import '../../feature/friend/domain/repositories/friend_repository.dart'
    as _i359;
import '../../feature/friend/domain/repositories/friend_request_repository.dart'
    as _i255;
import '../../feature/friend/domain/usecases/accept_request_usecase.dart'
    as _i669;
import '../../feature/friend/domain/usecases/create_friend_relation_usecase.dart'
    as _i639;
import '../../feature/friend/domain/usecases/create_friend_request_usecase.dart'
    as _i611;
import '../../feature/friend/domain/usecases/delete_friend_usecases.dart'
    as _i285;
import '../../feature/friend/domain/usecases/delete_request_usecase.dart'
    as _i491;
import '../../feature/friend/domain/usecases/get_friend_relation_usecase.dart'
    as _i813;
import '../../feature/friend/domain/usecases/get_friend_request_usecase.dart'
    as _i739;
import '../../feature/friend/domain/usecases/get_friend_users_usecase.dart'
    as _i151;
import '../../feature/friend/domain/usecases/get_friends_usecase.dart' as _i806;
import '../../feature/friend/domain/usecases/get_request_profile_usecase.dart'
    as _i1062;
import '../../feature/friend/domain/usecases/get_sent_request_usecase.dart'
    as _i823;
import '../../feature/friend/domain/usecases/search_nickname_usecase.dart'
    as _i617;
import '../../feature/friend/domain/usecases/search_request_name_usecase.dart'
    as _i1012;
import '../../feature/friend/presentation/viewmodel/friend_bloc.dart' as _i186;
import '../../feature/friend/presentation/viewmodel/friend_request_bloc.dart'
    as _i69;
import '../../feature/schedule/data/datasources/schedule_data_source.dart'
    as _i334;
import '../../feature/schedule/data/datasources/schedule_data_source_impl.dart'
    as _i77;
import '../../feature/schedule/data/repositories/schedule_repository_impl.dart'
    as _i625;
import '../../feature/schedule/domain/repositories/schedule_repository.dart'
    as _i456;
import '../../feature/schedule/domain/usecases/create_schedule_usecase.dart'
    as _i361;
import '../../feature/schedule/domain/usecases/delete_schedule_usecase.dart'
    as _i714;
import '../../feature/schedule/domain/usecases/edit_schedule_usecase.dart'
    as _i29;
import '../../feature/schedule/domain/usecases/get_all_schedule_usecase.dart'
    as _i600;
import '../../feature/schedule/domain/usecases/get_category_usecase.dart'
    as _i379;
import '../../feature/schedule/domain/usecases/get_schedule_member_usecase.dart'
    as _i415;
import '../../feature/schedule/domain/usecases/get_trip_member_usecase.dart'
    as _i324;
import '../../feature/schedule/domain/usecases/get_user_schudule_usecase.dart'
    as _i818;
import '../../feature/schedule/presentation/viewmodels/create_schedule/create_schedule_blco.dart'
    as _i725;
import '../../feature/schedule/presentation/viewmodels/edit_schedule/edit_schedule_bloc.dart'
    as _i229;
import '../../feature/schedule/presentation/viewmodels/map_search/map_search_bloc.dart'
    as _i196;
import '../../feature/schedule/presentation/viewmodels/schedule/schedule_bloc.dart'
    as _i865;
import '../../feature/setting/data/datasources/alarm/alarm_setting_datasource.dart'
    as _i1030;
import '../../feature/setting/data/datasources/alarm/alarm_setting_datasource_impl.dart'
    as _i96;
import '../../feature/setting/data/datasources/profile/profile_data_source.dart'
    as _i1071;
import '../../feature/setting/data/datasources/profile/profile_data_source_impl.dart'
    as _i270;
import '../../feature/setting/data/repositories/alarm_setting_repository_impl.dart'
    as _i124;
import '../../feature/setting/data/repositories/profile_repository_impl.dart'
    as _i73;
import '../../feature/setting/domain/repositories/alarm_setting_repository.dart'
    as _i212;
import '../../feature/setting/domain/repositories/profile_repository.dart'
    as _i565;
import '../../feature/setting/domain/usecases/alarm/get_my_alarm_setting_usecase.dart'
    as _i420;
import '../../feature/setting/domain/usecases/alarm/update_alarm_setting_usecase.dart'
    as _i87;
import '../../feature/setting/domain/usecases/permission/check_permission_usecase.dart'
    as _i584;
import '../../feature/setting/domain/usecases/permission/open_settings_usecase.dart'
    as _i63;
import '../../feature/setting/domain/usecases/permission/request_permission_usecase.dart'
    as _i1063;
import '../../feature/setting/domain/usecases/profile/check_nickname_duplicate_usecase.dart'
    as _i945;
import '../../feature/setting/domain/usecases/profile/delete_img_usecase.dart'
    as _i715;
import '../../feature/setting/domain/usecases/profile/update_profile_usecase.dart'
    as _i473;
import '../../feature/setting/domain/usecases/profile/upload_img_usecase.dart'
    as _i304;
import '../../feature/setting/domain/usecases/theme/get_theme_usecase.dart'
    as _i231;
import '../../feature/setting/domain/usecases/theme/update_theme_usecase.dart'
    as _i668;
import '../../feature/setting/presentation/viewmodels/alarm/alarm_setting_bloc.dart'
    as _i695;
import '../../feature/setting/presentation/viewmodels/menu/menu_bloc.dart'
    as _i70;
import '../../feature/setting/presentation/viewmodels/permission/permission_bloc.dart'
    as _i862;
import '../../feature/setting/presentation/viewmodels/profile/profile_bloc.dart'
    as _i557;
import '../../feature/setting/presentation/viewmodels/theme/theme_bloc.dart'
    as _i572;
import '../../feature/trip/data/datasources/trip_data_source.dart' as _i1063;
import '../../feature/trip/data/datasources/trip_data_source_impl.dart'
    as _i386;
import '../../feature/trip/data/repositories/trip_repository_impl.dart'
    as _i840;
import '../../feature/trip/domain/repositories/trip_repository.dart' as _i161;
import '../../feature/trip/domain/usecases/create_trip_usecase.dart' as _i779;
import '../../feature/trip/domain/usecases/delete_img_usecase.dart' as _i202;
import '../../feature/trip/domain/usecases/delete_trip_usecase.dart' as _i832;
import '../../feature/trip/domain/usecases/edit_trip_usecase.dart' as _i637;
import '../../feature/trip/domain/usecases/get_crew_member_count_usecase.dart'
    as _i267;
import '../../feature/trip/domain/usecases/get_my_trip_usecase.dart' as _i521;
import '../../feature/trip/domain/usecases/get_trip_by_id_usecase.dart'
    as _i277;
import '../../feature/trip/domain/usecases/give_up_trip_usecase.dart' as _i317;
import '../../feature/trip/domain/usecases/search_trip_usecase.dart' as _i437;
import '../../feature/trip/presentation/viewmodels/create_trip/create_trip_bloc.dart'
    as _i873;
import '../../feature/trip/presentation/viewmodels/edit_trip/edit_trip_bloc.dart'
    as _i703;
import '../../feature/trip/presentation/viewmodels/trip/trip_bloc.dart'
    as _i616;
import '../../feature/trip/presentation/viewmodels/trip_detail/trip_detail_bloc.dart'
    as _i1000;
import '../service/internal/deep_link_service.dart' as _i507;
import '../service/internal/permission_service.dart' as _i213;
import '../service/internal/push_notification_service.dart' as _i737;
import '../service/internal/supabase_storage_service.dart' as _i1051;
import '../service/internal/theme_service.dart' as _i1026;
import 'register_module.dart' as _i291;
import 'theme_module.dart' as _i170;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final themeModule = _$ThemeModule();
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => themeModule.prefs,
      preResolve: true,
    );
    gh.factory<_i196.MapSearchBloc>(() => _i196.MapSearchBloc());
    gh.factory<_i70.MenuBloc>(() => _i70.MenuBloc());
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
    gh.lazySingleton<_i507.DeepLinkService>(() => _i507.DeepLinkService());
    gh.lazySingleton<_i213.PermissionService>(() => _i213.PermissionService());
    gh.lazySingleton<_i1026.ThemeService>(() => _i1026.ThemeService());
    gh.lazySingleton<_i278.AppleAuthDataSource>(
      () => _i45.AppleAuthDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i737.PushNotificationService>(
      () => _i737.PushNotificationService(
        gh<_i892.FirebaseMessaging>(),
        gh<_i507.DeepLinkService>(),
        gh<_i163.FlutterLocalNotificationsPlugin>(),
      ),
    );
    gh.lazySingleton<_i153.GoogleAuthDataSource>(
      () => _i795.SocialAuthDataSourceImpl(gh<_i116.GoogleSignIn>()),
    );
    gh.lazySingleton<_i1040.SupabaseAuthDataSource>(
      () => _i436.SupabaseAuthDataSourceImpl(
        gh<_i454.SupabaseClient>(),
        gh<_i737.PushNotificationService>(),
      ),
    );
    gh.lazySingleton<_i231.GetThemeUseCase>(
      () => _i231.GetThemeUseCase(gh<_i1026.ThemeService>()),
    );
    gh.lazySingleton<_i668.UpdateThemeUseCase>(
      () => _i668.UpdateThemeUseCase(gh<_i1026.ThemeService>()),
    );
    gh.lazySingleton<_i1051.SupabaseStorageService>(
      () => _i1051.SupabaseStorageService(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i1063.TripDataSource>(
      () => _i386.TripDataSourceImpl(
        gh<_i454.SupabaseClient>(),
        gh<_i1051.SupabaseStorageService>(),
      ),
    );
    gh.lazySingleton<_i584.CheckPermissionsUseCase>(
      () => _i584.CheckPermissionsUseCase(gh<_i213.PermissionService>()),
    );
    gh.lazySingleton<_i63.OpenSettingsUseCase>(
      () => _i63.OpenSettingsUseCase(gh<_i213.PermissionService>()),
    );
    gh.lazySingleton<_i1063.RequestPermissionUseCase>(
      () => _i1063.RequestPermissionUseCase(gh<_i213.PermissionService>()),
    );
    gh.lazySingleton<_i334.ScheduleDataSource>(
      () => _i77.ScheduleDataSourceImpl(supabase: gh<_i454.SupabaseClient>()),
    );
    gh.singleton<_i488.AuthRepository>(
      () => _i263.AuthRepositoryImpl(
        gh<_i153.GoogleAuthDataSource>(),
        gh<_i278.AppleAuthDataSource>(),
        gh<_i1040.SupabaseAuthDataSource>(),
      ),
    );
    gh.lazySingleton<_i340.FriendRequestDataSource>(
      () => _i920.FriendRequestDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i540.TodoListDataSource>(
      () => _i79.TodoListDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i161.TripRepository>(
      () => _i840.TripRepositoryImpl(gh<_i1063.TripDataSource>()),
    );
    gh.lazySingleton<_i877.ChecklistDataSource>(
      () => _i694.ChecklistDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i881.DiaryDataSource>(
      () => _i663.DiaryDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i779.CreateTripUsecase>(
      () => _i779.CreateTripUsecase(gh<_i161.TripRepository>()),
    );
    gh.lazySingleton<_i202.DeleteImgUsecase>(
      () => _i202.DeleteImgUsecase(gh<_i161.TripRepository>()),
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
    gh.lazySingleton<_i317.GiveUpTripUseCase>(
      () => _i317.GiveUpTripUseCase(gh<_i161.TripRepository>()),
    );
    gh.lazySingleton<_i437.SearchTripUsecase>(
      () => _i437.SearchTripUsecase(gh<_i161.TripRepository>()),
    );
    gh.lazySingleton<_i1071.ProfileDataSource>(
      () => _i270.ProfileDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.singleton<_i572.ThemeBloc>(
      () => _i572.ThemeBloc(
        gh<_i231.GetThemeUseCase>(),
        gh<_i668.UpdateThemeUseCase>(),
      ),
    );
    gh.lazySingleton<_i456.ScheduleRepository>(
      () => _i625.ScheduleRepositoryImpl(gh<_i334.ScheduleDataSource>()),
    );
    gh.lazySingleton<_i297.FriendDataSource>(
      () => _i845.FriendDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.factory<_i862.PermissionBloc>(
      () => _i862.PermissionBloc(
        gh<_i63.OpenSettingsUseCase>(),
        gh<_i584.CheckPermissionsUseCase>(),
        gh<_i1063.RequestPermissionUseCase>(),
      ),
    );
    gh.lazySingleton<_i58.AlarmDataSource>(
      () => _i1049.AlarmDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i579.TodoListRepository>(
      () => _i438.TodoListRepositoryImpl(gh<_i540.TodoListDataSource>()),
    );
    gh.lazySingleton<_i565.ProfileRepository>(
      () => _i73.ProfileRepositoryImpl(gh<_i1071.ProfileDataSource>()),
    );
    gh.lazySingleton<_i888.ChatDataSource>(
      () => _i96.ChatDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i1030.AlarmSettingDataSource>(
      () => _i96.AlarmSettingDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.factory<_i616.TripBloc>(
      () => _i616.TripBloc(
        gh<_i521.GetMyTripUsecase>(),
        gh<_i267.GetCrewMemberCountUsecase>(),
        gh<_i832.DeleteTripUsecase>(),
        gh<_i317.GiveUpTripUseCase>(),
        gh<_i437.SearchTripUsecase>(),
        gh<_i202.DeleteImgUsecase>(),
      ),
    );
    gh.lazySingleton<_i277.GetTripByIdUseCase>(
      () => _i277.GetTripByIdUseCase(gh<_i161.TripRepository>()),
    );
    gh.lazySingleton<_i30.GetMyTodoListUseCase>(
      () => _i30.GetMyTodoListUseCase(gh<_i579.TodoListRepository>()),
    );
    gh.lazySingleton<_i871.DiaryRepository>(
      () => _i148.DiaryRepositoryImpl(gh<_i881.DiaryDataSource>()),
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
    gh.factory<_i703.EditTripBloc>(
      () => _i703.EditTripBloc(
        gh<_i637.EditTripUsecase>(),
        gh<_i161.TripRepository>(),
      ),
    );
    gh.lazySingleton<_i255.FriendRequestRepository>(
      () => _i742.FriendRequestRepositoryImpl(
        gh<_i340.FriendRequestDataSource>(),
      ),
    );
    gh.lazySingleton<_i167.ChatRepository>(
      () => _i269.ChatRepositoryImpl(gh<_i888.ChatDataSource>()),
    );
    gh.factory<_i1000.TripDetailBloc>(
      () => _i1000.TripDetailBloc(
        gh<_i277.GetTripByIdUseCase>(),
        gh<_i317.GiveUpTripUseCase>(),
      ),
    );
    gh.lazySingleton<_i1012.SearchRequestNameUsecase>(
      () =>
          _i1012.SearchRequestNameUsecase(gh<_i255.FriendRequestRepository>()),
    );
    gh.lazySingleton<_i181.ChecklistRepository>(
      () => _i418.ChecklistRepositoryImpl(gh<_i877.ChecklistDataSource>()),
    );
    gh.lazySingleton<_i361.CreateScheduleUseCase>(
      () => _i361.CreateScheduleUseCase(gh<_i456.ScheduleRepository>()),
    );
    gh.lazySingleton<_i714.DeleteScheduleUseCase>(
      () => _i714.DeleteScheduleUseCase(gh<_i456.ScheduleRepository>()),
    );
    gh.lazySingleton<_i29.UpdateScheduleUseCase>(
      () => _i29.UpdateScheduleUseCase(gh<_i456.ScheduleRepository>()),
    );
    gh.lazySingleton<_i600.GetAllScheduleUseCase>(
      () => _i600.GetAllScheduleUseCase(gh<_i456.ScheduleRepository>()),
    );
    gh.lazySingleton<_i379.GetCategoryUsecase>(
      () => _i379.GetCategoryUsecase(gh<_i456.ScheduleRepository>()),
    );
    gh.lazySingleton<_i415.GetScheduleMembersUseCase>(
      () => _i415.GetScheduleMembersUseCase(gh<_i456.ScheduleRepository>()),
    );
    gh.lazySingleton<_i324.GetTripMembersUseCase>(
      () => _i324.GetTripMembersUseCase(gh<_i456.ScheduleRepository>()),
    );
    gh.lazySingleton<_i818.GetUserScheduleUseCase>(
      () => _i818.GetUserScheduleUseCase(gh<_i456.ScheduleRepository>()),
    );
    gh.lazySingleton<_i945.CheckNicknameDuplicateUseCase>(
      () => _i945.CheckNicknameDuplicateUseCase(gh<_i565.ProfileRepository>()),
    );
    gh.lazySingleton<_i739.CancelOauthUseCase>(
      () => _i739.CancelOauthUseCase(gh<_i488.AuthRepository>()),
    );
    gh.singleton<_i456.WatchAuthStateUseCase>(
      () => _i456.WatchAuthStateUseCase(gh<_i488.AuthRepository>()),
    );
    gh.lazySingleton<_i91.GetChatUseCase>(
      () => _i91.GetChatUseCase(gh<_i167.ChatRepository>()),
    );
    gh.lazySingleton<_i239.SendChatUseCase>(
      () => _i239.SendChatUseCase(gh<_i167.ChatRepository>()),
    );
    gh.lazySingleton<_i284.SubscribeChatUseCase>(
      () => _i284.SubscribeChatUseCase(gh<_i167.ChatRepository>()),
    );
    gh.lazySingleton<_i359.FriendRepository>(
      () => _i1001.FriendRepositoryImpl(gh<_i297.FriendDataSource>()),
    );
    gh.factory<_i873.CreateTripBloc>(
      () => _i873.CreateTripBloc(
        gh<_i779.CreateTripUsecase>(),
        gh<_i161.TripRepository>(),
      ),
    );
    gh.factory<_i725.CreateScheduleBloc>(
      () => _i725.CreateScheduleBloc(
        gh<_i361.CreateScheduleUseCase>(),
        gh<_i324.GetTripMembersUseCase>(),
      ),
    );
    gh.factory<_i865.ScheduleBloc>(
      () => _i865.ScheduleBloc(
        gh<_i600.GetAllScheduleUseCase>(),
        gh<_i714.DeleteScheduleUseCase>(),
        gh<_i415.GetScheduleMembersUseCase>(),
        gh<_i379.GetCategoryUsecase>(),
        gh<_i277.GetTripByIdUseCase>(),
      ),
    );
    gh.lazySingleton<_i715.DeleteImgUseCase>(
      () => _i715.DeleteImgUseCase(gh<_i565.ProfileRepository>()),
    );
    gh.lazySingleton<_i473.UpdateProfileUseCase>(
      () => _i473.UpdateProfileUseCase(gh<_i565.ProfileRepository>()),
    );
    gh.lazySingleton<_i304.UploadImgUseCase>(
      () => _i304.UploadImgUseCase(gh<_i565.ProfileRepository>()),
    );
    gh.lazySingleton<_i669.AcceptRequestUsecase>(
      () => _i669.AcceptRequestUsecase(gh<_i255.FriendRequestRepository>()),
    );
    gh.lazySingleton<_i611.CreateFriendRequestUsecase>(
      () =>
          _i611.CreateFriendRequestUsecase(gh<_i255.FriendRequestRepository>()),
    );
    gh.lazySingleton<_i491.DeleteRequestUsecase>(
      () => _i491.DeleteRequestUsecase(gh<_i255.FriendRequestRepository>()),
    );
    gh.lazySingleton<_i739.GetFriendRequestUsecase>(
      () => _i739.GetFriendRequestUsecase(gh<_i255.FriendRequestRepository>()),
    );
    gh.lazySingleton<_i639.CreateFriendRelationUsecase>(
      () => _i639.CreateFriendRelationUsecase(gh<_i359.FriendRepository>()),
    );
    gh.lazySingleton<_i285.DeleteFriendUsecase>(
      () => _i285.DeleteFriendUsecase(gh<_i359.FriendRepository>()),
    );
    gh.lazySingleton<_i813.GetFriendRelationUsecase>(
      () => _i813.GetFriendRelationUsecase(gh<_i359.FriendRepository>()),
    );
    gh.lazySingleton<_i806.GetFriendsUsecase>(
      () => _i806.GetFriendsUsecase(gh<_i359.FriendRepository>()),
    );
    gh.lazySingleton<_i622.CreateChecklistUseCase>(
      () => _i622.CreateChecklistUseCase(gh<_i181.ChecklistRepository>()),
    );
    gh.lazySingleton<_i95.DeleteChecklistUseCase>(
      () => _i95.DeleteChecklistUseCase(gh<_i181.ChecklistRepository>()),
    );
    gh.lazySingleton<_i979.GetMyChecklistUseCase>(
      () => _i979.GetMyChecklistUseCase(gh<_i181.ChecklistRepository>()),
    );
    gh.lazySingleton<_i349.ToggleChecklistUseCase>(
      () => _i349.ToggleChecklistUseCase(gh<_i181.ChecklistRepository>()),
    );
    gh.lazySingleton<_i831.AlarmRepository>(
      () => _i915.AlarmRepositoryImpl(gh<_i58.AlarmDataSource>()),
    );
    gh.lazySingleton<_i27.CreateDiaryUseCase>(
      () => _i27.CreateDiaryUseCase(gh<_i871.DiaryRepository>()),
    );
    gh.lazySingleton<_i55.DeleteDiaryImgUseCase>(
      () => _i55.DeleteDiaryImgUseCase(gh<_i871.DiaryRepository>()),
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
    gh.lazySingleton<_i998.UploadDiaryImgUseCase>(
      () => _i998.UploadDiaryImgUseCase(gh<_i871.DiaryRepository>()),
    );
    gh.lazySingleton<_i212.AlarmSettingRepository>(
      () =>
          _i124.AlarmSettingRepositoryImpl(gh<_i1030.AlarmSettingDataSource>()),
    );
    gh.lazySingleton<_i474.AuthBloc>(
      () => _i474.AuthBloc(
        gh<_i420.SocialSignInUseCase>(),
        gh<_i858.SignOutUseCase>(),
        gh<_i739.CancelOauthUseCase>(),
      ),
    );
    gh.lazySingleton<_i1051.CreateTodoListUseCase>(
      () => _i1051.CreateTodoListUseCase(gh<_i579.TodoListRepository>()),
    );
    gh.lazySingleton<_i311.DeleteTodoListUseCase>(
      () => _i311.DeleteTodoListUseCase(gh<_i579.TodoListRepository>()),
    );
    gh.lazySingleton<_i57.ToggleTodoListUseCase>(
      () => _i57.ToggleTodoListUseCase(gh<_i579.TodoListRepository>()),
    );
    gh.factory<_i229.EditScheduleBloc>(
      () => _i229.EditScheduleBloc(
        gh<_i29.UpdateScheduleUseCase>(),
        gh<_i324.GetTripMembersUseCase>(),
        gh<_i415.GetScheduleMembersUseCase>(),
      ),
    );
    gh.singleton<_i387.AuthProfileBloc>(
      () => _i387.AuthProfileBloc(
        gh<_i456.WatchAuthStateUseCase>(),
        gh<_i529.GetCurrentUserUseCase>(),
        gh<_i858.SignOutUseCase>(),
      ),
    );
    gh.lazySingleton<_i823.GetSentRequestUsecase>(
      () => _i823.GetSentRequestUsecase(gh<_i255.FriendRequestRepository>()),
    );
    gh.lazySingleton<_i38.GetReadStatusUseCase>(
      () => _i38.GetReadStatusUseCase(gh<_i167.ChatRepository>()),
    );
    gh.lazySingleton<_i285.GetTripCrewUseCase>(
      () => _i285.GetTripCrewUseCase(gh<_i167.ChatRepository>()),
    );
    gh.lazySingleton<_i562.GetUnreadCountUseCase>(
      () => _i562.GetUnreadCountUseCase(gh<_i167.ChatRepository>()),
    );
    gh.lazySingleton<_i383.UpdateReadStatusUseCase>(
      () => _i383.UpdateReadStatusUseCase(gh<_i167.ChatRepository>()),
    );
    gh.factory<_i557.ProfileBloc>(
      () => _i557.ProfileBloc(
        gh<_i945.CheckNicknameDuplicateUseCase>(),
        gh<_i473.UpdateProfileUseCase>(),
        gh<_i304.UploadImgUseCase>(),
        gh<_i715.DeleteImgUseCase>(),
      ),
    );
    gh.lazySingleton<_i1062.GetRequestProfileUsecase>(
      () =>
          _i1062.GetRequestProfileUsecase(gh<_i255.FriendRequestRepository>()),
    );
    gh.factory<_i130.ListsBloc>(
      () => _i130.ListsBloc(
        gh<_i979.GetMyChecklistUseCase>(),
        gh<_i30.GetMyTodoListUseCase>(),
        gh<_i622.CreateChecklistUseCase>(),
        gh<_i1051.CreateTodoListUseCase>(),
        gh<_i95.DeleteChecklistUseCase>(),
        gh<_i311.DeleteTodoListUseCase>(),
        gh<_i349.ToggleChecklistUseCase>(),
        gh<_i57.ToggleTodoListUseCase>(),
      ),
    );
    gh.factory<_i69.FriendRequestBloc>(
      () => _i69.FriendRequestBloc(
        gh<_i611.CreateFriendRequestUsecase>(),
        gh<_i739.GetFriendRequestUsecase>(),
        gh<_i491.DeleteRequestUsecase>(),
        gh<_i669.AcceptRequestUsecase>(),
        gh<_i1062.GetRequestProfileUsecase>(),
        gh<_i1012.SearchRequestNameUsecase>(),
        gh<_i823.GetSentRequestUsecase>(),
      ),
    );
    gh.lazySingleton<_i151.GetFriendUsersUsecase>(
      () => _i151.GetFriendUsersUsecase(gh<_i359.FriendRepository>()),
    );
    gh.lazySingleton<_i617.SearchNicknameUsecase>(
      () => _i617.SearchNicknameUsecase(gh<_i359.FriendRepository>()),
    );
    gh.factory<_i27.DiaryBloc>(
      () => _i27.DiaryBloc(
        gh<_i849.GetOurDiariesUseCase>(),
        gh<_i730.GetMyDiariesUseCase>(),
        gh<_i699.DeleteDiaryUseCase>(),
      ),
    );
    gh.factory<_i885.NewDiaryBloc>(
      () => _i885.NewDiaryBloc(
        gh<_i27.CreateDiaryUseCase>(),
        gh<_i998.UploadDiaryImgUseCase>(),
        gh<_i818.GetUserScheduleUseCase>(),
      ),
    );
    gh.factory<_i186.FriendBloc>(
      () => _i186.FriendBloc(
        gh<_i806.GetFriendsUsecase>(),
        gh<_i285.DeleteFriendUsecase>(),
        gh<_i151.GetFriendUsersUsecase>(),
        gh<_i617.SearchNicknameUsecase>(),
      ),
    );
    gh.factory<_i935.EditDiaryBloc>(
      () => _i935.EditDiaryBloc(
        gh<_i1039.UpdateDiaryUseCase>(),
        gh<_i998.UploadDiaryImgUseCase>(),
        gh<_i55.DeleteDiaryImgUseCase>(),
      ),
    );
    gh.factory<_i663.ChatBloc>(
      () => _i663.ChatBloc(
        gh<_i91.GetChatUseCase>(),
        gh<_i239.SendChatUseCase>(),
        gh<_i284.SubscribeChatUseCase>(),
        gh<_i38.GetReadStatusUseCase>(),
        gh<_i383.UpdateReadStatusUseCase>(),
        gh<_i285.GetTripCrewUseCase>(),
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
    gh.lazySingleton<_i1067.UnsubscribeAlarmsUseCase>(
      () => _i1067.UnsubscribeAlarmsUseCase(gh<_i831.AlarmRepository>()),
    );
    gh.lazySingleton<_i25.WatchAlarmsUseCase>(
      () => _i25.WatchAlarmsUseCase(gh<_i831.AlarmRepository>()),
    );
    gh.lazySingleton<_i420.GetMyAlarmSettingUseCase>(
      () => _i420.GetMyAlarmSettingUseCase(gh<_i212.AlarmSettingRepository>()),
    );
    gh.lazySingleton<_i87.UpdateAlarmSettingUseCase>(
      () => _i87.UpdateAlarmSettingUseCase(gh<_i212.AlarmSettingRepository>()),
    );
    gh.factory<_i693.AlarmBloc>(
      () => _i693.AlarmBloc(
        gh<_i135.GetAlarmsUseCase>(),
        gh<_i820.GetAlarmByIdUseCase>(),
        gh<_i539.CheckAnAlarmUseCase>(),
        gh<_i889.CheckAlarmsUseCase>(),
        gh<_i25.WatchAlarmsUseCase>(),
        gh<_i1067.UnsubscribeAlarmsUseCase>(),
      ),
    );
    gh.factory<_i695.AlarmSettingBloc>(
      () => _i695.AlarmSettingBloc(
        gh<_i420.GetMyAlarmSettingUseCase>(),
        gh<_i87.UpdateAlarmSettingUseCase>(),
      ),
    );
    return this;
  }
}

class _$ThemeModule extends _i170.ThemeModule {}

class _$RegisterModule extends _i291.RegisterModule {}
