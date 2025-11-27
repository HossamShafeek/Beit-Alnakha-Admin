import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_date_range_picker.dart';
import 'package:flutter/material.dart';

class DriversDateRangePicker extends StatelessWidget {
  const DriversDateRangePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.sizeForCustomDateRangePicker,
      child: CustomDateRangePicker(
        controller: TextEditingController(),
        paddingForBottom: 0,
      ),
    );
  }
}