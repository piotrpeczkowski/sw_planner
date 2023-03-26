import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sw_planner/data/repositories/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepository)
      : super(const LoginState(
          email: '',
          password: '',
        ));

  final AuthRepository _authRepository;

  Future<void> register(
      {required String email, required String password}) async {
    await _authRepository.register(email, password);
  }

  Future<void> signIn({required String email, required String password}) async {
    await _authRepository.signIn(email, password);
  }

  Future<void> resetPassword({required String email}) async {
    try {
      await _authRepository.resetPassword(email);
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}