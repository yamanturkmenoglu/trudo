import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

_slideTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
    AxisDirection direction) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: _getOffsets(direction),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: Curves.fastOutSlowIn,
        //fastOutSlowIn
      ),
    ),
    child: child,
  );
}

_getOffsets(AxisDirection direction) {
  switch (direction) {
    case AxisDirection.up:
      return const Offset(0, 1);
    case AxisDirection.down:
      return const Offset(0, -1);
    case AxisDirection.right:
      return const Offset(1, 0);
    case AxisDirection.left:
      return const Offset(-1, 0);
  }
}

class PageTransition extends CustomTransitionPage {
  final Widget page;
  final GoRouterState state;

  PageTransition({
    required this.page,
    required this.state,
  }) : super(
          transitionDuration: const Duration(
            milliseconds: 200,
          ),
          reverseTransitionDuration: const Duration(
            milliseconds: 200,
          ),
          key: state.pageKey,
          child: page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              _slideTransition(
            context,
            animation,
            secondaryAnimation,
            child,
            AxisDirection.right,
          ),
        );
}