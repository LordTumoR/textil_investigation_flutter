import 'package:textil_investigation/data/datasources/composicion_remote_datasource.dart';
import 'package:textil_investigation/domain/entities/composicion_entity.dart';
import 'package:textil_investigation/domain/repositories/composicion_repository.dart';

class ComposicionRepositoryImpl implements ComposicionRepository {
  final ComposicionRemoteDataSource remoteDataSource;

  ComposicionRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ComposicionEntity>> fetchComposicion() async {
    try {
      final composicionModels = await remoteDataSource.fetchComposicion();
      return composicionModels.toList();
    } catch (e) {
      throw Exception('Error al cargar composiciones');
    }
  }
}
