import 'package:beit_alnakha_admin/core/functions/get_status_color.dart';
import 'package:beit_alnakha_admin/core/functions/get_status_enum_name.dart';
import 'package:beit_alnakha_admin/core/functions/get_status_icon.dart';
import 'package:beit_alnakha_admin/core/helper/enums.dart';
import 'package:beit_alnakha_admin/core/utils/app_constants.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_dialog.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

void showChangeRequestStatusDialog({
  required BuildContext context,
  required RequestStatusEnum status,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        iconSvgPath: getStatusIcon(status),
        iconSvgColor: getStatusColor(status)[0],
        iconBackgroundColor: getStatusColor(status)[1],
        buttonColorForPrimaryButton: getStatusColor(status)[0],
        buttonTitleForPrimaryButton: getStatusEnumName(status),
        buttonTitleForSecondaryButton: AppStrings.cancel,
        title: AppStrings.changeStatus,
        subtitle: AppStrings.youAreSureChangeRequestStatus,
        child: status == RequestStatusEnum.cancelled
            ? Form(
                child: CustomTextField(
                  maxLines: 3,
                  paddingForTop: AppSize.size12,
                  paddingForBottom: 0,
                  maxLength: 100 ,
                  enabledBorder: AppConstants.enabledBorder,
                  hintText: AppStrings.enterCancelReason,
                  controller: TextEditingController(),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.pleaseEnterCancelReason;
                    }
                    return null;
                  },
                ),
              )
            : null,
      );
    },
  );
}
