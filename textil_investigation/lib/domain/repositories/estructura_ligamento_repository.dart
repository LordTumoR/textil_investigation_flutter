import 'package:textil_investigation/domain/entities/estructura_ligamento_entity.dart';

abstract class EstructuraLigamentoRepository {
  Future<List<EstructuraLigamentoEntity>> fetchEstructuraLigamento();
}