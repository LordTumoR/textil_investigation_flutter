import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/presentations/blocs/visual/visual_event.dart';
import 'package:textil_investigation/presentations/blocs/visual/visual_state.dart';

class VisualBloc extends Bloc<VisualEvent, VisualState> {
  VisualBloc() : super(VisualInitial()) {
    on<UpdateNumberEvent>(_onUpdateNumber);
  }

  Future<void> _onUpdateNumber(
    UpdateNumberEvent event, Emitter<VisualState> emit) async {
      emit(VisualLoading());
      emit(VisualLoaded(event.transparency, event.shine));
  }
}
