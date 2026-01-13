import 'package:beit_alnakha_admin/core/functions/build_popup_menu_items.dart';
import 'package:beit_alnakha_admin/core/helper/enums.dart';
import 'package:beit_alnakha_admin/core/utils/app_assets.dart';
import 'package:beit_alnakha_admin/core/utils/app_colors.dart';
import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/utils/app_styles.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_container_button.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_elevated_button.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_network_image.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_popup_menu_button.dart';
import 'package:beit_alnakha_admin/features/agents/presentation/views/agent_account_statement_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AgentDetailsDataSectionAppBar extends StatelessWidget {
  const AgentDetailsDataSectionAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSize.size10,
      children: [
        ClipOval(
          child: CircleAvatar(
            radius: AppSize.size24,
            backgroundColor: AppColors.grey100,
            child: CustomNetworkImage(image: '', fit: BoxFit.cover),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('حسام شفيق',
                  maxLines:  1,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.medium16(context)),
              Row(
                spacing: AppSize.size4,
                children: [
                  SvgPicture.asset(
                    AppAssets.whatsAppFill,
                    height: AppSize.size16,
                    width: AppSize.size16,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '07777777777',
                      maxLines:  1,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.medium14(
                        context,
                      ).copyWith(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomElevatedButton(
          width: 120,
          height: AppSize.size52,
          onPressed: () {
            showAccountStatementDialog(context: context);
          },
          textStyle: AppStyles.medium16(
            context,
          ).copyWith(color: AppColors.white),
          title: AppStrings.accountStatement,
        ),
        CustomPopupMenuButton(

          items: buildPopupMenuItems(context, [
            MenuActionEnum.edit,
            MenuActionEnum.delete,
          ]),
          child: CustomContainerButton(
            imagePath: AppAssets.more,
            backgroundColor: AppColors.grey200,
            iconColor: AppColors.secondaryBlack,
          ),
        ),
      ],
    );
  }
  void showAccountStatementDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return AgentAccountStatementView();
      },
    );
  }
}