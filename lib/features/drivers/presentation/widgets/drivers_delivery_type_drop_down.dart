import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DriversDeliveryTypeDropDown extends StatelessWidget {
  const DriversDeliveryTypeDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: CustomDropdown(
        controller: TextEditingController(),
        hintText: AppStrings.requestType,
        prefixIcon: FittedBox(
          fit: BoxFit.scaleDown,
          child: SvgPicture.asset(AppAssets.status),
        ),
        items: [
          'الكل',
          'داخلي',
          'خارجي',
        ].map((e) => PopupMenuItem<String>(value: e, child: Text(e))).toList(),
      ),
    );
  }
}
