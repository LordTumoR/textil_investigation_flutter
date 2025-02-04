import 'package:equatable/equatable.dart';

abstract class VisualEvent extends Equatable {
  const VisualEvent();

  @override
  List<Object?> get props => [];
}

class UpdateNumberEvent extends VisualEvent {
  final double transparency;
  final double shine;

  const UpdateNumberEvent(this.transparency, this.shine);

  @override
  List<Object?> get props => [transparency, shine];
}
