import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/config/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: const [
//         //BlocProvider(create: (_) => sl<LoginBloc>()),
//         //BlocProvider(create: (_) => sl<RoutinesBloc>()),
//       ],
//       child: MaterialApp.router(
//         routerConfig: router,
//         debugShowCheckedModeBanner: false,
//         title: 'ProyectoFinal tracktrail',
//         theme: ThemeData(primarySwatch: Colors.blue),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'ProyectoFinal tracktrail',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
