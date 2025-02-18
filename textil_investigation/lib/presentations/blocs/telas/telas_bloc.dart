import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/domain/usecases/fetch_filtered_telas_usecase.dart';

import 'telas_event.dart';
import 'telas_state.dart';

class TelasBloc extends Bloc<TelasEvent, TelasState> {
  final FetchFilteredTelasUseCase fetchFilteredTelasUseCase;

  TelasBloc({required this.fetchFilteredTelasUseCase})
      : super(const TelasLoaded(telas: [])) {
    on<UpdateTelasEvent>(_onUpdateTelas);
  }

  Future<void> _onUpdateTelas(
      UpdateTelasEvent event, Emitter<TelasState> emit) async {
    if (state is TelasLoaded) {
      final currentState = state as TelasLoaded;

      emit(
        TelasLoaded(
          name: event.name ?? currentState.name,
          transparency: event.transparency ?? currentState.transparency,
          shine: event.shine ?? currentState.shine,
          touch: event.touch ?? currentState.touch,
          endurance: event.endurance ?? currentState.endurance,
          absorption: event.absorption ?? currentState.absorption,
          elasticity: event.elasticity ?? currentState.elasticity,
          composition: event.composition ?? currentState.composition,
          telas: currentState.telas,
          aplicacion: event.aplicacion ?? currentState.aplicacion,
          conservacion: event.conservacion ?? currentState.conservacion,
          estructuraLigamento: event.estructuraLigamento ?? currentState.estructuraLigamento,
          tipoEstructural: event.tipoEstructural ?? currentState.tipoEstructural,
        ),
      );

      final filters = {
        'name': event.name ?? currentState.name,
        'transparency': event.transparency ?? currentState.transparency,
        'brightness': event.shine ?? currentState.shine,
        'touch': event.touch ?? currentState.touch,
        'endurance': event.endurance ?? currentState.endurance,
        'absorption': event.absorption ?? currentState.absorption,
        'elasticity': event.elasticity ?? currentState.elasticity,
        'composition': event.composition ?? currentState.composition,
        'aplicacion': event.aplicacion ?? currentState.aplicacion,
        'conservacion': event.conservacion ?? currentState.conservacion,
        'estructuraLigamento': event.estructuraLigamento ?? currentState.estructuraLigamento,
        'tipoEstructural': event.tipoEstructural ?? currentState.tipoEstructural,
      };

      if (event.isAnadirOrBuscar == true) {
        final telas = await fetchFilteredTelasUseCase(filters);
        emit(
          TelasLoaded(
            name: currentState.name,
            transparency: currentState.transparency,
            shine: currentState.shine,
            touch: currentState.touch,
            endurance: currentState.endurance,
            absorption: currentState.absorption,
            elasticity: currentState.elasticity,
            composition: currentState.composition,
            aplicacion: currentState.aplicacion,
            conservacion: currentState.conservacion,
            estructuraLigamento: currentState.estructuraLigamento,
            tipoEstructural: currentState.tipoEstructural,
            telas: telas, 
          ),
        );
      }
    }
  }
}
