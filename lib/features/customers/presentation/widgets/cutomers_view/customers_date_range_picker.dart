import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_date_range_picker.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_date_range_picker_icon.dart';
import 'package:flutter/material.dart';

class CustomersDateRangePicker extends StatelessWidget {
  const CustomersDateRangePicker({super.key});

  @override
  Widget build(BuildContext context) {
    if(context.width < ScreenWidthBreakpoints.desktop){
return CustomDateRangePickerIcon(controller: TextEditingController(),);
    }else{
      return SizedBox(
        width: AppSize.sizeForCustomDateRangePicker,
        child: CustomDateRangePicker(
          controller: TextEditingController(),
          paddingForBottom: 0,
        ),
      );
    }

  }
}