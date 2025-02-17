import 'package:equatable/equatable.dart';

abstract class TelasEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// ✅ **Evento para actualizar los filtros**
class UpdateTelasEvent extends TelasEvent {
  final double? transparency;
  final double? shine;
  final double? endurance;
  final double? absorption;
  final double? elasticity;
  final int? composition;

  UpdateTelasEvent({
    this.transparency,
    this.shine,
    this.endurance,
    this.absorption,
    this.elasticity,
    this.composition,
  });

  @override
  List<Object?> get props => [
        transparency,
        shine,
        endurance,
        absorption,
        elasticity,
        composition,
      ];
}

/// ✅ **Evento para hacer la búsqueda de telas filtradas**
class FetchFilteredTelasEvent extends TelasEvent {
  final Map<String, dynamic> filters;

  FetchFilteredTelasEvent({required this.filters});

  @override
  List<Object?> get props => [filters];
}
