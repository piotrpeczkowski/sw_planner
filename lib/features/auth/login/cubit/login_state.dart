part of 'login_cubit.dart';

@immutable
class LoginState {
  const LoginState({
    required this.status,
    this.errorMessage = '',
  });

  final Status status;
  final String errorMessage;
}
