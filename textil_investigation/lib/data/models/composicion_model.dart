import 'package:textil_investigation/domain/entities/composicion_entity.dart';

class ComposicionModel extends ComposicionEntity {
  const ComposicionModel({
    required super.id,
    required super.descripcion,
  });

  factory ComposicionModel.fromJson(Map<String, dynamic> json) {
    return ComposicionModel(
      id: json['id'] ?? 0,
      descripcion: json['descripcion'] ?? '',
    );
  }
}
