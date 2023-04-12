import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:sw_planner/core/enums.dart';
import 'package:sw_planner/data/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository)
      : super(const LoginState(
          status: Status.initial,
        ));

  final AuthRepository _authRepository;

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      await _authRepository.register(email, password);
    } on FirebaseAuthException catch (error) {
      throw FirebaseAuthException(code: error.toString());
    }
  }

  Future<void> createUserProfile() async {
    try {
      await _authRepository.createUserInfo();
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _authRepository.signIn(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    try {
      await _authRepository.resetPassword(
        email: email,
      );
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
