import 'package:flutter/widgets.dart';
import 'package:textil_investigation/injection.dart' as di;
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/presentations/screens/home_screen.dart';
import 'package:textil_investigation/presentations/screens/start_screen.dart';
import 'package:textil_investigation/presentations/widgets/tactile_widget.dart';

final GoRouter router = GoRouter(
  initialLocation: '/start',
  routes: [
    GoRoute(
      path: '/start',
      builder: (context, state) => const StartScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),

    // GoRoute(
    //   path: 'no-name',
    //   builder: (context, state) => NoNameScreen(),
    // ),
    // GoRoute(
    //   path: 'have-sample',
    //   builder: (context, state) => HaveSampleScreen(),
    // ),
    // GoRoute(
    //   path: 'no-sample',
    //   builder: (context, state) => NoSampleScreen(),
    // ),
    // GoRoute(
    //   path: 'characteristics',
    //   builder: (context, state) => CharacteristicsScreen(),
    // ),
  ],
);
