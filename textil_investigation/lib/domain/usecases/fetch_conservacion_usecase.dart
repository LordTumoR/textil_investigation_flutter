import 'package:textil_investigation/domain/entities/conservacion_entity.dart';
import 'package:textil_investigation/domain/repositories/conservacion_repository.dart';

class FetchConservacionUseCase {
  final ConservacionRepository repository;

  FetchConservacionUseCase({required this.repository});

  Future<List<ConservacionEntity>> call() {
    return repository.fetchConservacion();
  }
}
