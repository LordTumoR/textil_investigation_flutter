import 'package:equatable/equatable.dart';

abstract class IndexState extends Equatable {
  const IndexState();

  @override
  List<Object?> get props => [];
}

class IndexInitial extends IndexState {}

class IndexLoading extends IndexState {}

class IndexLoaded extends IndexState {
  final int number;

  const IndexLoaded(this.number);

  @override
  List<Object?> get props => [number];
}

class IndexError extends IndexState {
  final String message;

  const IndexError(this.message);

  @override
  List<Object?> get props => [message];
}
