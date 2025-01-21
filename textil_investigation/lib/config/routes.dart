import 'package:flutter/widgets.dart';
import 'package:textil_investigation/injection.dart' as di;
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textil_investigation/presentations/screens/home_screen.dart';
import 'package:textil_investigation/presentations/screens/start_screen.dart';

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
  ],
);
