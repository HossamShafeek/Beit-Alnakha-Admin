import 'package:beit_alnakha_admin/core/widgets/custom_close_button.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_divider_widget.dart';
import 'package:beit_alnakha_admin/core/widgets/dot_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:gap/gap.dart';

class DialogAppBar extends StatelessWidget {
  const DialogAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.size10),
      child: Column(
        children: [
          DotBottomSheet(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.size16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppStyles.semiBold18(
                    context,
                  ).copyWith(color: AppColors.black),
                ),
                CustomCloseButton(),

              ],
            ),
          ),
          Gap(AppSize.size3),
          CustomDividerWidget(
          ),
        ],
      ),
    );
  }
}
