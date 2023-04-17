import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:sw_planner/core/enums.dart';
import 'package:sw_planner/data/repositories/user_repository.dart';
import 'package:sw_planner/domain/models/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._userRepository)
      : super(
          ProfileState(
            userModel: UserModel(
              userEmail: '',
              userName: '',
              userAvatarUrl: '',
              lastProfileUpdate: DateTime.now(),
              isFirstLogin: false,
            ),
            status: Status.initial,
          ),
        );

  final UserRepository _userRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      ProfileState(
        userModel: UserModel(
          userEmail: '',
          userName: '',
          userAvatarUrl: '',
          lastProfileUpdate: DateTime.now(),
          isFirstLogin: false,
        ),
        status: Status.loading,
      ),
    );

    _streamSubscription = _userRepository.userProfileStream().listen(
      (userModel) {
        emit(
          ProfileState(
            userModel: userModel,
            status: Status.success,
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            ProfileState(
              userModel: UserModel(
                userEmail: '',
                userName: '',
                userAvatarUrl: '',
                lastProfileUpdate: DateTime.now(),
                isFirstLogin: false,
              ),
              status: Status.error,
              errorMessage: error.toString(),
            ),
          );
        },
      );
  }

  Future<void> updateUserProfile({
    required String userName,
    required DateTime updateDate,
  }) async {
    try {
      await _userRepository.updateUserProfile(
        userName: userName,
        updateDate: updateDate,
      );
    } catch (error) {
      emit(ProfileState(
        userModel: UserModel(
          userEmail: '',
          userName: '',
          userAvatarUrl: '',
          lastProfileUpdate: DateTime.now(),
          isFirstLogin: false,
        ),
        status: Status.error,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> updatePassword({
    required String password,
  }) async {
    try {
      await _userRepository.updatePassword(
        password: password,
      );
    } catch (error) {
      emit(ProfileState(
        userModel: UserModel(
          userEmail: '',
          userName: '',
          userAvatarUrl: '',
          lastProfileUpdate: DateTime.now(),
          isFirstLogin: false,
        ),
        status: Status.error,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> pickAndUploadAvatar({
    required String avatarUrl,
    required ImageSource source,
  }) async {
    try {
      await _userRepository.pickAndUploadImage(
        avatarUrl: avatarUrl,
        source: source,
      );
    } catch (error) {
      emit(ProfileState(
        userModel: UserModel(
          userEmail: '',
          userName: '',
          userAvatarUrl: '',
          lastProfileUpdate: DateTime.now(),
          isFirstLogin: false,
        ),
        status: Status.error,
        errorMessage: error.toString(),
      ));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
