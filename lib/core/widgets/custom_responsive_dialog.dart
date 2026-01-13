import 'package:beit_alnakha_admin/core/animations/scale_transition_animation.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/dialog_app_bar.dart';
import 'package:flutter/material.dart';

class CustomResponsiveDialog extends StatelessWidget {
  const CustomResponsiveDialog({
    super.key,
    required this.child,
    required this.title,
     this.bottomWidget,
    this.widthInTabletAndDesktop,
  });

  final Widget child;
  final Widget? bottomWidget;
  final String title;
  final double? widthInTabletAndDesktop;

  @override
  Widget build(BuildContext context) {
    return ScaleTransitionAnimation(
      duration: const Duration(milliseconds: 500),
      child: Center(
        child: SizedBox(
          width: context.withFormFactor(
            onMobile: double.infinity,
            onTablet:widthInTabletAndDesktop?? 600,
            onDesktop: widthInTabletAndDesktop??600,
          ),
          child: Padding(
            padding: context.withFormFactor(
              onMobile:  EdgeInsets.zero,
              onTablet: const EdgeInsets.all(AppSize.size24),
              onDesktop: const EdgeInsets.all(AppSize.size24),
            ),
            child: Material(
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: context.withFormFactor(
                  onMobile: BorderRadius.zero,
                  onTablet: BorderRadius.circular(AppSize.size16),
                  onDesktop: BorderRadius.circular(AppSize.size16),
                ),
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: context.withFormFactor(
                    onMobile: MainAxisSize.max,
                    onTablet: MainAxisSize.min,
                    onDesktop: MainAxisSize.min,
                  ),
                  children: [
                    DialogAppBar(title: title),
                    if (context.width < ScreenWidthBreakpoints.tablet) ...[
                      Expanded(child: child),
                    ] else ...[
                      Flexible(child: child),
                    ],
                   ?bottomWidget
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
