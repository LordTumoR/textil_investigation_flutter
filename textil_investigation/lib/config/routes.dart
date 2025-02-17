import 'package:go_router/go_router.dart';
import 'package:textil_investigation/presentations/screens/home_screen.dart';
import 'package:textil_investigation/presentations/screens/start_screen.dart';
import 'package:textil_investigation/presentations/screens/tela_screen.dart';
import 'package:textil_investigation/presentations/screens/telas_screen.dart';

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
      routes: [
        GoRoute(
          path: '/telas',
          builder: (context, state) => const TelaScreen(),
        ),
        GoRoute(
            path: '/tela/:id',
            builder: (context, state) {
              final telaId = int.parse(state.pathParameters['id']!);
              return TelaDetailScreen(telaId: telaId);
            }),
      ],
    ),
  ],
);
