import 'package:textil_investigation/domain/entities/aplicacion_entity.dart';
import '../datasources/aplicacion_remote_datasoruce.dart';

class AplicacionRepositoryImpl implements AplicacionRepository {
  final AplicacionRemoteDataSource remoteDataSource;

  AplicacionRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<AplicacionEntity>> fetchAplicacion() async {
    try {
      final aplicacionModels = await remoteDataSource.fetchAplicacion();
      return aplicacionModels.toList();
    } catch (e) {
      throw Exception('Error al cargar aplicaciones');
    }
  }
}