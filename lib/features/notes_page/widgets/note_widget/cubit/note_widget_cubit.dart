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
          titleMaxLines: 1,
          descriptionMaxLines: 3,
        ));
      } else {
        emit(const NoteWidgetState(
          status: Status.success,
          isExpanded: true,
          titleMaxLines: 3,
          descriptionMaxLines: 15,
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
