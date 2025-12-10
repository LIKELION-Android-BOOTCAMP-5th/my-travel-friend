// [이재은] 프로필 설정 bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_travel_friend/feature/setting/presentation/viewmodels/profile_event.dart';
import 'package:my_travel_friend/feature/setting/presentation/viewmodels/profile_state.dart';

import '../../../../core/result/result.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../domain/usecases/update_profile_usecase.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;
  final UpdateProfileUseCase _updateProfileUseCase;

  ProfileBloc(this._profileRepository, this._updateProfileUseCase)
    : super(const ProfileState()) {
    on<LoadProfile>(_onLoadProfile);
    on<SelectImg>(_onSelectImg);
    on<RemoveImg>(_onRemoveImg);
    on<ChangeNickname>(_onChangeNickname);
    on<UpdateProfile>(_onUpdateProfile);
  }

  // 프로필 불러오기
  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    final profile = event.profile;

    emit(
      state.copyWith(
        originalProfile: profile,
        nickname: profile.nickname ?? '',
        imgUrl: profile.profileImg,
        localImgFile: null,
        isImgRemoved: false,
        pageState: ProfilePageState.loaded,
      ),
    );
  }

  // 이미지 선택
  Future<void> _onSelectImg(SelectImg event, Emitter<ProfileState> emit) async {
    emit(
      state.copyWith(
        localImgFile: event.file,
        isImgRemoved: false, // 새 이미지 선택하면 삭제 플래그 해제
      ),
    );
  }

  // 이미지 제거
  Future<void> _onRemoveImg(RemoveImg event, Emitter<ProfileState> emit) async {
    emit(
      state.copyWith(
        localImgFile: null,
        isImgRemoved: true, // 삭제 플래그 설정
      ),
    );
  }

  // 닉네임 변경
  Future<void> _onChangeNickname(
    ChangeNickname event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(nickname: event.nickname));
  }

  // 프로필 저장
  Future<void> _onUpdateProfile(
    UpdateProfile event,
    Emitter<ProfileState> emit,
  ) async {
    if (!state.canSave) return;

    emit(state.copyWith(pageState: ProfilePageState.saving));

    try {
      String? uploadedImgUrl;
      final userId = state.originalProfile!.id!;
      final originalImgUrl = state.originalProfile?.profileImg;

      // 기존 이미지 삭제 필요한 경우
      if (state.isImgRemoved && originalImgUrl != null) {
        await _profileRepository.deleteImg(originalImgUrl);
      }

      // 새 이미지 업로드
      if (state.localImgFile != null) {
        // 기존 이미지가 있으면 먼저 삭제
        if (originalImgUrl != null && !state.isImgRemoved) {
          await _profileRepository.deleteImg(originalImgUrl);
        }

        emit(state.copyWith(isUploading: true));

        final uploadResult = await _profileRepository.uploadImg(
          file: state.localImgFile!,
          id: userId,
        );

        uploadResult.when(
          success: (url) => uploadedImgUrl = url,
          failure: (failure) => throw Exception(failure.message),
        );

        emit(state.copyWith(isUploading: false));
      }

      // 프로필 업데이트
      final updatedEntity = state.toEntity(uploadedImgUrl: uploadedImgUrl);
      final result = await _updateProfileUseCase.call(updatedEntity);

      result.when(
        success: (profile) {
          emit(
            state.copyWith(
              pageState: ProfilePageState.success,
              originalProfile: profile,
              imgUrl: profile.profileImg,
              localImgFile: null,
              isImgRemoved: false,
              message: '프로필이 수정되었습니다',
            ),
          );
        },
        failure: (failure) {
          emit(
            state.copyWith(
              pageState: ProfilePageState.error,
              message: failure.message,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          pageState: ProfilePageState.error,
          isUploading: false,
          message: e.toString(),
        ),
      );
    }
  }
}
