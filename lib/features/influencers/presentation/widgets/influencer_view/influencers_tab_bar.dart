import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';

class InfluencersTabBar extends StatelessWidget {
  const InfluencersTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      onTap: (index) {},
      titles: AppStrings.influencersStatusForTabBar,
    );
  }
}
