part of 'task_widget_cubit.dart';

@immutable
class TaskWidgetState {
  const TaskWidgetState({
    this.status = Status.initial,
    this.errorMessage = '',
    this.successMessage = '',
    this.isExpanded = false,
    this.titleMaxLines = 1,
    this.descriptionMaxLines = 3,
    this.detailsContainerColor = Colors.white,
  });

  final Status status;
  final String errorMessage;
  final String successMessage;
  final bool isExpanded;
  final int titleMaxLines;
  final int descriptionMaxLines;
  final Color detailsContainerColor;
}
