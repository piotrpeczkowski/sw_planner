part of 'note_widget_cubit.dart';

@immutable
class NoteWidgetState {
  const NoteWidgetState({
    this.status = Status.initial,
    this.errorMessage = '',
    this.successMessage = '',
    this.isExpanded = false,
    this.titleMaxLines = 1,
    this.descriptionMaxLines = 3,
  });

  final Status status;
  final String errorMessage;
  final String successMessage;
  final bool isExpanded;
  final int titleMaxLines;
  final int descriptionMaxLines;
}
