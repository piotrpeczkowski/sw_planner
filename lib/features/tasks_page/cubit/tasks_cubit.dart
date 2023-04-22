import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sw_planner/core/enums.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit()
      : super(
          const TasksState(
            status: Status.initial,
            tasksList: TasksList.current,
            currentIndex: 0,
          ),
        );

  Future<void> setCurrentIndex({
    required int index,
  }) async {
    try {
      if (index == 0) {
        emit(TasksState(
          currentIndex: index,
          tasksList: TasksList.current,
        ));
      } else {
        emit(TasksState(
          currentIndex: index,
          tasksList: TasksList.ended,
        ));
      }
    } on Exception catch (e) {
      emit(TasksState(
        status: Status.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
