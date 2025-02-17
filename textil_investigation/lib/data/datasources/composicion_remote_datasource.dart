import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:textil_investigation/data/models/composicion_model.dart';

abstract class ComposicionRemoteDataSource {
  Future<List<ComposicionModel>> fetchComposicion();
}

class ComposicionRemoteDataSourceImpl implements ComposicionRemoteDataSource {
  final http.Client client;
  String apiUrl = dotenv.env['direccion_api'] ?? 'localhost';
  String apiPort = dotenv.env['puerto_api'] ?? '3000';

  ComposicionRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ComposicionModel>> fetchComposicion() async {
    final uri = Uri.parse('http://$apiUrl:$apiPort/composicion');
    final response = await client.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => ComposicionModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener las Composicion');
    }
  }
}
