abstract class OtherCharacteristicsEvent {}

class UpdateOtherCharacteristicsEvent extends OtherCharacteristicsEvent {
  final bool isWaterResistant;
  final bool isStainResistant;
  final bool isFireRetardant;

  UpdateOtherCharacteristicsEvent({
    required this.isWaterResistant,
    required this.isStainResistant,
    required this.isFireRetardant,
  });
}
