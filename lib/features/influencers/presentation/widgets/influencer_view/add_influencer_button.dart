import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_button.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_elevated_button.dart';
import 'package:beit_alnakha_admin/features/influencers/presentation/views/add_influencer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddInfluencerButton extends StatelessWidget {
  const AddInfluencerButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.width < ScreenWidthBreakpoints.desktop) {
      return CustomContainerButton(
        imagePath: AppAssets.add,
        iconColor: AppColors.white,
        backgroundColor: AppColors.primary,
        onTap: () {
          showAddInfluencerDialog(context: context);
        },
      );
    } else {
      return CustomElevatedButton(
        width: 160,
        onPressed: () {
          showAddInfluencerDialog(context: context);
        },
        title: AppStrings.addInfluencer,
        icon: SvgPicture.asset(
          AppAssets.add,
          colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        ),
      );
    }
  }

  void showAddInfluencerDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return AddInfluencerView();
      },
    );
  }
}
