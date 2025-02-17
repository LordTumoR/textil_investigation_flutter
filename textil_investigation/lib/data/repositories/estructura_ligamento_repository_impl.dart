import 'package:textil_investigation/data/datasources/estructruca_ligamento_remote_datasource.dart';
import 'package:textil_investigation/domain/entities/estructura_ligamento_entity.dart';
import 'package:textil_investigation/domain/repositories/estructura_ligamento_repository.dart';

class EstructuraLigamentoRepositoryImpl implements EstructuraLigamentoRepository {
  final EstructrucaLigamentoRemoteDataSource remoteDataSource;

  EstructuraLigamentoRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<EstructuraLigamentoEntity>> fetchEstructuraLigamento() async {
    try {
      final estructuraLigamentoModels = await remoteDataSource.fetchEstructuraLigamento();
      return estructuraLigamentoModels.toList();
    } catch (e) {
      throw Exception('Error al cargar estructuras de ligamento');
    }
  }
}