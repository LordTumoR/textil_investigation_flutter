import 'package:textil_investigation/domain/entities/aplicacion_entity.dart';

abstract class AplicacionRepository {
  Future<List<AplicacionEntity>> fetchAplicacion();
}