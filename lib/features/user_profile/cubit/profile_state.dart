part of 'profile_cubit.dart';

@immutable
class ProfileState {
  const ProfileState({
    this.userModel,
    required this.status,
    this.errorMessage = '',
  });

  final UserModel? userModel;
  final Status status;
  final String errorMessage;
}
