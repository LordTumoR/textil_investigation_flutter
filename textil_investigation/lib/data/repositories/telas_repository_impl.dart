import 'package:textil_investigation/data/datasources/telas_remote_datasource.dart';
import 'package:textil_investigation/domain/entities/tela_entity.dart';
import 'package:textil_investigation/domain/repositories/telas_repository.dart';

class TelasRepositoryImpl implements TelasRepository {
  final TelasRemoteDataSource remoteDataSource;

  TelasRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<TelaEntity>> fetchFilteredTelas(Map<String, dynamic> filters) async {
    return await remoteDataSource.fetchFilteredTelas(filters);
  }
}
