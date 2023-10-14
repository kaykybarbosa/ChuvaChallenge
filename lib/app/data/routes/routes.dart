import 'package:chuva_dart/app/chuva_dart.dart';
import 'package:chuva_dart/app/pages/calendar_page.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: "/calendar",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const ChuvaDart(),
    ),
    GoRoute(
      path: "/calendar",
      builder: (context, state) => const Calendar(),
    ),
  ]
);