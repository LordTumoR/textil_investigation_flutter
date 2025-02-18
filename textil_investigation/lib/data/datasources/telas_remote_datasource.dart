import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:textil_investigation/data/models/tela_model.dart';

abstract class TelasRemoteDataSource {
  Future<List<TelaModel>> fetchFilteredTelas(Map<String, dynamic> filters);
}

class TelasRemoteDataSourceImpl implements TelasRemoteDataSource {
  final http.Client client;
  String apiUrl = dotenv.env['direccionApi'] ?? 'localhost';
  String apiPort = dotenv.env['puertoApi'] ?? '3000';

  TelasRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TelaModel>> fetchFilteredTelas(
      Map<String, dynamic> filters) async {
    final uri = Uri.parse('http://$apiUrl:$apiPort/telas/filter/telas');

    // Construimos el objeto de filtros aquí
    final Map<String, dynamic> filterParams = {
      "denominacion": filters['name'],
      "ids_aplicaciones": filters['aplicacion'] != null ? [filters['aplicacion']] : null,
      "ids_tipo_estructural": filters['tipoEstructural'] != null ? [filters['tipoEstructural']] : null,
      "ids_composicion": filters['composition'] != null ? [filters['composition']] : null,
      "ids_conservacion": filters['conservacion'] != null ? [filters['conservacion']] : null,
      "ids_estructura_ligamento": filters['estructuraLigamento'] != null ? [filters['estructuraLigamento']] : null,
      "cac_tecnicas": (filters['transparency'] == null &&
              filters['brightness'] == null &&
              filters['touch'] == null)
          ? null
          : [filters['transparency'], filters['brightness'], filters['touch']],
      "cac_visuales": (filters['endurance'] == null &&
              filters['absorption'] == null &&
              filters['elasticity'] == null)
          ? null
          : [
              filters['endurance'],
              filters['absorption'],
              filters['elasticity']
            ],
    };
    final response = await client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(filterParams),
    );

    if (response.statusCode == 201) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => TelaModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener las telas');
    }
  }
}
