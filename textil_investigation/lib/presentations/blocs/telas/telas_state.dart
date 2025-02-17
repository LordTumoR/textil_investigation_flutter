import 'package:equatable/equatable.dart';
import 'package:textil_investigation/domain/entities/tela_entity.dart';

/// ✅ **Estado base del Bloc**
abstract class TelasState extends Equatable {
  const TelasState();

  @override
  List<Object?> get props => [];
}

/// ✅ **Estado inicial del Bloc**
class TelasInitial extends TelasState {}

/// ✅ **Estado cuando se están cargando los datos**
class TelasLoading extends TelasState {}

/// ✅ **Estado que almacena los datos de las telas y los filtros aplicados**
class TelasLoaded extends TelasState {
  final double? transparency;
  final double? shine;
  final double? endurance;
  final double? absorption;
  final double? elasticity;
  final int? composition;
  final List<TelaEntity>? telas;

  const TelasLoaded({
    this.transparency,
    this.shine,
    this.endurance,
    this.absorption,
    this.elasticity,
    this.composition,
    this.telas,
  });

  @override
  List<Object?> get props => [
        transparency,
        shine,
        endurance,
        absorption,
        elasticity,
        composition,
        telas,
      ];
}

/// ✅ **Estado cuando ocurre un error**
class TelasError extends TelasState {
  final String message;

  const TelasError(this.message);

  @override
  List<Object?> get props => [message];
}
