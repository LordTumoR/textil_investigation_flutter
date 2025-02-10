import 'package:equatable/equatable.dart';

class TelasState extends Equatable {
  final double transparency;
  final double shine;
  final double endurance;
  final double absorption;
  final double elasticity;
  final bool isWaterResistant;
  final bool isStainResistant;
  final bool isFireRetardant;

  const TelasState({
    this.transparency = 1.0,
    this.shine = 1.0, 
    this.endurance = 1.0,
    this.absorption = 1.0,
    this.elasticity = 1.0,
    this.isWaterResistant = false,
    this.isStainResistant = false,
    this.isFireRetardant = false,
  });

  @override
  List<Object> get props => [
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
