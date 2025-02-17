import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:textil_investigation/data/models/estructura_ligamento_model.dart';

abstract class EstructrucaLigamentoRemoteDataSource {
  Future<List<EstructuraLigamentoModel>> fetchEstructrucaLigamento();
}

class EstructrucaLigamentoRemoteDataSourceImpl implements EstructrucaLigamentoRemoteDataSource {
  final http.Client client;
  String apiUrl = dotenv.env['direccionApi'] ?? 'localhost';
  String apiPort = dotenv.env['puertoApi'] ?? '3000';

  EstructrucaLigamentoRemoteDataSourceImpl({required this.client});

  @override
  Future<List<EstructuraLigamentoModel>> fetchEstructrucaLigamento() async {
    final uri = Uri.parse('http://$apiUrl:$apiPort/estructuras_ligamentos');
    final response = await client.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => EstructuraLigamentoModel.fromJson(json)).toList();
    } else {
      throw Exception('Error al obtener las Estructruca Ligamento');
    }
  }
}