part of 'note_widget_cubit.dart';

@immutable
class NoteWidgetState {
  const NoteWidgetState({
    this.status = Status.initial,
    this.errorMessage = '',
    this.successMessage = '',
    this.isExpanded = false,
  });

  final Status status;
  final String errorMessage;
  final String successMessage;
  final bool isExpanded;
}
