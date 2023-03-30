import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sw_planner/core/enums.dart';
import 'package:sw_planner/data/repositories/user_repository.dart';
import 'package:sw_planner/domain/models/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._userRepository)
      : super(
          const ProfileState(
            userModel: null,
            status: Status.initial,
            errorMessage: '',
          ),
        );

  final UserRepository _userRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const ProfileState(
        userModel: null,
        status: Status.loading,
        errorMessage: '',
      ),
    );

    _streamSubscription =
        _userRepository.userProfileStream().listen((userModel) {
      emit(
        ProfileState(
          userModel: userModel,
          status: Status.success,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            emit(
              ProfileState(
                userModel: null,
                status: Status.error,
                errorMessage: error.toString(),
              ),
            );
          });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
