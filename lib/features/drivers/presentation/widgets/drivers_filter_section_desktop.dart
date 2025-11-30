import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/widgets/add_driver_button.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/widgets/delivery_type_drop_down.dart';
import 'package:beit_alnakha_admin/features/drivers/presentation/widgets/drivers_search_field.dart';
import 'package:flutter/material.dart';

class DriversFilterSectionDesktop extends StatelessWidget {
  const DriversFilterSectionDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.size24,
      ),
            child: Row(
              spacing: AppSize.size10,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.driversMenu,
                      maxLines: 1,
                      style: AppStyles.semiBold20(context),
                    ),
                  ),
                ),
                DriversSearchField(),
                DeliveryTypeDropDown(),
                AddDriverButton(),
              ],
            ),
          );
  }
}
