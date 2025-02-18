import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:textil_investigation/data/models/conservacion_model.dart';

abstract class ConservacionRemoteDataSource {
  Future<List<ConservacionModel>> fetchConservacion();
}

class ConservacionRemoteDataSourceImpl implements ConservacionRemoteDataSource {
  final http.Client client;
  String apiUrl = dotenv.env['direccionApi'] ?? 'localhost';
  String apiPort = dotenv.env['puertoApi'] ?? '3000';

  ConservacionRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ConservacionModel>> fetchConservacion() async {
    final uri = Uri.parse('http://$apiUrl:$apiPort/conservaciones');
    final response = await client.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => ConservacionModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener las Conservacion');
    }
  }
}