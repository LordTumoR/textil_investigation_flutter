import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:textil_investigation/data/models/tipo_estructural_model.dart';

abstract class TipoEstructuralRemoteDataSource {
  Future<List<TipoEstructuralModel>> fetchTipoEstructural();
}

class TipoEstructuralRemoteDataSourceImpl implements TipoEstructuralRemoteDataSource {
  final http.Client client;
  String apiUrl = dotenv.env['direccionApi'] ?? 'localhost';
  String apiPort = dotenv.env['puertoApi'] ?? '3000';

  TipoEstructuralRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TipoEstructuralModel>> fetchTipoEstructural() async {
    final uri = Uri.parse('http://$apiUrl:$apiPort/tipos_estructurales');
    final response = await client.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => TipoEstructuralModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener los Tipo Estructural');
    }
  }
}