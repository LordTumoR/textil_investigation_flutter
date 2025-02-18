import 'package:equatable/equatable.dart';
import 'package:textil_investigation/domain/entities/composicion_entity.dart';
import 'package:textil_investigation/domain/entities/aplicacion_entity.dart';
import 'package:textil_investigation/domain/entities/conservacion_entity.dart';
import 'package:textil_investigation/domain/entities/tipo_estructural_entity.dart';
import 'package:textil_investigation/domain/entities/estructura_ligamento_entity.dart';

/// ✅ **Estado base del Bloc**
abstract class CamposState extends Equatable {
  const CamposState();

  @override
  List<Object?> get props => [];
}

/// ✅ **Estado inicial del Bloc**
class CamposInitial extends CamposState {}

/// ✅ **Estado cuando se están cargando los datos**
class CamposLoading extends CamposState {}

/// ✅ **Estado que almacena todos los datos de los campos**
class AllCamposLoaded extends CamposState {
  final List<ComposicionEntity> composiciones;
  final List<AplicacionEntity> aplicaciones;
  final List<ConservacionEntity> conservaciones;
  final List<TipoEstructuralEntity> tiposEstructurales;
  final List<EstructuraLigamentoEntity> estructurasLigamento;

  const AllCamposLoaded({
    required this.composiciones,
    required this.aplicaciones,
    required this.conservaciones,
    required this.tiposEstructurales,
    required this.estructurasLigamento,
  });

  @override
  List<Object?> get props => [
        composiciones,
        aplicaciones,
        conservaciones,
        tiposEstructurales,
        estructurasLigamento,
      ];
}

/// ✅ **Estado cuando ocurre un error**
class ComposicionError extends CamposState {
  final String message;

  const ComposicionError(this.message);

  @override
  List<Object?> get props => [message];
}
