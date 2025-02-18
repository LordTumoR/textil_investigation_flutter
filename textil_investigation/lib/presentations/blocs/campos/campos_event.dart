import 'package:equatable/equatable.dart';
import 'package:textil_investigation/domain/entities/aplicacion_entity.dart';
import 'package:textil_investigation/domain/entities/composicion_entity.dart';
import 'package:textil_investigation/domain/entities/conservacion_entity.dart';
import 'package:textil_investigation/domain/entities/estructura_ligamento_entity.dart';
import 'package:textil_investigation/domain/entities/tipo_estructural_entity.dart';

abstract class CamposEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// ✅ **Evento para actualizar los filtros**
class UpdateCamposEvent extends CamposEvent {
  final AplicacionEntity? aplicaciones;
  final ComposicionEntity? composiciones;
  final ConservacionEntity? conservaciones;
  final EstructuraLigamentoEntity? estructurasLigamentos;
  final TipoEstructuralEntity? tipoEstructurales;


  UpdateCamposEvent(
      {this.aplicaciones,
      this.composiciones,
       this.conservaciones,
       this.estructurasLigamentos,
         this.tipoEstructurales,
       });

  @override
  List<Object?> get props => [
        aplicaciones,
        composiciones,
        conservaciones,
        estructurasLigamentos,
        tipoEstructurales,
      ];
}

/// ✅ **Evento para hacer la búsqueda de composiciones filtradas**
class FetchFilteredCamposEvent extends CamposEvent {
  final Map<String, dynamic> filters;

  FetchFilteredCamposEvent({required this.filters});

  @override
  List<Object?> get props => [filters];
}

/// Evento para obtener todos los campos
class FetchAllCamposEvent extends CamposEvent {}