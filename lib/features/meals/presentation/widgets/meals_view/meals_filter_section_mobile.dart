import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/features/meals/presentation/widgets/meals_view/add_meal_button.dart';
import 'package:beit_alnakha_admin/features/meals/presentation/widgets/meals_view/meals_search_field.dart';
import 'package:flutter/material.dart';

class MealsFilterSectionMobile extends StatelessWidget {
  const MealsFilterSectionMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.size16),
      child: Row(
        spacing: AppSize.size10,
        children: [
          Expanded(child: MealsSearchField()),
          AddMealButton(),
        ],
      ),
    );
  }
}
