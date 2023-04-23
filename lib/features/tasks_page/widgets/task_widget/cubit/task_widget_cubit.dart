import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
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
        ));
      } else {
        emit(const TaskWidgetState(
          status: Status.success,
          isExpanded: true,
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
