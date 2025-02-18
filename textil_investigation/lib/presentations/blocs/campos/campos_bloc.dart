import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/domain/entities/composicion_entity.dart';
import 'package:textil_investigation/domain/entities/conservacion_entity.dart';
import 'package:textil_investigation/domain/entities/estructura_ligamento_entity.dart';
import 'package:textil_investigation/domain/entities/tipo_estructural_entity.dart';
import 'package:textil_investigation/domain/usecases/fetch_aplicacion_usecase.dart';
import 'package:textil_investigation/domain/usecases/fetch_composicion_usecase.dart';
import 'package:textil_investigation/domain/usecases/fetch_conservacion_usecase.dart';
import 'package:textil_investigation/domain/usecases/fetch_estructura_ligamento_usecase.dart';
import 'package:textil_investigation/domain/usecases/fetch_tipo_estructural_usecase.dart';

import '../../../domain/entities/aplicacion_entity.dart';
import 'campos_event.dart';
import 'campos_state.dart';

class CamposBloc extends Bloc<CamposEvent, CamposState> {
  final FetchComposicionUseCase fetchComposicionUseCase;
  final FetchAplicacionUseCase fetchAplicacionUseCase;
  final FetchConservacionUseCase fetchConservacionUseCase;
  final FetchTipoEstructuralUseCase fetchTipoEstructuralUseCase;
  final FetchEstructuraLigamentoUseCase fetchEstructuraLigamentoUseCase;

  CamposBloc({
    required this.fetchComposicionUseCase,
    required this.fetchAplicacionUseCase,
    required this.fetchConservacionUseCase,
    required this.fetchTipoEstructuralUseCase,
    required this.fetchEstructuraLigamentoUseCase,
  }) : super(CamposInitial()) {
    on<FetchAllCamposEvent>(_onFetchAllCampos);
  }

  Future<void> _onFetchAllCampos(
      CamposEvent event, Emitter<CamposState> emit) async {
    emit(CamposLoading());
    try {
      final composicionesFuture = fetchComposicionUseCase();
      final aplicacionesFuture = fetchAplicacionUseCase();
      final conservacionesFuture = fetchConservacionUseCase();
      final tiposEstructuralesFuture = fetchTipoEstructuralUseCase();
      final estructurasLigamentoFuture = fetchEstructuraLigamentoUseCase();

      final results = await Future.wait([
        composicionesFuture,
        aplicacionesFuture,
        conservacionesFuture,
        tiposEstructuralesFuture,
        estructurasLigamentoFuture,
      ]);

      final composiciones = results[0] as List<ComposicionEntity>;
      final aplicaciones = results[1] as List<AplicacionEntity>;
      final conservaciones = results[2] as List<ConservacionEntity>;
      final tiposEstructurales = results[3] as List<TipoEstructuralEntity>;
      final estructurasLigamento =
          results[4] as List<EstructuraLigamentoEntity>;

      emit(AllCamposLoaded(
        composiciones: composiciones,
        aplicaciones: aplicaciones,
        conservaciones: conservaciones,
        tiposEstructurales: tiposEstructurales,
        estructurasLigamento: estructurasLigamento,
      ));
    } catch (e) {
      emit(const ComposicionError('Error al obtener todos los campos'));
    }
  }
}
