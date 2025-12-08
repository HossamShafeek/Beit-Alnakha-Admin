import 'package:beit_alnakha_admin/core/responsive_helper/responsive_app_extensions.dart';
import 'package:beit_alnakha_admin/core/responsive_helper/screen_width_breakpoints.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_button.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_dropdown.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_popup_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequestsTypeDropDown extends StatelessWidget {
  const RequestsTypeDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    if (context.width < ScreenWidthBreakpoints.desktop) {
      return CustomPopupMenuButton(
        onSelected: (value) {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.size12),
        ),
        items:  AppStrings.requestsTypeForDropDown
              .map((e) => PopupMenuItem<String>(value: e, child: Text(e, style: AppStyles.medium16(context))))
              .toList(),
        child: CustomContainerButton(
          imagePath: AppAssets.status,
          size: AppSize.size48,
        ),
      );
    } else {
      return SizedBox(
        width: 150,
        child: CustomDropdown(
          controller: TextEditingController(),
          hintText: AppStrings.requestType,
          prefixIcon: FittedBox(
            fit: BoxFit.scaleDown,
            child: SvgPicture.asset(AppAssets.status),
          ),
          items: AppStrings.requestsTypeForDropDown
              .map((e) => PopupMenuItem<String>(value: e, child: Text(e, style: AppStyles.medium16(context))))
              .toList(),
        ),
      );
    }
  }
}
