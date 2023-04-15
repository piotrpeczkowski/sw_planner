import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sw_planner/core/enums.dart';
import 'package:sw_planner/data/repositories/user_repository.dart';
import 'package:sw_planner/domain/models/user_model.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit(this._userRepository)
      : super(
          DrawerState(
            userModel: UserModel(
                userEmail: '',
                userName: '',
                userAvatarUrl: '',
                lastProfileUpdate: DateTime.now(),
                isFirstLogin: false),
            status: Status.initial,
          ),
        );

  final UserRepository _userRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      DrawerState(
        userModel: UserModel(
            userEmail: '',
            userName: '',
            userAvatarUrl: '',
            lastProfileUpdate: DateTime.now(),
            isFirstLogin: false),
        status: Status.loading,
      ),
    );

    _streamSubscription =
        _userRepository.userProfileStream().listen((userModel) {
      emit(
        DrawerState(
          userModel: userModel,
          status: Status.success,
        ),
      );
    })
          ..onError((error) {
            emit(
              DrawerState(
                userModel: UserModel(
                    userEmail: '',
                    userName: '',
                    userAvatarUrl: '',
                    lastProfileUpdate: DateTime.now(),
                    isFirstLogin: false),
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
