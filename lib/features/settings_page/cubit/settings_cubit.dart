import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sw_planner/core/enums.dart';
import 'package:sw_planner/data/repositories/user_repository.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._userRepository)
      : super(
          const SettingsState(
            status: Status.initial,
          ),
        );

  final UserRepository _userRepository;

  Future<void> updatePassword({
    required String password,
  }) async {
    try {
      await _userRepository.updatePassword(password: password);
      emit(
        const SettingsState(status: Status.success),
      );
    } catch (error) {
      emit(
        SettingsState(
          status: Status.error,
          errorMessage: '$error',
        ),
      );
    }
  }
}
