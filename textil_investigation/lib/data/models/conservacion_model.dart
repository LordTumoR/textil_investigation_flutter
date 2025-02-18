import 'package:textil_investigation/domain/entities/conservacion_entity.dart';

class ConservacionModel extends ConservacionEntity {
  const ConservacionModel({
    required super.id,
    required super.descripcion,
  });

  factory ConservacionModel.fromJson(Map<String, dynamic> json) {
    return ConservacionModel(
      id: json['id'] ?? 0,
      descripcion: json["description"] ?? '',
    );
  }
}
