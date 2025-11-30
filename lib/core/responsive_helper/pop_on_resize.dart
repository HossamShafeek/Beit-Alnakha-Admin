import 'package:flutter/material.dart';

class PopOnResize extends StatefulWidget {
  final Widget child;
  const PopOnResize({super.key, required this.child});

  @override
  State<PopOnResize> createState() => _PopOnResizeState();
}

class _PopOnResizeState extends State<PopOnResize> {
  double? _lastWidth;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final width = MediaQuery.of(context).size.width;

    if (_lastWidth != null && width != _lastWidth) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;

        final nav = Navigator.of(context, rootNavigator: true);


        if (nav.canPop()) {
          nav.maybePop();
        }
      });
    }

    _lastWidth = width;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
