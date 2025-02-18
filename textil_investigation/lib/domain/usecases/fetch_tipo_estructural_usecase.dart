import 'package:textil_investigation/domain/entities/tipo_estructural_entity.dart';
import 'package:textil_investigation/domain/repositories/tipo_estructural_repository.dart';

class FetchTipoEstructuralUseCase {
  final TipoEstructuralRepository repository;

  FetchTipoEstructuralUseCase({required this.repository});

  Future<List<TipoEstructuralEntity>> call() {
    return repository.fetchTipoEstructural();
  }
}