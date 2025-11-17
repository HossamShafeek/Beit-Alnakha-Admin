import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/shimmer/shimmer_circle_avatar_effect.dart';
import 'package:beit_alnakha_admin/core/shimmer/shimmer_container_effect.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';

class ShimmerStatisticsWidget extends StatelessWidget {
  const ShimmerStatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.width < ScreenWidthBreakpoints.tablet ? 2 : 4,
        crossAxisSpacing: AppSize.size8,
        mainAxisSpacing: AppSize.size8,
        mainAxisExtent: 75,
      ),
     itemBuilder: (context, index) {
       return Container(
         padding: const EdgeInsets.all(AppSize.size8),
         decoration: BoxDecoration(
           color: AppColors.grey200,
           borderRadius: BorderRadius.circular(AppSize.size12),
         ),
         child: Row(
           spacing: AppSize.size8,

           children: [
             ShimmerCircleAvatarEffect(radius: 27),
             Expanded(
               child: Column(
                 spacing: AppSize.size12,
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   ShimmerContainerEffect(
                     width: 50,
                     height: AppSize.size12,
                   ),
                   ShimmerContainerEffect(
                     width: 90,
                     height: AppSize.size12,
                   ),
                 ],
               ),
             )
           ],
         ),
       );
     },
    );
  }
}
