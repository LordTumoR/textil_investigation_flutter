import 'package:textil_investigation/domain/entities/tela_entity.dart';
import 'package:textil_investigation/domain/repositories/telas_repository.dart';

class FetchFilteredTelasUseCase {
  final TelasRepository repository;

  FetchFilteredTelasUseCase({required this.repository});

  Future<List<TelaEntity>> call(Map<String, dynamic> filters) {
    return repository.fetchFilteredTelas(filters);
  }
}
