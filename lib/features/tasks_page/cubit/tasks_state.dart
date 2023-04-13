part of 'tasks_cubit.dart';

@immutable
class TasksState {
  const TasksState({
    this.status = Status.initial,
    this.errorMessage = '',
  });

  final Status status;
  final String errorMessage;
}
