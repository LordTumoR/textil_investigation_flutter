import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/presentations/blocs/other/other_event.dart';
import 'package:textil_investigation/presentations/blocs/other/other_state.dart';

class OtherCharacteristicsBloc
    extends Bloc<OtherCharacteristicsEvent, OtherCharacteristicsState> {
  OtherCharacteristicsBloc() : super(OtherCharacteristicsInitial()) {
    on<UpdateOtherCharacteristicsEvent>(_updateOnCaracteristicas);
  }

  Future<void> _updateOnCaracteristicas(UpdateOtherCharacteristicsEvent event,
      Emitter<OtherCharacteristicsState> emit) async {
    emit(OtherCharacteristicsLoading());
    try {
      emit(OtherCharacteristicsUpdated(
        isWaterResistant: event.isWaterResistant,
        isStainResistant: event.isStainResistant,
        isFireRetardant: event.isFireRetardant,
      ));
      emit(OtherCharacteristicsLoaded(
        isWaterResistant: event.isWaterResistant,
        isStainResistant: event.isStainResistant,
        isFireRetardant: event.isFireRetardant,
      ));
    } catch (error) {
      emit(
          const OtherCharacteristicsError('Failed to update characteristics.'));
    }
  }
}
