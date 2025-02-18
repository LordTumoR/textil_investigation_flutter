import 'package:equatable/equatable.dart';

class ConservacionEntity extends Equatable {
  final int id;
  final String descripcion;

  const ConservacionEntity({required this.id, required this.descripcion});

  @override
  List<Object?> get props => [
        id,
        descripcion,
      ];
}