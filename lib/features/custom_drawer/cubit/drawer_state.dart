part of 'drawer_cubit.dart';

@immutable
class DrawerState {
  const DrawerState({
    required this.userModel,
    required this.status,
    this.errorMessage = '',
  });

  final UserModel userModel;
  final Status status;
  final String errorMessage;
}
