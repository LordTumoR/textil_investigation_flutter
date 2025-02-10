import 'package:equatable/equatable.dart';

abstract class TelasEvent extends Equatable {
  const TelasEvent();

  @override
  List<Object?> get props => [];
}

class UpdateTelasEvent extends TelasEvent {
  final double? transparency;
  final double? shine;
  final double? endurance;
  final double? absorption;
  final double? elasticity;
  final bool? isWaterResistant;
  final bool? isStainResistant;
  final bool? isFireRetardant;

  const UpdateTelasEvent({
    this.transparency,
    this.shine,
    this.endurance,
    this.absorption,
    this.elasticity,
    this.isWaterResistant,
    this.isStainResistant,
    this.isFireRetardant,
  });

  @override
  List<Object?> get props => [
        transparency,
        shine,
        endurance,
        absorption,
        elasticity,
        isWaterResistant,
        isStainResistant,
        isFireRetardant,
      ];
}
