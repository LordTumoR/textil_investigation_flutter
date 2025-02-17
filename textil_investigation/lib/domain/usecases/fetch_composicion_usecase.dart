import 'package:textil_investigation/domain/entities/composicion_entity.dart';
import 'package:textil_investigation/domain/repositories/composicion_repository.dart';

class FetchComposicionUseCase {
  final ComposicionRepository repository;

  FetchComposicionUseCase({required this.repository});

  Future<List<ComposicionEntity>> call() {
    return repository.fetchComposicion();
  }
}
