import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sw_planner/core/enums.dart';

part 'task_widget_state.dart';

class TaskWidgetCubit extends Cubit<TaskWidgetState> {
  TaskWidgetCubit()
      : super(
          const TaskWidgetState(
            status: Status.initial,
          ),
        );

  Future<void> changeContainerExpansion({
    required bool isTaskContainerExpanded,
  }) async {
    try {
      if (isTaskContainerExpanded) {
        emit(const TaskWidgetState(
          status: Status.success,
          isExpanded: false,
          titleMaxLines: 1,
          descriptionMaxLines: 3,
          detailsContainerColor: Colors.white,
        ));
      } else {
        emit(const TaskWidgetState(
          status: Status.success,
          isExpanded: true,
          titleMaxLines: 3,
          descriptionMaxLines: 15,
          detailsContainerColor: Color.fromARGB(255, 220, 239, 255),
        ));
      }
    } on Exception catch (e) {
      emit(TaskWidgetState(
        status: Status.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
