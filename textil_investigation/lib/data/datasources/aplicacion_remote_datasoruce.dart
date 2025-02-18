import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:textil_investigation/data/models/aplicacion_model.dart';

abstract class AplicacionRemoteDataSource {
  Future<List<AplicacionModel>> fetchAplicacion();
}

class AplicacionRemoteDataSourceImpl implements AplicacionRemoteDataSource {
  final http.Client client;
  String apiUrl = dotenv.env['direccionApi'] ?? 'localhost';
  String apiPort = dotenv.env['puertoApi'] ?? '3000';

  AplicacionRemoteDataSourceImpl({required this.client});

  @override
  Future<List<AplicacionModel>> fetchAplicacion() async {
    final uri = Uri.parse('http://$apiUrl:$apiPort/aplicaciones');
    final response = await client.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => AplicacionModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener las Aplicacion');
    }
  }
}