import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_constants.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_responsive_dialog.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_text_field.dart';
import 'package:beit_alnakha_admin/core/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class GovernoratesDropDown extends StatelessWidget {
  const GovernoratesDropDown({
    super.key,
    required this.controller,
    this.paddingForBottom,
    this.paddingForTop,
  });

  final TextEditingController controller;

  final double? paddingForBottom;
  final double? paddingForTop;

  final List<String> iraqGovernoratesAr = const [
    "بغداد",
    "البصرة",
    "نينوى",
    "أربيل",
    "السليمانية",
    "دهوك",
    "كركوك",
    "الأنبار",
    "صلاح الدين",
    "ديالى",
    "بابل",
    "كربلاء",
    "النجف",
    "واسط",
    "القادسية",
    "ذي قار",
    "المثنى",
    "ميسان",
    "حلبجة",
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
      hintText: AppStrings.governorate,
      readOnly: true,
      suffixIcon: FittedBox(
        fit: BoxFit.scaleDown,
        child: SvgPicture.asset(AppAssets.arrowDown),
      ),
      prefixIcon: FittedBox(
        fit: BoxFit.scaleDown,
        child: SvgPicture.asset(
          AppAssets.city,
          colorFilter: ColorFilter.mode(AppColors.grey7A, BlendMode.srcIn),
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CustomResponsiveDialog(
            widthInTabletAndDesktop: 550,
            title: AppStrings.chooseGovernorate,
            child: Padding(
              padding: const EdgeInsets.all(AppSize.size16),
              child: Column(
                spacing: AppSize.size12,
                children: [
                  SearchField(
                    radius: AppSize.size12,
                    controller: TextEditingController(),
                  ),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: iraqGovernoratesAr.length,
                      separatorBuilder: (context, index) =>
                      const Gap(AppSize.size8),
                      itemBuilder: (context, index) {
                        return Material(
                          child: ListTile(
                            tileColor: AppColors.grey200,
                            horizontalTitleGap: 0,
                            leading: SvgPicture.asset(
                              AppAssets.city,
                              colorFilter: ColorFilter.mode(
                                AppColors.grey7A,
                                BlendMode.srcIn,
                              ),
                            ),
                            trailing: RotatedBox(
                              quarterTurns: 2,
                              child: SvgPicture.asset(
                                AppAssets.arrowRight,
                                colorFilter: ColorFilter.mode(
                                  AppColors.grey7A,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            title: Text(
                              iraqGovernoratesAr[index],
                              style: AppStyles.medium16(context),
                            ),
                            onTap: () {
                              controller.text = iraqGovernoratesAr[index];
                              Navigator.pop(context);
                            },

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppSize.size12,
                              ),
                            ),
                          ),
                        );
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