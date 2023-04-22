part of 'login_cubit.dart';

@immutable
class LoginState {
  const LoginState({
    this.status = Status.initial,
    this.errorMessage = '',
    this.successMessage = '',
    this.isCreatingAccount = false,
    this.domainVerificationMessage = '',
    this.passwordVerificationMessage = '',
    this.passwordConfirmationMessage = '',
  });

  final Status status;
  final String errorMessage;
  final String successMessage;
  final bool isCreatingAccount;
  final String domainVerificationMessage;
  final String passwordVerificationMessage;
  final String passwordConfirmationMessage;
}
