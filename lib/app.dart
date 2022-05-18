import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'bloc/var_mixin.dart';
import 'components/main_view.dart';
import 'package:fluent_ui/fluent_ui.dart';

final GoRouter _router = GoRouter(
  initialLocation: '/',
  errorBuilder: (BuildContext ctx, GoRouterState state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (BuildContext ctx, GoRouterState state) {
        return MainView();
      },
    ),
  ],
);

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error'),
    );
  }
}

class App extends HookWidget with HookWidgetMixin {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = useStream(controllers.darkModeStream);

    return FluentApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Invoice App',
      color: Colors.transparent,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: theme.data ?? false ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
