import 'package:equatable/equatable.dart';

class EstructuraLigamentoEntity extends Equatable {
  final int id;
  final String descripcion;

  const EstructuraLigamentoEntity({required this.id, required this.descripcion});

  @override
  List<Object?> get props => [
        id,
        descripcion,
      ];
}