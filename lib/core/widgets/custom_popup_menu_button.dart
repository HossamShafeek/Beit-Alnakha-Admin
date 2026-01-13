import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:flutter/material.dart';

class CustomPopupMenuButton<T> extends StatefulWidget {
  const CustomPopupMenuButton({
    super.key,
    required this.child,
    required this.items,
    this.onSelected,
    this.offset = const Offset(0, 5),
    this.shape ,
    this.useRootNavigator = true,
    this.elevation,
    this.color,
    this.constraints,
    this.splashRadius,
  });

  final Widget child;

  final List<PopupMenuEntry<T>> items;
  final void Function(T)? onSelected;
  final Offset offset;
  final bool useRootNavigator;
  final ShapeBorder? shape;
  final double? elevation;
  final double? splashRadius;
  final Color? color;
  final BoxConstraints? constraints;

  @override
  State<CustomPopupMenuButton<T>> createState() =>
      _CustomPopupMenuButtonState<T>();
}

class _CustomPopupMenuButtonState<T> extends State<CustomPopupMenuButton<T>> {
  double? lastWidth;
  bool _isMenuOpen = false;

  void _openMenu() async {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);

    _isMenuOpen = true;
    final value = await showMenu<T>(
      context: context,
      useRootNavigator: widget.useRootNavigator,
      shape: widget.shape ?? const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.size12)),
      ),
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
    _isMenuOpen = false;

    if (value != null) {
      widget.onSelected?.call(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (lastWidth != null && lastWidth != width && _isMenuOpen) {
      try {
        Navigator.of(context, rootNavigator: widget.useRootNavigator).pop();
      } catch (_) {}
      _isMenuOpen = false;
    }
    lastWidth = width;

    return InkWell(
      borderRadius: BorderRadius.circular(widget.splashRadius ?? AppSize.size24),
      onTap: _openMenu,
      child: widget.child,
    );
  }
}
