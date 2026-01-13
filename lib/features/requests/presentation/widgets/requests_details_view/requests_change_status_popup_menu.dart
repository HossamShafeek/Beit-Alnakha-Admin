import 'dart:math';
import 'package:beit_alnakha_admin/core/functions/get_status_enum.dart';
import 'package:beit_alnakha_admin/features/requests/presentation/widgets/show_change_request_status_dialog.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
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

  @override
  Widget build(BuildContext context) {
    return CustomPopupMenuButton(
      onSelected: (value) {
        showChangeRequestStatusDialog(context: context, status: getStatusEnum(value));
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
