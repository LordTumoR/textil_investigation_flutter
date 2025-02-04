import 'package:equatable/equatable.dart';

// Estado base de OtherCharacteristics
abstract class OtherCharacteristicsState extends Equatable {
  const OtherCharacteristicsState();

  @override
  List<Object?> get props => [];
}

class OtherCharacteristicsInitial extends OtherCharacteristicsState {}

class OtherCharacteristicsLoading extends OtherCharacteristicsState {}

class OtherCharacteristicsUpdated extends OtherCharacteristicsState {
  final bool isWaterResistant;
  final bool isStainResistant;
  final bool isFireRetardant;

  const OtherCharacteristicsUpdated({
    required this.isWaterResistant,
    required this.isStainResistant,
    required this.isFireRetardant,
  });

  @override
  List<Object?> get props =>
      [isWaterResistant, isStainResistant, isFireRetardant];
}

class OtherCharacteristicsLoaded extends OtherCharacteristicsState {
  final bool? isWaterResistant;
  final bool? isStainResistant;
  final bool? isFireRetardant;

  const OtherCharacteristicsLoaded({
    this.isWaterResistant,
    this.isStainResistant,
    this.isFireRetardant,
  });

  @override
  List<Object?> get props =>
      [isWaterResistant, isStainResistant, isFireRetardant];
}

class OtherCharacteristicsError extends OtherCharacteristicsState {
  final String message;

  const OtherCharacteristicsError(this.message);

  @override
  List<Object?> get props => [message];
}
