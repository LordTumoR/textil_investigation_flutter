import 'package:equatable/equatable.dart';

abstract class VisualState extends Equatable {
  const VisualState();

  @override
  List<Object?> get props => [];
}

class VisualInitial extends VisualState {}

class VisualLoading extends VisualState {}

class VisualLoaded extends VisualState {
  final double transparency;
  final double shine;

  const VisualLoaded(this.transparency, this.shine);

  @override
  List<Object?> get props => [transparency, shine];
}

class VisualError extends VisualState {
  final String message;

  const VisualError(this.message);

  @override
  List<Object?> get props => [message];
}
