import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class PageSlideTransitionRouter<T> extends CustomTransitionPage<T> {
  PageSlideTransitionRouter({
    required super.key,
    required super.child,
    required AxisDirection direction,
    Duration duration = const Duration(milliseconds: 500),
  }) : super(
         transitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return SlideTransition(
             position: Tween<Offset>(
               begin: _getBeginOffset(direction),
               end: Offset.zero,
             ).animate(animation),
             child: child,
           );
         },
       );

  static Offset _getBeginOffset(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }
}

class PageSlideTransitionWidget extends PageRouteBuilder {
  final Widget page;
  final AxisDirection direction;

  PageSlideTransitionWidget({
    required this.page,
    this.direction = AxisDirection.right,
  }) : super(
         transitionDuration: const Duration(milliseconds: 500),
         pageBuilder: (context, animation, secondaryAnimation) => page,
       );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: _getBeginOffset(direction),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  static Offset _getBeginOffset(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
      case AxisDirection.right:
        return const Offset(-1, 0);
      case AxisDirection.left:
        return const Offset(1, 0);
    }
  }
}
