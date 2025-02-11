import 'package:equatable/equatable.dart';

class TelaEntity extends Equatable {
  final int id;
  final String denominacion;
  final List<Map<String, dynamic>> aplicacionesTela;
  final List<Map<String, dynamic>> tipoEstructurales;
  final List<Map<String, dynamic>> composiciones;
  final List<Map<String, dynamic>> conservaciones;
  final List<Map<String, dynamic>> estructuraLigamentos;
  final List<Map<String, dynamic>> caracteristicasTecnicas;
  final List<Map<String, dynamic>> caracteristicasVisuales;

  const TelaEntity({
    required this.id,
    required this.denominacion,
    required this.aplicacionesTela,
    required this.tipoEstructurales,
    required this.composiciones,
    required this.conservaciones,
    required this.estructuraLigamentos,
    required this.caracteristicasTecnicas,
    required this.caracteristicasVisuales,
  });

  @override
  List<Object?> get props => [
        id,
        denominacion,
        aplicacionesTela,
        tipoEstructurales,
        composiciones,
        conservaciones,
        estructuraLigamentos,
        caracteristicasTecnicas,
        caracteristicasVisuales,
      ];
}
