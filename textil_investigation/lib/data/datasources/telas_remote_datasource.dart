import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:textil_investigation/data/models/tela_model.dart';

abstract class TelasRemoteDataSource {
  Future<List<TelaModel>> fetchFilteredTelas(Map<String, dynamic> filters);
}

class TelasRemoteDataSourceImpl implements TelasRemoteDataSource {
  final http.Client client;
  String apiUrl = dotenv.env['direccion_api'] ?? 'localhost';
  String apiPort = dotenv.env['puerto_api'] ?? '3000';

  TelasRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TelaModel>> fetchFilteredTelas(
      Map<String, dynamic> filters) async {
    final uri = Uri.parse('http://$apiUrl:$apiPort/telas/filter/telas');
    final response = await client.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(filters),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => TelaModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener las telas');
    }
  }
}
