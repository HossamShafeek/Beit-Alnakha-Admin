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

class RegionsDropDown extends StatelessWidget {
  const RegionsDropDown({
    super.key,
    required this.controller,
    this.paddingForBottom,
    this.paddingForTop,
  });

  final TextEditingController controller;

  final double? paddingForBottom;
  final double? paddingForTop;

 final List<String> baghdadAreas = const[
    "الأعظمية",
    "الكاظمية",
    "المنصور",
    "الكرادة",
    "الرصافة",
    "الرحيد",
    "الرسالة",
    "ساحة النسور",
    "الحي الصناعي",
    "الظاهرية",
    "الدورة",
    "الزبون",
    "الصدر (مدينة الصدر)",
    "الجاكرية",
    "النهروان",
    "الشهدا",
    "اليرموك",
    "باب المعظم",
    "البيّاعة",
    "الزهور",
    "الوركاء",
    "الاعظمية القديمة",
    "العامرية",
    "دورا",
    "الياسمين",
    "شارع فلسطين",
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
      hintText: AppStrings.region,
      readOnly: true,
      suffixIcon: FittedBox(
        fit: BoxFit.scaleDown,
        child: SvgPicture.asset(AppAssets.arrowDown),
      ),
      prefixIcon: FittedBox(
        fit: BoxFit.scaleDown,
        child: SvgPicture.asset(
          AppAssets.region,
          colorFilter: ColorFilter.mode(AppColors.grey7A, BlendMode.srcIn),
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CustomResponsiveDialog(
            widthInTabletAndDesktop: 550,
            title: AppStrings.chooseRegion,
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
                      itemCount: baghdadAreas.length,
                      separatorBuilder: (context, index) =>
                      const Gap(AppSize.size8),
                      itemBuilder: (context, index) {
                        return Material(
                          child: ListTile(
                            tileColor: AppColors.grey200,
                            horizontalTitleGap: 0,
                            leading: SvgPicture.asset(
                              AppAssets.region,
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
                              baghdadAreas[index],
                              style: AppStyles.medium16(context),
                            ),
                            onTap: () {
                              controller.text = baghdadAreas[index];
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