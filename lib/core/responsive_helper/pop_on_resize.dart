import 'package:flutter/material.dart';

class PopOnResize extends StatefulWidget {
  final Widget child;
  const PopOnResize({super.key, required this.child});

  @override
  State<PopOnResize> createState() => _PopOnResizeState();
}

class _PopOnResizeState extends State<PopOnResize> {
  double? _lastWidth;
  bool _popped = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (!_popped && _lastWidth != null && _lastWidth != width) {
      _popped = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && Navigator.of(context).canPop()) {
          Navigator.of(context).pop();
        }
      });
    }

    _lastWidth = width;

    return widget.child;
  }
}
