import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:textil_investigation/data/datasources/telas_remote_datasource.dart';
import 'package:textil_investigation/data/repositories/telas_repository_impl.dart';
import 'package:textil_investigation/domain/repositories/telas_repository.dart';
import 'package:textil_investigation/domain/usecases/fetch_filtered_telas_usecase.dart';
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

  // 🔹 Repositories
  sl.registerLazySingleton<TelasRepository>(
    () => TelasRepositoryImpl(remoteDataSource: sl<TelasRemoteDataSource>()),
  );

  // 🔹 Use Cases
  sl.registerLazySingleton<FetchFilteredTelasUseCase>(
    () => FetchFilteredTelasUseCase(repository: sl<TelasRepository>()),
  );

  // 🔹 BLoCs
  sl.registerFactory<IndexBloc>(() => IndexBloc());

  sl.registerFactory<TelasBloc>(
    () => TelasBloc(fetchFilteredTelasUseCase: sl<FetchFilteredTelasUseCase>()),
  );
}
