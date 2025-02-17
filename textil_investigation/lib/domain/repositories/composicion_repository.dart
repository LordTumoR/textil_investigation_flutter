import 'package:textil_investigation/domain/entities/composicion_entity.dart';

abstract class ComposicionRepository {
  Future<List<ComposicionEntity>> fetchComposicion();
}
