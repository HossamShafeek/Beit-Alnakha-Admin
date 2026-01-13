import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class StatisticsDataItem extends StatelessWidget {
  const StatisticsDataItem({
    super.key,
   required this.title,
   required this.subtitle,
   required this.imagePath,
    this.disableColor=false,
  });


  final String title;
  final String subtitle;
  final String imagePath;
  final bool disableColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSize.size12),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(AppSize.size16),
      ),
      child: Row(
        spacing: AppSize.size12,
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: AppColors.whiteWithOpacity1,
            child: SvgPicture.asset(
              imagePath,
              height: AppSize.size32,
              width: AppSize.size32,
              colorFilter:disableColor?null: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: AppSize.size8,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.bold22(
                    context,
                  ).copyWith(height: 1, color: AppColors.white),
                ),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.regular14(
                    context,
                  ).copyWith(color: AppColors.greyE7).copyWith(height: 1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class StatisticModel {
  final String title;
  final String subtitle;
  final String imagePath;

  StatisticModel({required this.title, required this.subtitle, required this.imagePath});
}