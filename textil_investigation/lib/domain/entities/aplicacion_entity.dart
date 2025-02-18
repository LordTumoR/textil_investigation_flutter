import 'package:equatable/equatable.dart';

class AplicacionEntity extends Equatable {
  final int id;
  final String descripcion;

  const AplicacionEntity({required this.id, required this.descripcion});

  @override
  List<Object?> get props => [
        id,
        descripcion,
      ];
}