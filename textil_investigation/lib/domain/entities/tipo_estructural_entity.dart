import 'package:equatable/equatable.dart';

class TipoEstructuralEntity extends Equatable {
  final int id;
  final String descripcion;

  const TipoEstructuralEntity({required this.id, required this.descripcion});

  @override
  List<Object?> get props => [
        id,
        descripcion,
      ];
}