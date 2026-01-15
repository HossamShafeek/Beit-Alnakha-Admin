import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_tab_bar.dart';
import 'package:flutter/material.dart';

class AwardsTabBar extends StatelessWidget {
  const AwardsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTabBar(
      onTap: (index) {},
      titles: AppStrings.awardsStatusForTabBar,
    );
  }
}
