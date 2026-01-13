import 'package:beit_alnakha_admin/core/utils/app_size.dart';
import 'package:beit_alnakha_admin/core/utils/app_strings.dart';
import 'package:beit_alnakha_admin/core/widgets/account_statement_data_table.dart';
import 'package:beit_alnakha_admin/core/widgets/custom_responsive_dialog.dart';
import 'package:beit_alnakha_admin/core/widgets/dialog_actions.dart';
import 'package:beit_alnakha_admin/core/widgets/settle_selected_points_widget.dart';
import 'package:flutter/material.dart';

class InfluencerAccountStatementView extends StatelessWidget {
  const InfluencerAccountStatementView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomResponsiveDialog(
      widthInTabletAndDesktop: 900,
      title: AppStrings.accountStatement,
      bottomWidget: Column(
        children: [
          SettleSelectedPointsWidget(),
          DialogActions(
            buttonTitle: AppStrings.confirmPointsSettlement,
            onPressed: () {},
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppSize.size16,
          right: AppSize.size16,
          left: AppSize.size16,
        ),
        child: AccountStatementDataTable(),
      ),
    );
  }
}
