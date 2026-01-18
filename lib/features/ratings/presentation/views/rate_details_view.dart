import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_responsive_dialog.dart';
import 'package:beit_alnakha_admin/features/ratings/presentation/widgets/ratings_view/rate_details_section.dart';
import 'package:flutter/material.dart';

class RateDetailsView extends StatelessWidget {
  const RateDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomResponsiveDialog(
      title: AppStrings.ratingDetails,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppSize.size16,
            right: AppSize.size16,
            left: AppSize.size16,
            bottom: AppSize.size16,
          ),
          child: Column(
            spacing: AppSize.size12,
            children: [RateDetailsSection()],
          ),
        ),
      ),
    );
  }
}
