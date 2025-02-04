import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/presentations/blocs/tactiles/tactiles_event.dart';
import 'package:textil_investigation/presentations/blocs/tactiles/tactiles_state.dart';

class TactileBloc extends Bloc<TactileEvent, TactileState> {
  TactileBloc() : super(const TactileInitial()) {
    on<UpdateTactileValues>((event, emit) async {
      // Aquí podrías llamar a un caso de uso para procesar los valores antes de actualizar el estado
      // final result = await updateTactileValuesUseCase(event.endurance, event.absorption, event.elasticity);

      emit(TactileUpdated(
        endurance: event.endurance,
        absorption: event.absorption,
        elasticity: event.elasticity,
      ));
    });
  }
}
