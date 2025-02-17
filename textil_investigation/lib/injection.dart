import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:textil_investigation/data/datasources/composicion_remote_datasource.dart';
import 'package:textil_investigation/data/datasources/telas_remote_datasource.dart';
import 'package:textil_investigation/data/repositories/composicion_repository_impl.dart';
import 'package:textil_investigation/data/repositories/telas_repository_impl.dart';
import 'package:textil_investigation/domain/repositories/composicion_repository.dart';
import 'package:textil_investigation/domain/repositories/telas_repository.dart';
import 'package:textil_investigation/domain/usecases/fetch_composicion_usecase.dart';
import 'package:textil_investigation/domain/usecases/fetch_filtered_telas_usecase.dart';
import 'package:textil_investigation/presentations/blocs/composicion/composicion_bloc.dart';
import 'package:textil_investigation/presentations/blocs/index_bloc.dart';
import 'package:textil_investigation/presentations/blocs/telas/telas_bloc.dart';

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

  // 🔹 Repositories
  sl.registerLazySingleton<TelasRepository>(
    () => TelasRepositoryImpl(remoteDataSource: sl<TelasRemoteDataSource>()),
  );
  sl.registerLazySingleton<ComposicionRepository>(() =>
      ComposicionRepositoryImpl(
          remoteDataSource: sl<ComposicionRemoteDataSource>()));

  // 🔹 Use Cases
  sl.registerLazySingleton<FetchFilteredTelasUseCase>(
    () => FetchFilteredTelasUseCase(repository: sl<TelasRepository>()),
  );
  sl.registerLazySingleton<FetchComposicionUseCase>(
    () => FetchComposicionUseCase(repository: sl<ComposicionRepository>()),
  );

  // 🔹 BLoCs
  sl.registerFactory<IndexBloc>(() => IndexBloc());
  sl.registerFactory<TelasBloc>(
    () => TelasBloc(fetchFilteredTelasUseCase: sl<FetchFilteredTelasUseCase>()),
  );
  sl.registerFactory<ComposicionBloc>(() => ComposicionBloc(
        fetchComposicionUseCase: sl<FetchComposicionUseCase>(),
      ));
}
