import 'package:textil_investigation/domain/entities/aplicacion_entity.dart';
import 'package:textil_investigation/domain/repositories/aplicacion_repository.dart';

class FetchAplicacionUseCase {
  final AplicacionRepository repository;

  FetchAplicacionUseCase({required this.repository});

  Future<List<AplicacionEntity>> call() {
    return repository.fetchAplicacion();
  }
}
