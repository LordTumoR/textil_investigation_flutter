import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/domain/entities/tela_entity.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_bloc.dart';

class TelaDetailScreen extends StatefulWidget {
  final int telaId;

  const TelaDetailScreen({super.key, required this.telaId});

  @override
  State<TelaDetailScreen> createState() => _TelaDetailScreenState();
}

class _TelaDetailScreenState extends State<TelaDetailScreen> {
  late TelaEntity tela;

  @override
  void initState() {
    TelasBloc telaBloc = context.read<TelasBloc>();
    tela = telaBloc.state.telas!
        .firstWhere((element) => element.id == widget.telaId);
    super.initState();
  }

  String capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tela.denominacion),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (tela.img != null)
              Center(child: Image.network(tela.img!))
            else
              const Center(child: Icon(Icons.image_not_supported, size: 100)),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text(
                  'Denominación',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(capitalize(tela.denominacion)),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text(
                  'Aplicaciones Tela',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(tela.aplicacionesTela
                    .map((e) => capitalize(e['tipo_aplicacion']))
                    .join(', ')),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text(
                  'Tipo Estructurales',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(tela.tipoEstructurales
                    .map((e) => capitalize(e['tipo']))
                    .join(', ')),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text(
                  'Composiciones',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(tela.composiciones
                    .map((e) => capitalize(e['descripcion']))
                    .join(', ')),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text(
                  'Conservaciones',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(tela.conservaciones
                    .map((e) => capitalize(e['description']))
                    .join(', ')),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text(
                  'Estructura Ligamentos',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(tela.estructuraLigamentos
                    .map((e) => capitalize(e['descripcion']))
                    .join(', ')),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text(
                  'Transparencia',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(transparenciaToString(
                    tela.caracteristicasVisuales[0]['transparencia'])),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text(
                  'Brillo',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    brilloToString(tela.caracteristicasVisuales[0]['brillo'])),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text(
                  'Tacto',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    tactoToString(tela.caracteristicasVisuales[0]['tacto'])),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text(
                  'Resistencia',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(resistenciaToString(
                    tela.caracteristicasTecnicas[0]['resistencia'])),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text(
                  'Absorción',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(absorcionToString(
                    tela.caracteristicasTecnicas[0]['absorcion'])),
              ),
            ),
            const SizedBox(height: 10),
            Card(
              child: ListTile(
                title: const Text(
                  'Elasticidad',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(elasticidadToString(
                    tela.caracteristicasTecnicas[0]['elasticidad'])),
              ),
            ),
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
