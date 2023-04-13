import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sw_planner/core/enums.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit()
      : super(
          const TasksState(),
        );
}
