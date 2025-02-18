import 'package:textil_investigation/domain/entities/estructura_ligamento_entity.dart';

class EstructuraLigamentoModel extends EstructuraLigamentoEntity {
  const EstructuraLigamentoModel({
    required super.id,
    required super.descripcion,
  });

  factory EstructuraLigamentoModel.fromJson(Map<String, dynamic> json) {
    return EstructuraLigamentoModel(
      id: json['id'] ?? 0,
      descripcion: json['descripcion'] ?? '',
    );
  }
}