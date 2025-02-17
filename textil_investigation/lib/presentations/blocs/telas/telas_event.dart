import 'package:equatable/equatable.dart';

abstract class TelasEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// ✅ **Evento para actualizar los filtros**
class UpdateTelasEvent extends TelasEvent {
  final String? name;
  final double? transparency;
  final double? shine;
  final double? touch;
  final double? endurance;
  final double? absorption;
  final double? elasticity;
  final bool? isWaterResistant;
  final bool? isStainResistant;
  final bool? isFireRetardant;
  final bool? isAnadirOrBuscar;

  UpdateTelasEvent({
    this.name,
    this.transparency,
    this.shine,
    this.touch,
    this.endurance,
    this.absorption,
    this.elasticity,
    this.isWaterResistant,
    this.isStainResistant,
    this.isFireRetardant,
    this.isAnadirOrBuscar,
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
        isWaterResistant,
        isStainResistant,
        isFireRetardant,
        isAnadirOrBuscar,
      ];
}

/// ✅ **Evento para hacer la búsqueda de telas filtradas**
class FetchFilteredTelasEvent extends TelasEvent {
  final Map<String, dynamic> filters;

  FetchFilteredTelasEvent({required this.filters});

  @override
  List<Object?> get props => [filters];
}
