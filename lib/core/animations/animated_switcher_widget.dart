import 'package:flutter/material.dart';

class AnimatedSwitcherWidget extends StatelessWidget {
  const AnimatedSwitcherWidget({
    super.key,
    this.duration,
    required this.child,
    this.begin,
    this.end,
    required this.switcher,
    this.secondaryChild,
  });

  final Duration? duration;
  final Widget child;
  final Offset? begin;
  final Offset? end;
  final bool switcher;
  final Widget? secondaryChild;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration ?? const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        final offsetAnimation = Tween<Offset>(
          begin: begin ?? const Offset(-1, 0),
          end: end ?? Offset.zero,
        ).animate(animation);
        return SlideTransition(position: offsetAnimation, child: child);
      },
      child: switcher ? child : secondaryChild ?? const SizedBox.shrink(),
    );
  }
}
