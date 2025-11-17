import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
    this.useFullScreenWidth = false,
  });

  final WidgetBuilder mobileLayout;
  final WidgetBuilder tabletLayout;
  final WidgetBuilder desktopLayout;

  /// لو true → يحسب بعرض الشاشة بالكامل
  /// لو false → يحسب بالمساحة المتاحة فقط (تتأثر بالسايد بار)
  final bool useFullScreenWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = useFullScreenWidth
            ? MediaQuery.of(context)
                  .size
                  .width // عرض الشاشة الكامل
            : constraints.maxWidth; // العرض المتاح فقط

        if (width < ScreenWidthBreakpoints.tablet) {
          return mobileLayout(context);
        } else if (width < ScreenWidthBreakpoints.desktop) {
          return tabletLayout(context);
        } else {
          return desktopLayout(context);
        }
      },
    );
  }
}
