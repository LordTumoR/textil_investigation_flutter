import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/domain/entities/tela_entity.dart';
import 'package:textil_investigation/domain/usecases/fetch_filtered_telas_usecase.dart';
import 'telas_event.dart';
import 'telas_state.dart';

class TelasBloc extends Bloc<TelasEvent, TelasState> {
  final FetchFilteredTelasUseCase fetchFilteredTelasUseCase;

  TelasBloc({required this.fetchFilteredTelasUseCase}) : super(const TelasLoaded()) {
    on<UpdateTelasEvent>(_onUpdateTelas);
    on<FetchFilteredTelasEvent>(_onFetchFilteredTelas);
  }

  /// ✅ **Actualiza los valores de los filtros sin afectar otros valores**
  Future<void> _onUpdateTelas(UpdateTelasEvent event, Emitter<TelasState> emit) async {
    if (state is TelasLoaded) {
      final currentState = state as TelasLoaded;

      emit(
        TelasLoaded(
          transparency: event.transparency ?? currentState.transparency,
          shine: event.shine ?? currentState.shine,
          endurance: event.endurance ?? currentState.endurance,
          absorption: event.absorption ?? currentState.absorption,
          elasticity: event.elasticity ?? currentState.elasticity,
          isWaterResistant: event.isWaterResistant ?? currentState.isWaterResistant,
          isStainResistant: event.isStainResistant ?? currentState.isStainResistant,
          isFireRetardant: event.isFireRetardant ?? currentState.isFireRetardant,
          telas: currentState.telas, // Mantiene las telas obtenidas anteriormente
        ),
      );
    }
  }

  /// ✅ **Hace la petición para obtener telas filtradas y actualiza el estado**
  Future<void> _onFetchFilteredTelas(
      FetchFilteredTelasEvent event, Emitter<TelasState> emit) async {
    emit(TelasLoading());
    try {
      final telas = await fetchFilteredTelasUseCase(event.filters);
      if (state is TelasLoaded) {
        final currentState = state as TelasLoaded;
        emit(
          TelasLoaded(
            transparency: currentState.transparency,
            shine: currentState.shine,
            endurance: currentState.endurance,
            absorption: currentState.absorption,
            elasticity: currentState.elasticity,
            isWaterResistant: currentState.isWaterResistant,
            isStainResistant: currentState.isStainResistant,
            isFireRetardant: currentState.isFireRetardant,
            telas: telas, // Guarda las telas obtenidas en el estado
          ),
        );
      } else {
        emit(TelasLoaded(telas: telas));
      }
    } catch (e) {
      emit(TelasError('Error al obtener telas'));
    }
  }
}
