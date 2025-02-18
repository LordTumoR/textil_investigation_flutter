import 'package:textil_investigation/domain/entities/estructura_ligamento_entity.dart';
import 'package:textil_investigation/domain/repositories/estructura_ligamento_repository.dart';

class FetchEstructuraLigamentoUseCase {
  final EstructuraLigamentoRepository repository;

  FetchEstructuraLigamentoUseCase({required this.repository});

  Future<List<EstructuraLigamentoEntity>> call() {
    return repository.fetchEstructuraLigamento();
  }
}
