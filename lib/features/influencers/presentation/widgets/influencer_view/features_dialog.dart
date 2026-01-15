import 'package:beit_alnakha_admin/core/functions/get_meal_grid_view_count.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_constants.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_responsive_dialog.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_text_field.dart';
import 'package:beit_alnakha_admin/core/widgets/dialog_actions.dart';
import 'package:beit_alnakha_admin/core/widgets/search_field.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/widgets/influencer_view/meal_grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeaturesDialog extends StatelessWidget {
  const FeaturesDialog({
    super.key,
    required this.controller,
    this.paddingForBottom,
    this.paddingForTop,
  });

  final TextEditingController controller;

  final double? paddingForBottom;
  final double? paddingForTop;

  final List<String> features = const [
    'ليزر يضهر تميزك',
    'ترحيب متميز',
    'أضواء موجهة ملكية',
    'الاغنية المفضلة',
    'ليزر يضهر تميزك',
    'الكتابة المتميزة',
    'شكر ومشاركة',
    'الاغنية المفضلة',
    'عزف خاص بالكمان',
    'دخان الغيوم',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      focusedBorder: AppConstants.removeBorder,
      paddingForTop: paddingForTop,
      paddingForBottom: paddingForBottom,
      controller: controller,
      validator: (value) {
        return null;
      },
      hintText: AppStrings.addFavoriteFeatures,
      readOnly: true,
      suffixIcon: FittedBox(
        fit: BoxFit.scaleDown,
        child: SvgPicture.asset(AppAssets.arrowDown),
      ),
      prefixIcon: FittedBox(
        fit: BoxFit.scaleDown,
        child: SvgPicture.asset(
          AppAssets.features,
          colorFilter: ColorFilter.mode(AppColors.grey7A, BlendMode.srcIn),
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CustomResponsiveDialog(
            widthInTabletAndDesktop: 550,
            title: AppStrings.chooseFeatures,
            bottomWidget: DialogActions(
              buttonTitle: AppStrings.addFeaturesForInfluencer,
              onPressed: () {},
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: AppSize.size16),
              child: Column(
                spacing: AppSize.size12,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.size16,
                    ),
                    child: SearchField(
                      radius: AppSize.size12,
                      controller: TextEditingController(),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.size16,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemCount: features.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: AppSize.size8,
                        crossAxisSpacing: AppSize.size8,
                        crossAxisCount: getMealGridViewCount(context: context),
                        mainAxisExtent: context.width < 630 ? 180 : 160,
                      ),
                      itemBuilder: (context, index) {
                        return MealGridViewItem(
                            isFeature: true,
                            name: features[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
