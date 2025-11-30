import 'package:flutter/material.dart';

class CustomPopupMenuButton<T> extends StatefulWidget {
  const CustomPopupMenuButton({
    super.key,
    required this.child,
    required this.items,
    this.onSelected,
    this.offset = const Offset(0, 5),
    this.shape,
    this.useRootNavigator = true,
    this.elevation,
    this.color,
    this.constraints,
  });

  /// بدل child
  final Widget child;

  final List<PopupMenuEntry<T>> items;
  final void Function(T)? onSelected;
  final Offset offset;
  final bool useRootNavigator;
  final ShapeBorder? shape;
  final double? elevation;
  final Color? color;
  final BoxConstraints? constraints;

  @override
  State<CustomPopupMenuButton<T>> createState() =>
      _CustomPopupMenuButtonState<T>();
}

class _CustomPopupMenuButtonState<T> extends State<CustomPopupMenuButton<T>> {
  bool _isOpen = false;
  double? lastWidth;

  void _openMenu() async {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);

    _isOpen = true;

    final value = await showMenu<T>(
      context: context,
      useRootNavigator: widget.useRootNavigator,
      shape: widget.shape,
      elevation: widget.elevation,
      color: widget.color,
      constraints: widget.constraints,
      position: RelativeRect.fromLTRB(
        position.dx + widget.offset.dx,
        position.dy + renderBox.size.height + widget.offset.dy,
        position.dx + renderBox.size.width,
        position.dy,
      ),
      items: widget.items,
    );

    _isOpen = false;

    if (value != null) {
      widget.onSelected?.call(value);
    }
  }

  void _handleResize(double currentWidth) {
    if (_isOpen && lastWidth != null && currentWidth != lastWidth) {
      Navigator.of(context, rootNavigator: true).maybePop();
      _isOpen = false;
    }
    lastWidth = currentWidth;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _handleResize(MediaQuery.of(context).size.width);
        });

        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _openMenu,
          child: widget.child,
        );
      },
    );
  }
}
