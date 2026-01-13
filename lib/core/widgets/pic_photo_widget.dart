import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/dashed_border_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class PicPhotoWidget extends StatelessWidget {
  const PicPhotoWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(AppSize.size12),
        child: DashedBorderContainer(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.addPhoto),
              Gap(AppSize.size4,),
              Text(
                title,
                style: AppStyles.medium16(context),
              ),
              Text(
                AppStrings.uploadImageDescription,
                style: AppStyles.semiBold14(
                  context,
                ).copyWith(color: AppColors.grey7A),
              ),
            ],
          ),
        ),
      ),
    );
  }
}