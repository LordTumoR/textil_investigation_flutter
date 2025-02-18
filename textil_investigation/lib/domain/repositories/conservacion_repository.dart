import 'package:textil_investigation/domain/entities/conservacion_entity.dart';

abstract class ConservacionRepository {
  Future<List<ConservacionEntity>> fetchConservacion();
}
