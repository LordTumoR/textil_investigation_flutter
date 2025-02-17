import 'package:textil_investigation/data/datasources/tipo_estructural_remote_datasource.dart';
import 'package:textil_investigation/domain/entities/tipo_estructural_entity.dart';
import 'package:textil_investigation/domain/repositories/tipo_estructural_repository.dart';

class TipoEstructuralRepositoryImpl implements TipoEstructuralRepository {
  final TipoEstructuralRemoteDataSource remoteDataSource;

  TipoEstructuralRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<TipoEstructuralEntity>> fetchTipoEstructural() async {
    try {
      final tipoEstructuralModels = await remoteDataSource.fetchTipoEstructural();
      return tipoEstructuralModels.toList();
    } catch (e) {
      throw Exception('Error al cargar tipos estructurales');
    }
  }
}