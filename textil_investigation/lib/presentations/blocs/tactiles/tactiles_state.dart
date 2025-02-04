import 'package:equatable/equatable.dart';

abstract class TactileState extends Equatable {
  final double endurance;
  final double absorption;
  final double elasticity;

  const TactileState({
    required this.endurance,
    required this.absorption,
    required this.elasticity,
  });

  @override
  List<Object> get props => [endurance, absorption, elasticity];
}

class TactileInitial extends TactileState {
  const TactileInitial() : super(endurance: 1, absorption: 1, elasticity: 1);
}

class TactileUpdated extends TactileState {
  const TactileUpdated({
    required super.endurance,
    required super.absorption,
    required super.elasticity,
  });
}
