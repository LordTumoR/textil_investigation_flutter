import 'package:equatable/equatable.dart';

abstract class IndexEvent extends Equatable {
  const IndexEvent();

  @override
  List<Object?> get props => [];
}

class UpdateNumberEvent extends IndexEvent {
  final int number;

  const UpdateNumberEvent(this.number);

  @override
  List<Object?> get props => [number];
}
