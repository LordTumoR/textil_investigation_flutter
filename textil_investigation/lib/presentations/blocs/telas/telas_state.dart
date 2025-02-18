import 'package:equatable/equatable.dart';
import 'package:textil_investigation/domain/entities/tela_entity.dart';

/// ✅ **Estado base del Bloc**
abstract class TelasState extends Equatable {
  const TelasState({this.telas = const []});

  final List<TelaEntity>? telas;

  // existing fields and methods

  @override
  List<Object?> get props => [telas];
}

/// ✅ **Estado inicial del Bloc**
class TelasInitial extends TelasState {}

/// ✅ **Estado cuando se están cargando los datos**
class TelasLoading extends TelasState {}

/// ✅ **Estado que almacena los datos de las telas y los filtros aplicados**
class TelasLoaded extends TelasState {
  final String? name;
  final double? transparency;
  final double? shine;
  final double? touch;
  final double? endurance;
  final double? absorption;
  final double? elasticity;
  final int? composition;
  final int? aplicacion;
  final int? conservacion;
  final int? estructuraLigamento;
  final int? tipoEstructural;
  final List<TelaEntity>? telas;

  const TelasLoaded({
    this.name,
    this.transparency,
    this.shine,
    this.touch,
    this.endurance,
    this.absorption,
    this.elasticity,
    this.composition,
    this.aplicacion,
    this.conservacion,
    this.estructuraLigamento,
    this.tipoEstructural,
    this.telas,
  });

  @override
  List<Object?> get props => [
        name,
        transparency,
        shine,
        touch,
        endurance,
        absorption,
        elasticity,
        composition,
        telas,
        aplicacion,
        conservacion,
        estructuraLigamento,
        tipoEstructural,
      ];
}

/// ✅ **Estado cuando ocurre un error**
class TelasError extends TelasState {
  final String message;

  const TelasError(this.message);

  @override
  List<Object?> get props => [message];
}
