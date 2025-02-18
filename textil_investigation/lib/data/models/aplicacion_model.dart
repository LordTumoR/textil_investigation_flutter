import 'package:textil_investigation/domain/entities/aplicacion_entity.dart';

class AplicacionModel extends AplicacionEntity {
  const AplicacionModel({
    required super.id,
    required super.descripcion,
  });

  factory AplicacionModel.fromJson(Map<String, dynamic> json) {
    return AplicacionModel(
      id: json['id_aplicaciones'],
      descripcion: json['tipo_aplicacion'],
    );
  }
}