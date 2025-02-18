import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textil_investigation/data/datasources/aplicacion_remote_datasoruce.dart';
import 'package:textil_investigation/data/datasources/composicion_remote_datasource.dart';
import 'package:textil_investigation/data/datasources/conservacion_remote_datasource.dart';
import 'package:textil_investigation/data/datasources/estructruca_ligamento_remote_datasource.dart';
import 'package:textil_investigation/data/datasources/telas_remote_datasource.dart';
import 'package:textil_investigation/data/datasources/tipo_estructural_remote_datasource.dart';
import 'package:textil_investigation/data/repositories/aplicacion_repository_impl.dart';
import 'package:textil_investigation/data/repositories/composicion_repository_impl.dart';
import 'package:textil_investigation/data/repositories/conservacion_repository_impl.dart';
import 'package:textil_investigation/data/repositories/estructura_ligamento_repository_impl.dart';
import 'package:textil_investigation/data/repositories/telas_repository_impl.dart';
import 'package:textil_investigation/domain/repositories/aplicacion_repository.dart';
import 'package:textil_investigation/domain/repositories/composicion_repository.dart';
import 'package:textil_investigation/domain/repositories/conservacion_repository.dart';
import 'package:textil_investigation/domain/repositories/estructura_ligamento_repository.dart';
import 'package:textil_investigation/domain/repositories/telas_repository.dart';
import 'package:textil_investigation/domain/repositories/tipo_estructural_repository.dart';
import 'package:textil_investigation/domain/usecases/fetch_aplicacion_usecase.dart';
import 'package:textil_investigation/domain/usecases/fetch_composicion_usecase.dart';
import 'package:textil_investigation/domain/usecases/fetch_conservacion_usecase.dart';
import 'package:textil_investigation/domain/usecases/fetch_estructura_ligamento_usecase.dart';
import 'package:textil_investigation/domain/usecases/fetch_filtered_telas_usecase.dart';
import 'package:textil_investigation/domain/usecases/fetch_tipo_estructural_usecase.dart';
import 'package:textil_investigation/presentations/blocs/campos/campos_bloc.dart';
import 'package:textil_investigation/presentations/blocs/index_bloc.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_bloc.dart';

import 'data/repositories/tipo_estructural_repository_impl.dart';

final GetIt sl = GetIt.instance;

Future<void> configureDependencies() async {
  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton<http.Client>(() => http.Client());

  // 🔹 DataSources
  sl.registerLazySingleton<TelasRemoteDataSource>(
    () => TelasRemoteDataSourceImpl(client: sl<http.Client>()),
  );
  sl.registerLazySingleton<ComposicionRemoteDataSource>(
      () => ComposicionRemoteDataSourceImpl(client: sl<http.Client>()));
  sl.registerLazySingleton<AplicacionRemoteDataSource>(
      () => AplicacionRemoteDataSourceImpl(client: sl<http.Client>()));
  sl.registerLazySingleton<ConservacionRemoteDataSource>(
      () => ConservacionRemoteDataSourceImpl(client: sl<http.Client>()));
  sl.registerLazySingleton<EstructrucaLigamentoRemoteDataSource>(() =>
      EstructrucaLigamentoRemoteDataSourceImpl(client: sl<http.Client>()));
  sl.registerLazySingleton<TipoEstructuralRemoteDataSource>(
      () => TipoEstructuralRemoteDataSourceImpl(client: sl<http.Client>()));

  // 🔹 Repositories
  sl.registerLazySingleton<TelasRepository>(
    () => TelasRepositoryImpl(remoteDataSource: sl<TelasRemoteDataSource>()),
  );
  sl.registerLazySingleton<ComposicionRepository>(
    () => ComposicionRepositoryImpl(remoteDataSource: sl<ComposicionRemoteDataSource>()),
  );
  sl.registerLazySingleton<AplicacionRepository>(
      () => AplicacionRepositoryImpl(remoteDataSource: sl<AplicacionRemoteDataSource>()));
  sl.registerLazySingleton<ConservacionRepository>(
      () => ConservacionRepositoryImpl(remoteDataSource: sl<ConservacionRemoteDataSource>()));
  sl.registerLazySingleton<EstructuraLigamentoRepository>(
      () => EstructuraLigamentoRepositoryImpl(remoteDataSource: sl<EstructrucaLigamentoRemoteDataSource>()));
  sl.registerLazySingleton<TipoEstructuralRepository>(
        () => TipoEstructuralRepositoryImpl(remoteDataSource: sl<TipoEstructuralRemoteDataSource>()));

  // 🔹 Use Cases
  sl.registerLazySingleton<FetchFilteredTelasUseCase>(
    () => FetchFilteredTelasUseCase(repository: sl<TelasRepository>()),
  );
  sl.registerLazySingleton<FetchComposicionUseCase>(
    () => FetchComposicionUseCase(repository: sl<ComposicionRepository>()),
  );
  sl.registerLazySingleton<FetchAplicacionUseCase>(
      () => FetchAplicacionUseCase(repository: sl<AplicacionRepository>()));
  sl.registerLazySingleton<FetchConservacionUseCase>(
      () => FetchConservacionUseCase(repository: sl<ConservacionRepository>()));
  sl.registerLazySingleton<FetchEstructuraLigamentoUseCase>(
      () => FetchEstructuraLigamentoUseCase(repository: sl<EstructuraLigamentoRepository>()));
  sl.registerLazySingleton<FetchTipoEstructuralUseCase>(
      () => FetchTipoEstructuralUseCase(repository: sl<TipoEstructuralRepository>()));
      
  // 🔹 BLoCs
  sl.registerFactory<IndexBloc>(() => IndexBloc());
  sl.registerFactory<TelasBloc>(
    () => TelasBloc(fetchFilteredTelasUseCase: sl<FetchFilteredTelasUseCase>()),
  );
  sl.registerFactory<CamposBloc>(() => CamposBloc(
        fetchComposicionUseCase: sl<FetchComposicionUseCase>(),
        fetchAplicacionUseCase: sl<FetchAplicacionUseCase>(),
        fetchConservacionUseCase: sl<FetchConservacionUseCase>(),
        fetchTipoEstructuralUseCase: sl<FetchTipoEstructuralUseCase>(),
        fetchEstructuraLigamentoUseCase: sl<FetchEstructuraLigamentoUseCase>(),
      ));
}
