import 'package:textil_investigation/data/datasources/tipo_estructural_remote_datasource.dart';
import 'package:textil_investigation/domain/entities/tipo_estructural_entity.dart';
import 'package:textil_investigation/domain/repositories/tipo_estructural_repository.dart';

class TipoEstructuralRepositoryImpl implements TipoEstructuralRepository {
  final TipoEstructuralRemoteDataSource remoteDataSource;

  TipoEstructuralRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<TipoEstructuralEntity>> fetchTipoEstructural() async {
    return await remoteDataSource.fetchTipoEstructural();
  }
}
