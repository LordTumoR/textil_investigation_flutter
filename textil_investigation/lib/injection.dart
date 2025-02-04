import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:textil_investigation/presentations/blocs/index_bloc.dart';
import 'package:textil_investigation/presentations/blocs/visual/visual_bloc.dart';

final GetIt sl = GetIt.instance;

Future<void> configureDependencies() async {
  // BLoCs
  // sl.registerFactory<LoginBloc>(
  //   () => LoginBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl()),
  // );
  sl.registerFactory<IndexBloc>(
    () => IndexBloc(),
  );

  sl.registerFactory<VisualBloc>(
    () => VisualBloc(),
  );

  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton<http.Client>(() => http.Client());

  // DataSources
  // sl.registerLazySingleton<FirebaseAuthDataSource>(
  //   () => FirebaseAuthDataSource(auth: sl<FirebaseAuth>()),
  // );

  // Repositories
  // sl.registerLazySingleton<SignInRepository>(
  //   () => SignInRepositoryImpl(
  //       sl<FirebaseAuthDataSource>(), sl<SharedPreferences>()),
  // );

  // Use Cases
  // sl.registerLazySingleton<GetCompletionUseCase>(
  //   () => GetCompletionUseCase(sl()),
  // );
}
