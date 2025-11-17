import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/shimmer/shimmer_container_effect.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';

class ShimmerClinicsGridView extends StatelessWidget {
  const ShimmerClinicsGridView({super.key,  this.removeTitle=false });

  final bool removeTitle;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            if (!removeTitle) ...{
           const   Gap(AppSize.size12),
            const  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  ShimmerContainerEffect(
                    width: 60,
                  ),
                  ShimmerContainerEffect(
                    width: 40,
                  ),
                ],
              ),
              const Gap(AppSize.size8),
            },
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 40,
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
                    onMobile: 1 + constraints.maxWidth ~/ 260,
                    onTablet: 1 + constraints.maxWidth ~/ 235,
                    onDesktop: 1 + constraints.maxWidth ~/ 240,
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
                  mainAxisExtent: 270,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    clipBehavior: Clip.antiAlias,
                    padding: const EdgeInsets.all(AppSize.size8),
                    decoration: BoxDecoration(
                      color: AppColors.grey100,
                      borderRadius: BorderRadius.circular(AppSize.size12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              ShimmerContainerEffect(
                                width: double.infinity,
                                height: double.infinity,
                                borderRadiusNumber: AppSize.size8,
                              ),
                              ShimmerContainerEffect(
                                width: AppSize.size50,
                                height: AppSize.size30,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(AppSize.size8),
                                  topLeft: Radius.circular(AppSize.size8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(AppSize.size12),
                        ShimmerContainerEffect(width: 60),
                        const Gap(AppSize.size8),
                        ShimmerContainerEffect(width: 140),
                        const Gap(AppSize.size12),
                        ShimmerContainerEffect(height: AppSize.size35),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
