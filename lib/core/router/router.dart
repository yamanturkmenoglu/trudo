import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trudo/core/router/routes_names.dart';
import 'routes.dart';
part 'navigation_service.dart';

class AppRouter extends ConsumerWidget {
  const AppRouter({Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(
    BuildContext,
    RouterConfig<Object> router,
  ) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(_routerProvider);
    return builder(context, router);
  }
}
