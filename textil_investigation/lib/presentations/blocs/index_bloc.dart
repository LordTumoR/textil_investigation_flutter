import 'package:flutter_bloc/flutter_bloc.dart';
import 'index_event.dart';
import 'index-state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  IndexBloc() : super(IndexInitial()) {
    on<UpdateNumberEvent>(_onUpdateNumber);
  }

  Future<void> _onUpdateNumber(
      UpdateNumberEvent event, Emitter<IndexState> emit) async {
    emit(IndexLoading());
    emit(IndexLoaded(event.number));
  }
}
