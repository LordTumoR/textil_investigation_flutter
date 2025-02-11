import 'package:textil_investigation/domain/entities/tela_entity.dart';

abstract class TelasRepository {
  Future<List<TelaEntity>> fetchFilteredTelas(Map<String, dynamic> filters);
}
