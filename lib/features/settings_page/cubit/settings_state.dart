part of 'settings_cubit.dart';

@immutable
class SettingsState {
  const SettingsState({
    required this.status,
    this.errorMessage = '',
  });

  final Status status;
  final String errorMessage;
}
