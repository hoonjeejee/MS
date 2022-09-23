import 'package:go_router/go_router.dart';
import 'package:m1/page/home.dart';

class m1Router {
  final GoRouter m1Routers = GoRouter(routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: ((context, state) => HomePage()),
    ),
  ]);
}
