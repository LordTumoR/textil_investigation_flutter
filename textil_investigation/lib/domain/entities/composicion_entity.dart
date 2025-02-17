import 'package:equatable/equatable.dart';

class ComposicionEntity extends Equatable {
  final int id;
  final String descripcion;

  const ComposicionEntity({required this.id, required this.descripcion});

  @override
  List<Object?> get props => [
        id,
        descripcion,
      ];
}
