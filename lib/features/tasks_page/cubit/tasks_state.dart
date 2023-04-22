part of 'tasks_cubit.dart';

@immutable
class TasksState {
  const TasksState({
    this.status = Status.initial,
    this.tasksList = TasksList.current,
    this.errorMessage = '',
    this.currentIndex = 0,
  });

  final Status status;
  final TasksList tasksList;
  final String errorMessage;
  final int currentIndex;
}
