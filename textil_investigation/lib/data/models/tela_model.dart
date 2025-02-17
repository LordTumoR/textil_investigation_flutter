import 'package:textil_investigation/domain/entities/tela_entity.dart';

class TelaModel extends TelaEntity {
  const TelaModel({
    required int id,
    required String name,
    required String denominacion,
    required List<Map<String, dynamic>> aplicacionesTela,
    required List<Map<String, dynamic>> tipoEstructurales,
    required List<Map<String, dynamic>> composiciones,
    required List<Map<String, dynamic>> conservaciones,
    required List<Map<String, dynamic>> estructuraLigamentos,
    required List<Map<String, dynamic>> caracteristicasTecnicas,
    required List<Map<String, dynamic>> caracteristicasVisuales,
  }) : super(
          id: id,
          name: name,
          denominacion: denominacion,
          aplicacionesTela: aplicacionesTela,
          tipoEstructurales: tipoEstructurales,
          composiciones: composiciones,
          conservaciones: conservaciones,
          estructuraLigamentos: estructuraLigamentos,
          caracteristicasTecnicas: caracteristicasTecnicas,
          caracteristicasVisuales: caracteristicasVisuales,
        );

  factory TelaModel.fromJson(Map<String, dynamic> json) {
    return TelaModel(
      id: json['id_tela'],
      name: json['denominacion'],
      denominacion: json['denominacion'],
      aplicacionesTela:
          List<Map<String, dynamic>>.from(json['aplicaciones_tela']),
      tipoEstructurales:
          List<Map<String, dynamic>>.from(json['tipo_estructurales']),
      composiciones: List<Map<String, dynamic>>.from(json['composiciones']),
      conservaciones: List<Map<String, dynamic>>.from(json['conservaciones']),
      estructuraLigamentos:
          List<Map<String, dynamic>>.from(json['estructura_ligamentos']),
      caracteristicasTecnicas:
          List<Map<String, dynamic>>.from(json['caracteristicas_tecnicas']),
      caracteristicasVisuales:
          List<Map<String, dynamic>>.from(json['caracteristicas_visuales']),
    );
  }
}
