import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/domain/usecases/fetch_composicion_usecase.dart';

import 'composicion_event.dart';
import 'composicion_state.dart';

class ComposicionBloc extends Bloc<ComposicionEvent, ComposicionState> {
  final FetchComposicionUseCase fetchComposicionUseCase;

  ComposicionBloc({required this.fetchComposicionUseCase})
      : super(ComposicionInitial()) {
    on<FetchComposicionEvent>(_onFetchComposiciones);
  }

  /// ✅ **Hace la petición para obtener composiciones y actualiza el estado**
  Future<void> _onFetchComposiciones(
      FetchComposicionEvent event, Emitter<ComposicionState> emit) async {
    emit(ComposicionLoading());
    try {
      final composiciones =
          await fetchComposicionUseCase(); // Llamada a la función
      emit(ComposicionLoaded(composiciones));
    } catch (e) {
      emit(ComposicionError('Error al obtener composiciones'));
    }
  }
}
