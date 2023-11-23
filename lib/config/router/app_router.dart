import 'package:go_router/go_router.dart';
import 'package:cinemapedia_movil/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen()
    ),

  ]
);