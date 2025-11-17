import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/shimmer/shimmer_circle_avatar_effect.dart';
import 'package:beit_alnakha_admin/core/shimmer/shimmer_container_effect.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';

class ShimmerReviewersGridView extends StatelessWidget {
  const ShimmerReviewersGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          itemCount: 40,
          physics: NeverScrollableScrollPhysics(),
          padding: context.width < ScreenWidthBreakpoints.desktop
              ? const EdgeInsets.only(
                  top: AppSize.size8,
                  bottom: AppSize.size12,
                )
              : EdgeInsets.only(
                  left: AppSize.size20,
                  right: AppSize.size20,
                  bottom: AppSize.size20,
                ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.withFormFactor(
              onMobile: 1 + constraints.maxWidth ~/ 650,
              onTablet: 1 + constraints.maxWidth ~/ 480,
              onDesktop: constraints.maxWidth < 630
                  ? 1
                  : 1 + constraints.maxWidth ~/ 450,
            ),
            crossAxisSpacing: context.withFormFactor(
              onMobile: AppSize.size8,
              onTablet: AppSize.size8,
              onDesktop: AppSize.size12,
            ),
            mainAxisSpacing: context.withFormFactor(
              onMobile: AppSize.size8,
              onTablet: AppSize.size8,
              onDesktop: AppSize.size12,
            ),
            mainAxisExtent: 135,
          ),
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSize.size12),
              decoration: BoxDecoration(
                color: AppColors.grey100,
                borderRadius: BorderRadius.circular(AppSize.size12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: AppSize.size12,
                    children: [
                      ShimmerCircleAvatarEffect(radius: AppSize.size20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ShimmerContainerEffect(width: 80),
                            SizedBox(height: AppSize.size8),
                            ShimmerContainerEffect(width: 120),
                          ],
                        ),
                      ),
                      ShimmerContainerEffect(
                        width: 100,
                        height: 38,
                        borderRadius: BorderRadius.circular(AppSize.size12),
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.size12,
                      vertical: AppSize.size8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(AppSize.size12),
                    ),
                    child: Row(
                      spacing: AppSize.size8,
                      children: const [
                        ShimmerContainerEffect(
                          width: AppSize.size35,
                          height: AppSize.size35,
                        ),
                        ShimmerContainerEffect(width: 80),
                        Spacer(),
                        ShimmerContainerEffect(width: 60),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
