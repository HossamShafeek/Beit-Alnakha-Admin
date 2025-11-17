import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class PageFadeTransitionRouter<T> extends CustomTransitionPage<T> {
  PageFadeTransitionRouter({
    required super.key,
    required super.child,
    Duration duration = const Duration(seconds: 1),
  }) : super(
         transitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           return FadeTransition(opacity: animation, child: child);
         },
       );
}

class PageFadeTransitionWidget extends PageRouteBuilder {
  final Widget page;

  PageFadeTransitionWidget({required this.page})
    : super(
        transitionDuration: const Duration(seconds: 1),
        pageBuilder: (context, animation, secondaryAnimation) => page,
      );

  @override
  Widget buildTransitions(context, animation, secondaryAnimation, child) {
    return FadeTransition(opacity: animation, child: child);
  }
}
