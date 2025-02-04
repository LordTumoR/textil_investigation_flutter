import 'package:equatable/equatable.dart';

abstract class TactileEvent extends Equatable {
  const TactileEvent();

  @override
  List<Object> get props => [];
}

class UpdateTactileValues extends TactileEvent {
  final double endurance;
  final double absorption;
  final double elasticity;

  const UpdateTactileValues({
    required this.endurance,
    required this.absorption,
    required this.elasticity,
  });

  @override
  List<Object> get props => [endurance, absorption, elasticity];
}
