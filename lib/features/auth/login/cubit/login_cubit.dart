import 'package:bloc/bloc.dart';
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

  Future<void> start() async {
    emit(
      const LoginState(
        status: Status.loading,
        errorMessage: '',
      ),
    );
  }

  Future<void> switchToRegistration() async {
    emit(const LoginState(
      isCreatingAccount: true,
    ));
  }

  Future<void> switchToLogging() async {
    emit(const LoginState(
      isCreatingAccount: false,
    ));
  }

  Future<void> logging({
    required String email,
    required String password,
  }) async {
    if (email.contains('@sw.gov.pl')) {
      if (password.isNotEmpty) {
        if (password.length >= 8) {
          signIn(
            email: email,
            password: password,
          );
          emit(const LoginState(
            isCreatingAccount: false,
            domainVerificationMessage: '',
            passwordVerificationMessage: '',
            passwordConfirmationMessage: '',
            status: Status.initial,
          ));
        } else {
          emit(const LoginState(
            isCreatingAccount: false,
            passwordVerificationMessage: 'Hasło musi zawierać min. 8 znaków',
            status: Status.error,
            errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
          ));
          emit(const LoginState(
            isCreatingAccount: false,
            passwordVerificationMessage: 'Hasło musi zawierać min. 8 znaków',
            status: Status.initial,
          ));
        }
      } else {
        emit(const LoginState(
          isCreatingAccount: false,
          passwordVerificationMessage: 'Wprowadź hasło',
          status: Status.error,
          errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
        ));
        emit(const LoginState(
          isCreatingAccount: false,
          passwordVerificationMessage: 'Wprowadź hasło',
          status: Status.initial,
        ));
      }
    } else if (email.isEmpty) {
      if (password.isNotEmpty) {
        if (password.length >= 8) {
          emit(const LoginState(
            isCreatingAccount: false,
            domainVerificationMessage: 'Wprowadź adres email',
            status: Status.error,
            errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
          ));
          emit(const LoginState(
            isCreatingAccount: false,
            domainVerificationMessage: 'Wprowadź adres email',
            status: Status.initial,
          ));
        } else {
          emit(const LoginState(
            isCreatingAccount: false,
            domainVerificationMessage: 'Wprowadź adres email',
            passwordVerificationMessage: 'Hasło musi zawierać min. 8 znaków',
            status: Status.error,
            errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
          ));
          emit(const LoginState(
            isCreatingAccount: false,
            domainVerificationMessage: 'Wprowadź adres email',
            passwordVerificationMessage: 'Hasło musi zawierać min. 8 znaków',
            status: Status.initial,
          ));
        }
      } else {
        emit(const LoginState(
          isCreatingAccount: false,
          domainVerificationMessage: 'Wprowadź adres email',
          passwordVerificationMessage: 'Wprowadź hasło',
          status: Status.error,
          errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
        ));
        emit(const LoginState(
          isCreatingAccount: false,
          domainVerificationMessage: 'Wprowadź adres email',
          passwordVerificationMessage: 'Wprowadź hasło',
          status: Status.initial,
        ));
      }
    } else {
      if (password.isNotEmpty) {
        if (password.length >= 8) {
          emit(const LoginState(
            isCreatingAccount: false,
            domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
            status: Status.error,
            errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
          ));
          emit(const LoginState(
            isCreatingAccount: false,
            domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
            status: Status.initial,
          ));
        } else {
          emit(const LoginState(
            isCreatingAccount: false,
            domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
            passwordVerificationMessage: 'Hasło musi zawierać min. 8 znaków',
            status: Status.error,
            errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
          ));
          emit(const LoginState(
            isCreatingAccount: false,
            domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
            passwordVerificationMessage: 'Hasło musi zawierać min. 8 znaków',
            status: Status.initial,
          ));
        }
      } else {
        emit(const LoginState(
          isCreatingAccount: false,
          domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
          passwordVerificationMessage: 'Wprowadź hasło',
          status: Status.error,
          errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
        ));
        emit(const LoginState(
          isCreatingAccount: false,
          domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
          passwordVerificationMessage: 'Wprowadź hasło',
          status: Status.initial,
        ));
      }
    }
  }

  Future<void> registration({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (email.contains('@sw.gov.pl')) {
      if (password.isNotEmpty) {
        if (password.length >= 8) {
          if (confirmPassword == password) {
            register(
              email: email,
              password: password,
            );
            createUserProfile();
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: '',
              passwordVerificationMessage: '',
              passwordConfirmationMessage: '',
              status: Status.initial,
            ));
          } else {
            emit(const LoginState(
              isCreatingAccount: true,
              passwordConfirmationMessage: 'Hasła się nie zgadzają',
              status: Status.error,
              errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
            ));
            emit(const LoginState(
              isCreatingAccount: true,
              passwordConfirmationMessage: 'Hasła się nie zgadzają',
              status: Status.initial,
            ));
          }
        } else {
          if (confirmPassword == password) {
            emit(const LoginState(
              isCreatingAccount: true,
              passwordVerificationMessage: 'Hasło musi zawierać min. 8 znaków',
              status: Status.error,
              errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
            ));
            emit(const LoginState(
              isCreatingAccount: true,
              passwordVerificationMessage: 'Hasło musi zawierać min. 8 znaków',
              status: Status.initial,
            ));
          } else {
            emit(const LoginState(
              isCreatingAccount: true,
              passwordVerificationMessage: 'Hasło musi zawierać min. 8 znaków',
              passwordConfirmationMessage: 'Hasła się nie zgadzają',
              status: Status.error,
              errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
            ));
            emit(const LoginState(
              isCreatingAccount: true,
              passwordVerificationMessage: 'Hasło musi zawierać min. 8 znaków',
              passwordConfirmationMessage: 'Hasła się nie zgadzają',
              status: Status.initial,
            ));
          }
        }
      } else {
        if (confirmPassword == password) {
          emit(const LoginState(
            isCreatingAccount: true,
            passwordVerificationMessage: 'Wprowadź hasło',
            passwordConfirmationMessage: 'Potwierdź hasło',
            status: Status.error,
            errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
          ));
          emit(const LoginState(
            isCreatingAccount: true,
            passwordVerificationMessage: 'Wprowadź hasło',
            passwordConfirmationMessage: 'Potwierdź hasło',
            status: Status.initial,
          ));
        } else {
          emit(const LoginState(
            isCreatingAccount: true,
            passwordVerificationMessage: 'Wprowadź hasło',
            passwordConfirmationMessage: 'Hasła się nie zgadzają',
            status: Status.error,
            errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
          ));
          emit(const LoginState(
            isCreatingAccount: true,
            passwordVerificationMessage: 'Wprowadź hasło',
            passwordConfirmationMessage: 'Hasła się nie zgadzają',
            status: Status.initial,
          ));
        }
      }
    } else if (email.isEmpty) {
      if (password.isNotEmpty) {
        if (password.length >= 8) {
          if (confirmPassword == password) {
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: 'Wprowadź adres email',
              status: Status.error,
              errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
            ));
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: 'Wprowadź adres email',
              status: Status.initial,
            ));
          } else {
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: 'Wprowadź adres email',
              passwordConfirmationMessage: 'Hasła się nie zgadzają',
              status: Status.error,
              errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
            ));
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: 'Wprowadź adres email',
              passwordConfirmationMessage: 'Hasła się nie zgadzają',
              status: Status.initial,
            ));
          }
        } else {
          if (confirmPassword == password) {
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: 'Wprowadź adres email',
              status: Status.error,
              errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
            ));
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: 'Wprowadź adres email',
              status: Status.initial,
            ));
          } else {
            emit(const LoginState(
              isCreatingAccount: false,
              domainVerificationMessage: 'Wprowadź adres email',
              passwordConfirmationMessage: 'Hasła się nie zgadzają',
              status: Status.error,
              errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
            ));
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: 'Wprowadź adres email',
              passwordConfirmationMessage: 'Hasła się nie zgadzają',
              status: Status.initial,
            ));
          }
        }
      } else {
        if (confirmPassword == password) {
          emit(const LoginState(
            isCreatingAccount: true,
            domainVerificationMessage: 'Wprowadź adres email',
            passwordVerificationMessage: 'Wprowadź hasło',
            passwordConfirmationMessage: 'Potwierdź hasło',
            status: Status.error,
            errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
          ));
          emit(const LoginState(
            isCreatingAccount: true,
            domainVerificationMessage: 'Wprowadź adres email',
            passwordVerificationMessage: 'Wprowadź hasło',
            passwordConfirmationMessage: 'Potwierdź hasło',
            status: Status.initial,
          ));
        } else {
          emit(const LoginState(
            isCreatingAccount: true,
            domainVerificationMessage: 'Wprowadź adres email',
            passwordVerificationMessage: 'Wprowadź hasło',
            passwordConfirmationMessage: 'Hasła się nie zgadzają',
            status: Status.error,
            errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
          ));
          emit(const LoginState(
            isCreatingAccount: true,
            domainVerificationMessage: 'Wprowadź adres email',
            passwordVerificationMessage: 'Wprowadź hasło',
            passwordConfirmationMessage: 'Hasła się nie zgadzają',
            status: Status.initial,
          ));
        }
      }
    } else {
      if (password.isNotEmpty) {
        if (password.length >= 8) {
          if (confirmPassword == password) {
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
              status: Status.error,
              errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
            ));
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
              status: Status.initial,
            ));
          } else {
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
              passwordConfirmationMessage: 'Hasła się nie zgadzają',
              status: Status.error,
              errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
            ));
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
              passwordConfirmationMessage: 'Hasła się nie zgadzają',
              status: Status.initial,
            ));
          }
        } else {
          if (confirmPassword == password) {
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
              passwordVerificationMessage: 'Hasło musi zawierać min. 8 znaków',
              status: Status.error,
              errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
            ));
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
              passwordVerificationMessage: 'Hasło musi zawierać min. 8 znaków',
              status: Status.initial,
            ));
          } else {
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
              passwordVerificationMessage: 'Hasło musi zawierać min. 8 znaków',
              passwordConfirmationMessage: 'Hasła się nie zgadzają',
              status: Status.error,
              errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
            ));
            emit(const LoginState(
              isCreatingAccount: true,
              domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
              passwordVerificationMessage: 'Hasło musi zawierać min. 8 znaków',
              passwordConfirmationMessage: 'Hasła się nie zgadzają',
              status: Status.initial,
            ));
          }
        }
      } else {
        if (confirmPassword == password) {
          emit(const LoginState(
            isCreatingAccount: true,
            domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
            passwordVerificationMessage: 'Wprowadź hasło',
            passwordConfirmationMessage: 'Potwierdź hasło',
            status: Status.error,
            errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
          ));
          emit(const LoginState(
            isCreatingAccount: true,
            domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
            passwordVerificationMessage: 'Wprowadź hasło',
            passwordConfirmationMessage: 'Potwierdź hasło',
            status: Status.initial,
          ));
        } else {
          emit(const LoginState(
            isCreatingAccount: true,
            domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
            passwordVerificationMessage: 'Wprowadź hasło',
            passwordConfirmationMessage: 'Hasła się nie zgadzają',
            status: Status.error,
            errorMessage: 'Wprowadzone dane są niekompletne lub niepoprawne',
          ));
          emit(const LoginState(
            isCreatingAccount: true,
            domainVerificationMessage: 'Domena @sw.gov.pl jest wymagana',
            passwordVerificationMessage: 'Wprowadź hasło',
            passwordConfirmationMessage: 'Hasła się nie zgadzają',
            status: Status.initial,
          ));
        }
      }
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
    } catch (e) {
      emit(LoginState(
        status: Status.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      await _authRepository.register(email, password);
    } catch (e) {
      emit(LoginState(
        status: Status.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> createUserProfile() async {
    try {
      await _authRepository.createUserInfo();
    } catch (e) {
      emit(LoginState(
        status: Status.error,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> resetPassword({
    required String email,
  }) async {
    try {
      await _authRepository.resetPassword(
        email: email,
      );
    } catch (e) {
      emit(LoginState(
        status: Status.error,
        errorMessage: e.toString(),
      ));
      start();
    }
  }

  Future<void> signOut() async {
    try {
      await _authRepository.signOut();
    } catch (e) {
      emit(LoginState(
        status: Status.error,
        errorMessage: e.toString(),
      ));
      start();
    }
  }
}
