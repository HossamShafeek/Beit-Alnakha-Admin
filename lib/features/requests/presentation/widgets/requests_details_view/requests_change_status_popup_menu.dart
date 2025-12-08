import 'dart:math';

import 'package:beit_alnakha_admin/core/functions/get_status_color.dart';
import 'package:beit_alnakha_admin/core/functions/get_status_icon.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_dialog.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_popup_menu_button.dart';
import 'package:beit_alnakha_admin/core/widgets/status_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequestsChangeStatusPopupMenu extends StatelessWidget {
  const RequestsChangeStatusPopupMenu({super.key});
  String getRandomStatus() {
    Random random = Random();
    return AppStrings.requestsStatusForPopupMenu[random.nextInt(
      AppStrings.requestsStatusForPopupMenu.length,
    )];
  }

  void showChangeStatusDialog(
      {required BuildContext context, required String status}) {
    showDialog(context: context, builder: (context) {
      return CustomDialog(iconSvgPath: getStatusIcon(status),
        iconSvgColor: getStatusColor(status)[0],
        iconBackgroundColor: getStatusColor(status)[1],
        buttonColorForPrimaryButton: getStatusColor(status)[0],
        buttonTitleForPrimaryButton: status,
        buttonTitleForSecondaryButton: AppStrings.cancel,
        title: AppStrings.changeStatus,
        subtitle: AppStrings.youAreSureChangeRequestStatus,
      );
    },);
  }


  @override
  Widget build(BuildContext context) {
    return CustomPopupMenuButton(
      onSelected: (value) {
        showChangeStatusDialog(context: context, status: value);
      },
      items: AppStrings.requestsStatusForPopupMenu
          .map(
            (e) =>
            PopupMenuItem<String>(
              value: e,
              child: StatusContainerWidget(status: e),
            ),
      )
          .toList(),
      child: Container(
        padding: const EdgeInsets.all(AppSize.size6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.size12),
          color: AppColors.grey100,
        ),
        child: Row(
          spacing: AppSize.size4,
          children: [
            StatusContainerWidget(status: getRandomStatus()),
            SvgPicture.asset(AppAssets.arrowDown),
          ],
        ),
      ),
    );
  }
}
