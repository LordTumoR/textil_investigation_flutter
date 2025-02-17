import 'package:textil_investigation/data/datasources/conservacion_remote_datasource.dart';
import 'package:textil_investigation/domain/entities/conservacion_entity.dart';
import 'package:textil_investigation/domain/repositories/conservacion_repository.dart';

class ConservacionRepositoryImpl implements ConservacionRepository {
  final ConservacionRemoteDataSource remoteDataSource;

  ConservacionRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<ConservacionEntity>> fetchConservacion() async {
    try {
      final conservacionModels = await remoteDataSource.fetchConservacion();
      return conservacionModels.toList();
    } catch (e) {
      throw Exception('Error al cargar conservaciones');
    }
  }
}