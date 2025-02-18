import 'package:textil_investigation/domain/entities/tipo_estructural_entity.dart';

abstract class TipoEstructuralRepository {
  Future<List<TipoEstructuralEntity>> fetchTipoEstructural();
}