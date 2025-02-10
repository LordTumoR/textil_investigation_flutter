import 'package:flutter_bloc/flutter_bloc.dart';
import 'telas_event.dart';
import 'telas_state.dart';

class TelasBloc extends Bloc<TelasEvent, TelasState> {
  TelasBloc() : super(const TelasState()) {
    on<UpdateTelasEvent>(onUpdateTelas);
  }

  Future<void> onUpdateTelas(
      UpdateTelasEvent event, Emitter<TelasState> emit) async {
    emit(
      TelasState(
        transparency: event.transparency ?? state.transparency,
        shine: event.shine ?? state.shine,
        endurance: event.endurance ?? state.endurance,
        absorption: event.absorption ?? state.absorption,
        elasticity: event.elasticity ?? state.elasticity,
        isWaterResistant: event.isWaterResistant ?? state.isWaterResistant,
        isStainResistant: event.isStainResistant ?? state.isStainResistant,
        isFireRetardant: event.isFireRetardant ?? state.isFireRetardant,
      ),
    );
  }
}
