import 'package:textil_investigation/domain/entities/tipo_estructural_entity.dart';

class TipoEstructuralModel extends TipoEstructuralEntity {
  const TipoEstructuralModel({
    required super.id,
    required super.descripcion,
  });

  factory TipoEstructuralModel.fromJson(Map<String, dynamic> json) {
    return TipoEstructuralModel(
      id: json['id_tipo_estructural'],
      descripcion: json['tipo'],
    );
  }
}
