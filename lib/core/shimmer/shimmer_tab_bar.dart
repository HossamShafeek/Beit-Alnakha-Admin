import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/shimmer/shimmer_container_effect.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';

class ShimmerTabBar extends StatelessWidget {
  const ShimmerTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.size8),
          child: SizedBox(
            height: AppSize.size40,
            width: context.withFormFactor(
              onMobile: constraints.maxWidth,
              onTablet: 400,
              onDesktop: 400,
            ),
            child: Row(
              spacing: AppSize.size16,
              children: [
                Expanded(child: ShimmerContainerEffect(height: AppSize.size48)),
                Expanded(child: ShimmerContainerEffect(height: AppSize.size48)),
                Expanded(child: ShimmerContainerEffect(height: AppSize.size48)),
              ],
            ),
          ),
        );
      },
    );
  }
}
