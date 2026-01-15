import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MealGridViewItem extends StatelessWidget {
  const MealGridViewItem({super.key, required this.name,  this.isFeature=false});

 final String name  ;
 final bool isFeature;

  @override
  Widget build(BuildContext context) {
    return  Material(
      child: InkWell(
        onTap: () {
          // Navigator.pop(context);
        },
        borderRadius: BorderRadius.circular(AppSize.size12),
        child: Container(
          padding: EdgeInsets.all(AppSize.size10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(
              AppSize.size12,
            ),
            border: Border.all(
              color: AppColors.greyE7,
              width: AppSize.borderSize,
            ),
          ),
          child: Column(
            spacing: AppSize.size4,
            children: [
              Expanded(
                child: isFeature ? SvgPicture.asset(AppAssets.featureVector,width: AppSize.size70):
                CustomNetworkImage(
                  backgroundColor: AppColors.grey200,
                  borderRadius: AppSize.size10,
                  image:
                  'https://cdn.alweb.com/thumbs/oceandishes/article/fit727x484/1/%D8%AA%D8%AD%D8%B6%D9%8A%D8%B1-%D8%A7%D9%84%D9%85%D8%B3%D9%83%D9%88%D9%81-%D8%A7%D9%84%D8%B9%D8%B1%D8%A7%D9%82%D9%8A.jpeg',
                ),
              ),
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: AppStyles.medium16(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
