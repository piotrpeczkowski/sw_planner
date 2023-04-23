import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sw_planner/core/enums.dart';

part 'note_widget_state.dart';

class NoteWidgetCubit extends Cubit<NoteWidgetState> {
  NoteWidgetCubit()
      : super(
          const NoteWidgetState(
            status: Status.initial,
          ),
        );

  Future<void> changeContainerExpansion({
    required bool isNoteContainerExpanded,
  }) async {
    try {
      if (isNoteContainerExpanded) {
        emit(const NoteWidgetState(
          status: Status.success,
          isExpanded: false,
        ));
      } else {
        emit(const NoteWidgetState(
          status: Status.success,
          isExpanded: true,
        ));
      }
    } on Exception catch (e) {
      emit(NoteWidgetState(
        status: Status.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
