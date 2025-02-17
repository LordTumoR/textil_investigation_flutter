import 'package:flutter/material.dart';
import 'package:textil_investigation/domain/entities/tela_entity.dart';

class TelaDetailScreen extends StatelessWidget {
  final TelaEntity tela;

  const TelaDetailScreen({super.key, required this.tela});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tela.denominacion),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Denominación: ${tela.denominacion}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Aplicaciones Tela: ${tela.aplicacionesTela.map((e) => e['nombre']).join(', ')}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Tipo Estructurales: ${tela.tipoEstructurales.map((e) => e['nombre']).join(', ')}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Composiciones: ${tela.composiciones.map((e) => e['nombre']).join(', ')}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Conservaciones: ${tela.conservaciones.map((e) => e['nombre']).join(', ')}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Estructura Ligamentos: ${tela.estructuraLigamentos.map((e) => e['nombre']).join(', ')}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            // Text(
            //   'Transparencia: ${transparenciaToString(tela.caracteristicasVisuales)}',
            //   style: const TextStyle(fontSize: 16),
            // ),
            // const SizedBox(height: 10),
            // Text(
            //   'Brillo: ${brilloToString(tela.brillo)}',
            //   style: const TextStyle(fontSize: 16),
            // ),
            // const SizedBox(height: 10),
            // Text(
            //   'Tacto: ${tactoToString(tela.tacto)}',
            //   style: const TextStyle(fontSize: 16),
            // ),
            // const SizedBox(height: 10),
            // Text(
            //   'Resistencia: ${resistenciaToString(tela.resistencia)}',
            //   style: const TextStyle(fontSize: 16),
            // ),
            // const SizedBox(height: 10),
            // Text(
            //   'Absorción: ${absorcionToString(tela.absorcion)}',
            //   style: const TextStyle(fontSize: 16),
            // ),
            // const SizedBox(height: 10),
            // Text(
            //   'Elasticidad: ${elasticidadToString(tela.elasticidad)}',
            //   style: const TextStyle(fontSize: 16),
            // ),
          ],
        ),
      ),
    );
  }

  String transparenciaToString(int transparencia) {
    switch (transparencia) {
      case 1:
        return 'Opaco';
      case 2:
        return 'Poco transparente';
      case 3:
        return 'Transparencia media';
      case 4:
        return 'Transparente';
      case 5:
        return 'Muy transparente';
      default:
        return 'Desconocida';
    }
  }

  String brilloToString(int brillo) {
    switch (brillo) {
      case 1:
        return 'Mate';
      case 2:
        return 'Poco brillante';
      case 3:
        return 'Brillo medio';
      case 4:
        return 'Brillante';
      case 5:
        return 'Muy brillante';
      default:
        return 'Desconocido';
    }
  }

  String tactoToString(int tacto) {
    switch (tacto) {
      case 1:
        return 'Áspero';
      case 2:
        return 'Poco áspero';
      case 3:
        return 'Tacto medio';
      case 4:
        return 'Suave';
      case 5:
        return 'Muy suave';
      default:
        return 'Desconocido';
    }
  }

  String resistenciaToString(int resistencia) {
    switch (resistencia) {
      case 1:
        return 'Muy baja';
      case 2:
        return 'Baja';
      case 3:
        return 'Media';
      case 4:
        return 'Alta';
      case 5:
        return 'Muy alta';
      default:
        return 'Desconocida';
    }
  }
}

String absorcionToString(int absorcion) {
  switch (absorcion) {
    case 1:
      return 'Muy baja';
    case 2:
      return 'Baja';
    case 3:
      return 'Media';
    case 4:
      return 'Alta';
    case 5:
      return 'Muy alta';
    default:
      return 'Desconocida';
  }
}

String elasticidadToString(int elasticidad) {
  switch (elasticidad) {
    case 1:
      return 'Muy baja';
    case 2:
      return 'Baja';
    case 3:
      return 'Media';
    case 4:
      return 'Alta';
    case 5:
      return 'Muy alta';
    default:
      return 'Desconocida';
  }
}
