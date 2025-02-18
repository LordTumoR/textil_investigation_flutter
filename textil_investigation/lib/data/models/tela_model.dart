import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:textil_investigation/domain/entities/tela_entity.dart';

String apiUrl = dotenv.env['direccionApi'] ?? 'localhost';
String apiPort = dotenv.env['puertoApi'] ?? '3000';

class TelaModel extends TelaEntity {
  const TelaModel({
    required super.id,
    required super.name,
    required super.denominacion,
    super.img,
    required super.aplicacionesTela,
    required super.tipoEstructurales,
    required super.composiciones,
    required super.conservaciones,
    required super.estructuraLigamentos,
    required super.caracteristicasTecnicas,
    required super.caracteristicasVisuales,
  });

  factory TelaModel.fromJson(Map<String, dynamic> json) {
    return TelaModel(
      id: json['id_tela'],
      name: json['denominacion'],
      denominacion: json['denominacion'],
      img: json['id_img'] != null
          ? "http://$apiUrl:$apiPort/files/${json['id_img']}"
          : null,
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
